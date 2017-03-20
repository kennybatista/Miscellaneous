//
//  GifParser.swift
//  gifme
//
//  Created by Matt Greenwell on 12/19/16.
//  Copyright © 2016 William Kalish. All rights reserved.
//

import Foundation

typealias GiphyCompletion = (GiphyResponse) -> Void

enum GiphyResponse {
    case success(GiphyResponseData)
    case failure(Error)
}

struct GiphyResponseData {
    public let results: [Gif]
}

class GMGiphyAPIClient {

    static let sharedClient = GMGiphyAPIClient()
    let baseURLString = "https://api.giphy.com/v1/gifs/"

    init() {
        let cache = URLCache(memoryCapacity: 4 * 1024 * 1024, diskCapacity: 20 * 1024 * 1024, diskPath: nil)
        URLCache.shared = cache
    }

    func fetchTrendingGifs(_ completion: @escaping GiphyCompletion) {
        if let baseURL = URL(string: baseURLString), let url = URL(string: "trending", relativeTo: baseURL) {
            fetchGifs(with: url, completion: completion)
        }
    }

    func searchGif(_ searchTerm: String, completion: @escaping GiphyCompletion) {
        if
            let urlSafeSearchTerm = searchTerm.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed),
            let baseURL = URL(string: baseURLString),
            let url = URL(string: "search?q=\(urlSafeSearchTerm)", relativeTo: baseURL)
        {
            fetchGifs(with: url, completion: completion)
        }
    }

    func fetchGifs(with url: URL, completion: @escaping GiphyCompletion) {
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            completion(.failure(NSError(domain: "error", code: 1, userInfo: nil)))
            return
        }
        urlComponents.queryItems?.append(URLQueryItem(name: "api_key", value: "dc6zaTOxFJmzC"))

        if let apiURL = urlComponents.url {
            let request = URLRequest(url: apiURL)
            let session = URLSession.shared

            session.dataTask(with: request, completionHandler: { (data, response, error) in
                if let error = error {
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
            }).resume()
        }
    }
}
