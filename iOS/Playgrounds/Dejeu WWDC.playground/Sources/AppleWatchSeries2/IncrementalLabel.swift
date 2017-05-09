import UIKit

public class incrementalLabel : UILabel {
  //MARK : - Properties
  var counter : Double = 0
  var timer = Timer()
  
  var startTimeSec : Double = 1
  var endTimeDate : Double = 1
  let dateFormatter = DateFormatter()
  var requiredSeconds : Double = 0
  var timePerSec : Double = 1
  var duration: Double = 1
  var startTimeStamp : Double = -1
  var endTimeStamp : Double = 1
  
  var endValue : Double = 0
  var labelValue : Double = -1
  
  
  //MARK: - LifeCycle
  public init(frame : CGRect, endValue : Double, duration : Double){
    super.init(frame: frame)
    createDisplayLinkForActLabels()
    self.endValue = endValue
    self.duration = duration
    self.text = "\(labelValue)"
  }
  
  public init(frame: CGRect, startTime : Double, endTime : Double, secDuration : Double){
    super.init(frame: frame)
    duration = secDuration
    endTimeDate = endTime
    dateFormatter.dateFormat = "hh:mm:ss"
    startTimeSec = startTime
    let startDate = Date(timeIntervalSince1970: TimeInterval(startTime))
    dateFormatter.timeZone = NSTimeZone(abbreviation: "GMT") as TimeZone!
    
    requiredSeconds = Double(endTime - startTime)
    timePerSec = secDuration / Double(requiredSeconds)
    
    self.text = dateFormatter.string(from: startDate)
    createDisplayLink()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  //MARK: - Helpers
  func createDisplayLink() {
    let displaylink = CADisplayLink(target: self,
                                    selector: #selector(step))
    
    displaylink.add(to: .current,
                    forMode: .defaultRunLoopMode)
  }
  
  func createDisplayLinkForActLabels(){
    let displaylink = CADisplayLink(target: self,
                                    selector: #selector(stepLabel))
    
    displaylink.add(to: .current,
                    forMode: .defaultRunLoopMode)
  }
  
  func stepLabel(displaylink: CADisplayLink) {
    if labelValue == -1 {
      startTimeStamp = displaylink.timestamp
      endTimeStamp = startTimeStamp + duration
      labelValue = 0
    }
    
    let curTimeStamp = displaylink.timestamp
    let percentToEnd = (curTimeStamp - startTimeStamp) / (endTimeStamp - startTimeStamp)
    
    if percentToEnd >= 1.0{
      displaylink.remove(from: .current, forMode: .defaultRunLoopMode)
    }
    
    labelValue = endValue * percentToEnd
    self.text = "\(Int(labelValue))"
    
  }
  
  func step(displaylink: CADisplayLink) {
    if startTimeStamp == -1{
      startTimeStamp = displaylink.timestamp
      endTimeStamp = duration + startTimeStamp
    }
    let curTimeStamp = displaylink.timestamp
    let percentToEnd = (curTimeStamp - startTimeStamp) / (endTimeStamp - startTimeStamp)
    if percentToEnd >= 1.0{
      displaylink.remove(from: .current, forMode: .defaultRunLoopMode)
    }
    let totalSec : Double = endTimeDate - startTimeSec
    let shiftTime = percentToEnd * totalSec
    let curTime = Date(timeIntervalSince1970: TimeInterval(Double(startTimeSec) + shiftTime))
    self.text = dateFormatter.string(from: curTime)
  }
}


