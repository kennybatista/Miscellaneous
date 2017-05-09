import UIKit

public class customWatchView : UIView{
  //MARK: - Properties
  var ringProgressView = MKRingProgressView()
  var ringProgressView2 = MKRingProgressView()
  var ringProgressView3 = MKRingProgressView()
  
  let activityRingGoal : Double = 490.0
  let exerciseRingGoal : Double = 30.0
  let standRingGoal : Double = 12.0
  
  var activityTotal : Double = 992.0
  var exerciseTotal : Double = 54.0
  var standTotal : Double = 13.0
  
  var startDisplayLinkTime : Double = -1
  var endTimeStamp : Double = -1

  
  //MARK: - Lifecycle
  override public init(frame : CGRect){
    super.init(frame: frame)
    
    let timeLabel = incrementalLabel(frame: CGRect(x: 34, y: 175, width: self.frame.width, height: 106), startTime: 1490510581, endTime: 1490556210, secDuration: 12)
    timeLabel.font = UIFont.systemFont(ofSize: 64, weight: UIFontWeightMedium)
    timeLabel.minimumScaleFactor = 0.5
    timeLabel.textAlignment = .left
    self.addSubview(timeLabel)
    
    let activityLabel = incrementalLabel(frame: CGRect(x: 178.5, y: 284, width: self.frame.width - 178.5 - 53.5, height: 71), endValue: activityTotal, duration: 12.0)
    activityLabel.font = UIFont.systemFont(ofSize: 53.333333334, weight: UIFontWeightMedium)
    activityLabel.minimumScaleFactor = 0.5
    activityLabel.textAlignment = .right
    activityLabel.textColor = #colorLiteral(red: 0.8811283112, green: 0, blue: 0.0722764805, alpha: 1)
    self.addSubview(activityLabel)
    
    let excersizeLabel = incrementalLabel(frame: CGRect(x: 178.5, y: 348.75, width: self.frame.width - 178.5 - 53.5, height: 71), endValue: exerciseTotal, duration: 12.0)
    excersizeLabel.font = UIFont.systemFont(ofSize: 53.333333334, weight: UIFontWeightMedium)
    excersizeLabel.minimumScaleFactor = 0.5
    excersizeLabel.textAlignment = .right
    excersizeLabel.textColor = #colorLiteral(red: 0.2136939466, green: 0.8621223569, blue: 0.005727462936, alpha: 1)
    self.addSubview(excersizeLabel)
    
    let standingLabel = incrementalLabel(frame: CGRect(x: 178.5, y: 408.75, width: self.frame.width - 178.5 - 53.5, height: 71), endValue: standTotal, duration: 12.0)
    standingLabel.font = UIFont.systemFont(ofSize: 53.333333334, weight: UIFontWeightMedium)
    standingLabel.minimumScaleFactor = 0.5
    standingLabel.textAlignment = .right
    standingLabel.textColor = #colorLiteral(red: 0.002058682498, green: 0.7290638089, blue: 0.8833985925, alpha: 1)
    self.addSubview(standingLabel)
    
    ringProgressView = MKRingProgressView(frame: CGRect(x: 30.5, y: 315.75, width: 156, height: 156))
    ringProgressView.startColor = #colorLiteral(red: 0.8811283112, green: 0, blue: 0.0722764805, alpha: 1)
    ringProgressView.endColor = #colorLiteral(red: 0.9649361968, green: 0.1297230124, blue: 0.3876497149, alpha: 1)
    ringProgressView.ringWidth = 20
    ringProgressView.progress = 0.0
    self.addSubview(ringProgressView)
    
    ringProgressView2 = MKRingProgressView(frame: CGRect(x: 40.5, y: 325.75, width: 116, height: 116))
    ringProgressView2.startColor = #colorLiteral(red: 0.2136939466, green: 0.8621223569, blue: 0.005727462936, alpha: 1)
    ringProgressView2.endColor = #colorLiteral(red: 0.6138017774, green: 0.9697924256, blue: 0.01211143006, alpha: 1)
    ringProgressView2.ringWidth = 20
    ringProgressView2.progress = 0.0
    ringProgressView2.center = ringProgressView.center
    self.addSubview(ringProgressView2)
    
    ringProgressView3 = MKRingProgressView(frame: CGRect(x: 40.5, y: 325.75, width: 76, height: 76))
    ringProgressView3.startColor = #colorLiteral(red: 0.002058682498, green: 0.7290638089, blue: 0.8833985925, alpha: 1)
    ringProgressView3.endColor = #colorLiteral(red: 0.02357670851, green: 0.8923541903, blue: 0.8373907208, alpha: 1)
    ringProgressView3.ringWidth = 20
    ringProgressView3.progress = 0.0
    ringProgressView3.center = ringProgressView.center
    self.addSubview(ringProgressView3)
    let displaylink = CADisplayLink(target: self,
                                    selector: #selector(step))
    displaylink.add(to: .current,
                    forMode: .defaultRunLoopMode)
  }
  
  override public func draw(_ rect: CGRect){
    //// Color Declarations
    let strokeColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
    let fillColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
    
    //// Group 2
    //// Rectangle Drawing
    let rectanglePath = UIBezierPath(roundedRect: CGRect(x: 0.28, y: 120.57, width: 328.35, height: 389.95), cornerRadius: 51.8)
    strokeColor.setStroke()
    rectanglePath.lineWidth = 3.6
    rectanglePath.stroke()
    
    //// Rectangle 2 Drawing
    let rectangle2Path = UIBezierPath(roundedRect: CGRect(x: 14.83, y: 139.62, width: 299.25, height: 355.35), cornerRadius: 35.2)
    fillColor.setFill()
    rectangle2Path.fill()
    
    //// Rectangle 3 Drawing
    let rectangle3Path = UIBezierPath(roundedRect: CGRect(x: 14.83, y: 139.62, width: 299.25, height: 355.35), cornerRadius: 35.2)
    strokeColor.setStroke()
    rectangle3Path.lineWidth = 3.6
    rectangle3Path.stroke()
    
    //// Bezier Drawing
    let bezierPath = UIBezierPath()
    bezierPath.move(to: CGPoint(x: 330.88, y: 324.68))
    bezierPath.addCurve(to: CGPoint(x: 336.41, y: 330.21), controlPoint1: CGPoint(x: 333.92, y: 324.68), controlPoint2: CGPoint(x: 336.41, y: 327.17))
    bezierPath.addLine(to: CGPoint(x: 336.41, y: 412.08))
    bezierPath.addCurve(to: CGPoint(x: 330.88, y: 417.61), controlPoint1: CGPoint(x: 336.41, y: 415.12), controlPoint2: CGPoint(x: 333.92, y: 417.61))
    strokeColor.setStroke()
    bezierPath.lineWidth = 3.6
    bezierPath.stroke()
    
    //// Bezier 2 Drawing
    let bezier2Path = UIBezierPath()
    bezier2Path.move(to: CGPoint(x: 330.84, y: 212.08))
    bezier2Path.addCurve(to: CGPoint(x: 343.65, y: 224.88), controlPoint1: CGPoint(x: 337.89, y: 212.08), controlPoint2: CGPoint(x: 343.65, y: 217.84))
    bezier2Path.addLine(to: CGPoint(x: 343.65, y: 265.85))
    bezier2Path.addCurve(to: CGPoint(x: 330.84, y: 278.66), controlPoint1: CGPoint(x: 343.65, y: 272.89), controlPoint2: CGPoint(x: 337.89, y: 278.66))
    strokeColor.setStroke()
    bezier2Path.lineWidth = 3.6
    bezier2Path.stroke()
    
    //// Bezier 3 Drawing
    let bezier3Path = UIBezierPath()
    bezier3Path.move(to: CGPoint(x: 336.08, y: 220.18))
    bezier3Path.addLine(to: CGPoint(x: 342.6, y: 220.18))
    strokeColor.setStroke()
    bezier3Path.lineWidth = 3.49
    bezier3Path.stroke()
    
    //// Bezier 4 Drawing
    let bezier4Path = UIBezierPath()
    bezier4Path.move(to: CGPoint(x: 336.08, y: 227.13))
    bezier4Path.addLine(to: CGPoint(x: 342.6, y: 227.13))
    strokeColor.setStroke()
    bezier4Path.lineWidth = 3.49
    bezier4Path.stroke()
    
    //// Bezier 5 Drawing
    let bezier5Path = UIBezierPath()
    bezier5Path.move(to: CGPoint(x: 336.08, y: 234.08))
    bezier5Path.addLine(to: CGPoint(x: 342.6, y: 234.08))
    strokeColor.setStroke()
    bezier5Path.lineWidth = 3.49
    bezier5Path.stroke()
    
    //// Bezier 6 Drawing
    let bezier6Path = UIBezierPath()
    bezier6Path.move(to: CGPoint(x: 336.08, y: 241.02))
    bezier6Path.addLine(to: CGPoint(x: 342.6, y: 241.02))
    strokeColor.setStroke()
    bezier6Path.lineWidth = 3.49
    bezier6Path.stroke()
    
    //// Bezier 7 Drawing
    let bezier7Path = UIBezierPath()
    bezier7Path.move(to: CGPoint(x: 336.08, y: 247.97))
    bezier7Path.addLine(to: CGPoint(x: 342.6, y: 247.97))
    strokeColor.setStroke()
    bezier7Path.lineWidth = 3.49
    bezier7Path.stroke()
    
    //// Bezier 8 Drawing
    let bezier8Path = UIBezierPath()
    bezier8Path.move(to: CGPoint(x: 336.08, y: 254.92))
    bezier8Path.addLine(to: CGPoint(x: 342.6, y: 254.92))
    strokeColor.setStroke()
    bezier8Path.lineWidth = 3.49
    bezier8Path.stroke()
    
    //// Bezier 9 Drawing
    let bezier9Path = UIBezierPath()
    bezier9Path.move(to: CGPoint(x: 336.08, y: 261.87))
    bezier9Path.addLine(to: CGPoint(x: 342.6, y: 261.87))
    strokeColor.setStroke()
    bezier9Path.lineWidth = 3.49
    bezier9Path.stroke()
    
    //// Bezier 10 Drawing
    let bezier10Path = UIBezierPath()
    bezier10Path.move(to: CGPoint(x: 336.08, y: 268.81))
    bezier10Path.addLine(to: CGPoint(x: 342.6, y: 268.81))
    strokeColor.setStroke()
    bezier10Path.lineWidth = 3.49
    bezier10Path.stroke()
    
    //// Bezier 11 Drawing
    let bezier11Path = UIBezierPath()
    bezier11Path.move(to: CGPoint(x: 38.26, y: 122.55))
    bezier11Path.addCurve(to: CGPoint(x: 61.06, y: 90.49), controlPoint1: CGPoint(x: 38.26, y: 122.55), controlPoint2: CGPoint(x: 58.89, y: 109.31))
    bezier11Path.addCurve(to: CGPoint(x: 68.04, y: 26.87), controlPoint1: CGPoint(x: 62.61, y: 77.07), controlPoint2: CGPoint(x: 66.2, y: 43.91))
    bezier11Path.addCurve(to: CGPoint(x: 84.18, y: 7.3), controlPoint1: CGPoint(x: 69.03, y: 17.71), controlPoint2: CGPoint(x: 75.36, y: 10.01))
    bezier11Path.addCurve(to: CGPoint(x: 165.3, y: -0.4), controlPoint1: CGPoint(x: 97.05, y: 3.35), controlPoint2: CGPoint(x: 120.95, y: -0.4))
    bezier11Path.addCurve(to: CGPoint(x: 242.41, y: 8.55), controlPoint1: CGPoint(x: 165.3, y: -0.4), controlPoint2: CGPoint(x: 212.48, y: -1.62))
    bezier11Path.addCurve(to: CGPoint(x: 259.03, y: 28.9), controlPoint1: CGPoint(x: 251.39, y: 11.6), controlPoint2: CGPoint(x: 257.84, y: 19.5))
    bezier11Path.addLine(to: CGPoint(x: 267.36, y: 94.55))
    bezier11Path.addCurve(to: CGPoint(x: 287.48, y: 121.76), controlPoint1: CGPoint(x: 267.36, y: 94.55), controlPoint2: CGPoint(x: 269.1, y: 114.52))
    strokeColor.setStroke()
    bezier11Path.lineWidth = 3.6
    bezier11Path.stroke()
    
    //// Bezier 12 Drawing
    let bezier12Path = UIBezierPath()
    bezier12Path.move(to: CGPoint(x: 38.26, y: 508.92))
    bezier12Path.addCurve(to: CGPoint(x: 61.06, y: 540.98), controlPoint1: CGPoint(x: 38.26, y: 508.92), controlPoint2: CGPoint(x: 58.89, y: 522.17))
    bezier12Path.addCurve(to: CGPoint(x: 67.75, y: 601.87), controlPoint1: CGPoint(x: 62.53, y: 553.72), controlPoint2: CGPoint(x: 65.84, y: 584.23))
    bezier12Path.addCurve(to: CGPoint(x: 87.71, y: 625.18), controlPoint1: CGPoint(x: 68.95, y: 613.02), controlPoint2: CGPoint(x: 76.86, y: 622.32))
    bezier12Path.addCurve(to: CGPoint(x: 165.3, y: 631.88), controlPoint1: CGPoint(x: 101.27, y: 628.74), controlPoint2: CGPoint(x: 124.72, y: 631.88))
    bezier12Path.addCurve(to: CGPoint(x: 241.04, y: 623.39), controlPoint1: CGPoint(x: 165.3, y: 631.88), controlPoint2: CGPoint(x: 211.06, y: 633.06))
    bezier12Path.addCurve(to: CGPoint(x: 259.21, y: 601.15), controlPoint1: CGPoint(x: 250.9, y: 620.2), controlPoint2: CGPoint(x: 257.91, y: 611.42))
    bezier12Path.addLine(to: CGPoint(x: 267.36, y: 536.93))
    bezier12Path.addCurve(to: CGPoint(x: 287.48, y: 509.72), controlPoint1: CGPoint(x: 267.36, y: 536.93), controlPoint2: CGPoint(x: 269.1, y: 516.96))
    strokeColor.setStroke()
    bezier12Path.lineWidth = 3.6
    bezier12Path.stroke()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  //MARK: - Helpers
  func step(displaylink: CADisplayLink) {
    if startDisplayLinkTime == -1{
      startDisplayLinkTime = displaylink.timestamp
      endTimeStamp = 12 + startDisplayLinkTime
    }
    
    let curTimeStamp = displaylink.timestamp
    
    let percentToEnd = (curTimeStamp - startDisplayLinkTime) / (endTimeStamp - startDisplayLinkTime)
    
    let activityPercent = (activityTotal * percentToEnd) / activityRingGoal
    let exercisePercent = (exerciseTotal * percentToEnd) / exerciseRingGoal
    var standPercent = ((standTotal * percentToEnd) / standRingGoal)
    
    let denominator : Double = 12
    // Because we are rounding I am shifting it back by a half an hour :)
    standPercent = round((standPercent - (1.0 / 24.0))*denominator )/denominator
  
    ringProgressView.progress = activityPercent
    ringProgressView2.progress = exercisePercent
    ringProgressView3.progress = standPercent
    
    if percentToEnd >= 1.0{
      displaylink.remove(from: .current, forMode: .defaultRunLoopMode)
    }
    
  }
}

