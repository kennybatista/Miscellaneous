import UIKit

// https://medium.com/ios-geek-community/intro-to-grand-central-dispatch-in-swift-3-with-bob-lee-1d4b56f731b3#.hdbiekila

// GCD allows us to run multiple tasks at the same time. Such as a snapchat user looking at a story, and at the same time, on the bacground fetching the incoming more images and videos

//[Dispatch Queue] - it's like a manager, it asings tasks to things, either UI tasks or Networking tasks

// Analogy. Ever iPhone has two workers, a worker that handles the heavy stuff, and a worker that handles the lightweight stuff. But what does each worker handle?
// Heavy worker: UI stuff
// Lightweight worker: background objects


// How do we access the heavy or lightweigtht workers? Aka, main or background tasks
// anything that is UI is handles by the heavy worker ( Main thread ) 

// main thread
let main = DispatchQueue.main

//background thread
let background = DispatchQueue.global()

// if the manager ( DispatchQueue ) needs more help, he could simple create an object
let helper = DispatchQueue(label: "Construction_worker_3")



// since we have access to these workers, we can assign work to them

// Sync vs Async
// code in swift usually runs on the main thread, sometimes we might need to change it


// Synchronous is a bottleneck, it finishes running by itself until it finishes and then runs other tasks
func doSyncWork(){
    print("----Sync tasks----")
    
    let backgroundThread = DispatchQueue.global()
    
    backgroundThread.sync {
        for _ in 1...3 {
            print("Light")
        }
    }
    
    for _ in 1...3 {
        print("Heavy")
    }
}


// if the background queue runs the code asynchronously, it is not a bottleneck, the lightweight and heavy worker work at the same time alongside ( background thread and main thread )
func doAsyncWork(){
    print("----Async tasks----")
    
    let backgroundThread = DispatchQueue.global()
    backgroundThread.async {
        for _ in 1...3 {
            print("Light")
        }
    }
    
    for _ in 1...3{
        print("Heavy")
    }
    
}


doAsyncWork()


// At snapchat if we run networking synchronously, the UI will be frozen 99 percent of the time and I will be fired. Networking ( should be done by the lightweight worker ( background thread ) 




// Create our own custom workers
let asianWorker = DispatchQueue(label: "construction_worker_1")
let brownWorker = DispatchQueue(label: "construction_worker_2")

func doLightWork(){
    asianWorker.async {
        for _ in 1...10{
            print("👷")
        }
    }
    
    brownWorker.async {
        for _ in 1...10{
            print("👷🏾")
        }
    }
}

doLightWork()




// PRIORIZATION
// even if we have our own custom workers, we might want to prioritize one over the other ( based on importance )

let whiteWorker = DispatchQueue(label: "construction_worker_3", qos: .background) //lower importance
let blackWorker = DispatchQueue(label: "construction_worker_4", qos: .userInitiated) // higher importance


func doLightWorks(){
    whiteWorker.async {
        for _ in 1...10{
            print("👷🏻")
        }
    }
    
    
    blackWorker.async {
        for _ in 1...10{
            print("👷🏿")
        }
    }

}







// 6 levels of priorities of service
// 1. userInteractive ( highest priority )
// 2. userInitiated
// 3. default
// 4. utility
// 5. background
// 6. unspecified ( lowest ) 






























