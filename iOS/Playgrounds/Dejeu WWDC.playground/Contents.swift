//: Hello! 👋 I hope you are doing well! 😊  This playground is awesome!! 😎💥 So get hyped!  It does have quite a few files so please be patient when waiting for it to run 🔥 You know it has started when the audio starts and the live view goes white and black text starts appearing 📱 I love feedback - so please feel free to reach me at the provided information! 💝

import UIKit
import PlaygroundSupport

let w : CGFloat = 599
let h : CGFloat = 945

let view = AYearAtApple(frame: CGRect(x: 0, y: 0, width: w, height: h))
PlaygroundPage.current.liveView = view
PlaygroundPage.current.needsIndefiniteExecution = true