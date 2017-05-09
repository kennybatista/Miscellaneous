//
//  GifParser.swift
//  gifme
//
//  Created by Matt Greenwell on 12/19/16.
//  Copyright © 2016 William Kalish. All rights reserved.
//

import Foundation
import UIKit

// create a typealis of the GifphyResponse tuple ( below ) which return a void. Just allows us chose an option
// we masrk it as void so that it could be expected as a function, when we call giphy completion we're allowed to pass it as an escaping argument ( because it's void ) and have it run after the function finishes running
typealias GiphyCompletion = (GiphyResponse) -> Void

// GiphyResponse enum with many
enum GiphyResponse {
    // when success is selected it will invoke GifphyResponseData (below) which will contain results ( an array of Gif structs ( that contains the urls ) )
    case success(GiphyResponseData)
    // if failure is selected we respond with a failure type
    case failure(Error)
    
}

struct GiphyResponseData {
    // Will store an array of urls to the gif
    public let results: [Gif]
    
}

class GMGiphyAPIClient {
    
    // base url where later on we add in terms at the end to make call
    let baseURLString = "https://api.giphy.com/v1/gifs/"

    init() {
        let cache = URLCache(memoryCapacity: 4 * 1024 * 1024, diskCapacity: 20 * 1024 * 1024, diskPath: nil)
        URLCache.shared = cache
    }
    
    // this function wil take in a search term, an an escaping argument that will tell us if the search succeeded or failed
    func searchGif(_ searchTerm: String, completion: @escaping GiphyCompletion) {
        print(#function)
        
        // we use percent encoding in case someone types in multiple terms, we can't pass in the URL that we're going to use to make a call blanks spaces ( it will crash our app ), that's why we add percent encoding between the blank spaces
        if let urlSafeSearchTerm = searchTerm.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) {
            let baseURL = URL(string: baseURLString)
            let url = URL(string: "\(baseURL!)search?q=\(urlSafeSearchTerm)")!
            print("url: ", url)
            // so by now we have the url and the encoded term to make the query. 
            // now we run the fetchGifs that will make the call
            // (the fetcGifs is below), we're breaking things apart to make them more modular
            // the method takes in completion as an argument, so if the functino succeeds it will move on further and make the call
            fetchGifs(with: url, completion: completion)
        } else {
            print("Error")
        }
    }
    
    // fetchGifs takes in an url, and a completion escaping, that we'll use to tell us if we've succeded with the call or failed
    func fetchGifs(with url: URL, completion: @escaping GiphyCompletion) {
        
        // construct the url using the urlcomponents, if it succeeds, store it in urlComponets variable. If it doesn't invoke our completion with a .failure
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            completion(.failure(NSError(domain: "error", code: 1, userInfo: nil)))
            return
        }
        
        
        // to our url, add the queryItems api_key
        urlComponents.queryItems?.append(URLQueryItem(name: "api_key", value: "dc6zaTOxFJmzC"))
        
        // take the url from the urlComponents, store it in a variable, then in it's clause or body, use the url to start a ession
        if let apiURL = urlComponents.url {
            let request = URLRequest(url: apiURL)
            let session = URLSession.shared

            let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                    DispatchQueue.main.async(execute: {
                        completion(.failure(error))
                    })
                    
                } else if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                        let gifs = GMGifParser.parseGifs(json)
                        completion(.success(GiphyResponseData(results: gifs)))
                        
                    } catch {
                        completion(.failure(error))
                        return
                    }
                }
            })
            task.resume()
        }
    }
    
    class func downloadGifs(url: URL?, completion: @escaping (Data?) -> () ) {

       let session = URLSession.shared
       let task = session.dataTask(with: url!, completionHandler: { (data, response, error) in
        if data != nil {
            return completion(data)
        } else {
            return completion(nil)
        }
      })
        task.resume()
    }
    
    
       
    
    
}
