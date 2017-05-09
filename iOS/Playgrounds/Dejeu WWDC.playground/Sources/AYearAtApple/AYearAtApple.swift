import AVFoundation
import UIKit

open class AYearAtApple : UIView {
  //MARK: - Properties
  var appleWatchScene = WatchScene(frame: CGRect(x: 0, y: 0, width: 599, height: 945))
  let night = NightSky(frame : CGRect(x: 0, y: 0, width: 599, height: 945))
  var airpodScene = AirPodScene(frame: CGRect(x: 0, y: 0, width: 599, height: 945))
  var concludeScene = ConcludeScene(frame: CGRect(x: 0, y: 0, width: 599, height: 945))
  var wwdcScene = WWDC2016Scene(frame: CGRect(x: 0, y: 0, width: 599, height: 945))
  var introScene = IntroScene(frame: CGRect(x: 0, y: 0, width: 599, height: 945))
  var audioPlayer = AVAudioPlayer()
  
  var startDisplayLinkTime : Double = -1
  var endTimeStamp : Double = -1
  
  var introStarted = false
  var wwdc2016IntroStarted = false
  var watchStarted = false
  var nightStarted = false
  var airpodsStarted = false
  var concludeStarted = false
  
  
  //MARK: - Lifecycle
  override public init(frame : CGRect){
    // The awesome music you are hearing  is under Create Commons Attribution 4.0 International Licencse
    // 🎶🔊 Music was created by Ross Bugden!  Check out the original source here:
    // https://www.youtube.com/watch?v=BY0U432m8W0 🎧
    let soundURL = Bundle.main.url(forResource: "InspirationalPiano", withExtension: "mp3")
    
    do {
      try audioPlayer = AVAudioPlayer(contentsOf: soundURL!)
    }
    catch{
      print("Huston we have a problem!")
    }
    audioPlayer.play()
    super.init(frame: frame)
    self.backgroundColor = .black
    introScene.alpha = 0
    self.addSubview(introScene)
    
    wwdcScene.frame = CGRect(x: 0 - self.frame.width, y: 0, width: self.frame.width, height: self.frame.height)
    wwdcScene.backgroundColor = #colorLiteral(red: 0.1560676694, green: 0.163968116, blue: 0.2117111683, alpha: 1)
    self.addSubview(wwdcScene)
    
    self.backgroundColor = .white
    appleWatchScene.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
    appleWatchScene.backgroundColor = #colorLiteral(red: 0.2862745098, green: 0.5647058824, blue: 0.8862745098, alpha: 1)
    appleWatchScene.alpha = 0
    self.addSubview(appleWatchScene)
    
    night.frame = CGRect(x: 0, y: -self.frame.height, width: self.frame.width, height: self.frame.height)
    night.alpha = 0
    self.addSubview(night)
    
    airpodScene.backgroundColor = .clear
    self.addSubview(airpodScene)
    
    concludeScene.backgroundColor = .white
    concludeScene.frame = CGRect(x: 0 - self.frame.width, y: 0, width: self.frame.width, height: self.frame.height)
    self.addSubview(concludeScene)
    let displaylink = CADisplayLink(target: self,
                                    selector: #selector(step))
    displaylink.add(to: .current,
                    forMode: .defaultRunLoopMode)
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  //MARK: - Helpers
  func step(displaylink: CADisplayLink) {
    if !introStarted{
      introStarted = true
      introTransition()
    }
    
    if introScene.done && !wwdc2016IntroStarted{
      wwdc2016IntroStarted = true
      wwdc2016Transtion()
    }
    
    if wwdcScene.done && !watchStarted{
      watchTransition()
      watchStarted = true
    }
    
    if appleWatchScene.done && !nightStarted{
      nightStarted = true
      appleWatchScene.fadeOutWatch()
      iPhoneTransition()
    }
    
    if night.done && !airpodsStarted {
      airpodsStarted = true
      airpodScene.addSunAndAnimate()
    }
    
    if airpodScene.done && !concludeStarted{
      concludeStarted = true
      concludeTransition()
    }
  }
  
  func introTransition(){
    UIView.animate(withDuration: 1.0, animations: {
      self.introScene.alpha = 1
    }, completion: {boolean in
      self.introScene.start()
    })
  }
  
  func concludeTransition(){
    UIView.animate(withDuration: 1.5, animations: {
      self.concludeScene.frame = CGRect(x: 0, y: 0, width: self.concludeScene.frame.width, height: self.concludeScene.frame.height)
    }, completion: { boolean in
      self.concludeScene.start()
    })
  }
  
  func wwdc2016Transtion(){
    UIView.animate(withDuration: 1.0, animations: {
      self.wwdcScene.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
    }, completion: {boolean in
      self.wwdcScene.start()
    })
  }
  
  func iPhoneTransition(){
    UIView.animate(withDuration: 1.0, animations: {
      self.appleWatchScene.alpha = 0
    })
    UIView.animate(withDuration: 1.0, animations: {
      self.night.frame = CGRect(x: 0, y: 0, width: self.night.frame.width, height: self.night.frame.height)
      self.night.alpha = 1
    }, completion: { boolean in
      self.night.start()
    })
  }
  
  func watchTransition(){
    UIView.animate(withDuration: 1.0, animations: {
      self.appleWatchScene.alpha = 1
      self.wwdcScene.alpha = 0
    }, completion : { boolean in
      self.appleWatchScene.start()
    })
  }
  
}
