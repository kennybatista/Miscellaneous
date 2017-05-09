import UIKit

public enum airPodStyle{
  case left
  case right
}
public class AirPod : UIView {
  //MARK: - Public Properties
  public var style : airPodStyle = .left {
    didSet {
      setNeedsDisplay()
    }
  }
  
  
  //MARK: - Lifecycle
  override public func draw(_ rect: CGRect) {
    switch style{
    case .left: drawLeftAirPod()
    case .right : drawRightAirPod()
    }
  }
  
  //MARK: - Helpers
  func drawLeftAirPod(){
    let strokeColor3 = UIColor(red: 0.005, green: 0.009, blue: 0.007, alpha: 1.000)
    let fillColor2 = UIColor(red: 0.005, green: 0.009, blue: 0.007, alpha: 1.000)
    
    //// Group 2
    //// Bezier Drawing
    let bezierPath = UIBezierPath()
    bezierPath.move(to: CGPoint(x: 57.85, y: 6))
    bezierPath.addCurve(to: CGPoint(x: 7, y: 30), controlPoint1: CGPoint(x: 36.81, y: 6), controlPoint2: CGPoint(x: 18.24, y: 15.49))
    bezierPath.addLine(to: CGPoint(x: 7, y: 94.61))
    bezierPath.addCurve(to: CGPoint(x: 57.85, y: 118.61), controlPoint1: CGPoint(x: 18.24, y: 109.12), controlPoint2: CGPoint(x: 36.81, y: 118.61))
    bezierPath.addCurve(to: CGPoint(x: 86.1, y: 112.42), controlPoint1: CGPoint(x: 68.03, y: 118.61), controlPoint2: CGPoint(x: 77.61, y: 116.35))
    bezierPath.addLine(to: CGPoint(x: 86.1, y: 242.48))
    bezierPath.addLine(to: CGPoint(x: 120, y: 242.48))
    bezierPath.addLine(to: CGPoint(x: 120, y: 62.3))
    bezierPath.addCurve(to: CGPoint(x: 57.85, y: 6), controlPoint1: CGPoint(x: 120, y: 31.21), controlPoint2: CGPoint(x: 92.18, y: 6))
    bezierPath.addLine(to: CGPoint(x: 57.85, y: 6))
    bezierPath.close()
    strokeColor3.setStroke()
    bezierPath.lineWidth = 11.25
    bezierPath.lineCapStyle = .round
    bezierPath.lineJoinStyle = .round
    bezierPath.stroke()
    
    
    //// Bezier 2 Drawing
    let bezier2Path = UIBezierPath()
    bezier2Path.move(to: CGPoint(x: 69.53, y: 96.09))
    bezier2Path.addCurve(to: CGPoint(x: 86.48, y: 112.98), controlPoint1: CGPoint(x: 78.88, y: 96.09), controlPoint2: CGPoint(x: 86.48, y: 103.65))
    strokeColor3.setStroke()
    bezier2Path.lineWidth = 11.25
    bezier2Path.lineCapStyle = .round
    bezier2Path.lineJoinStyle = .round
    bezier2Path.stroke()
    
    
    //// Bezier 3 Drawing
    let bezier3Path = UIBezierPath()
    bezier3Path.move(to: CGPoint(x: 108.7, y: 265))
    bezier3Path.addLine(to: CGPoint(x: 97.4, y: 265))
    bezier3Path.addCurve(to: CGPoint(x: 86.1, y: 253.74), controlPoint1: CGPoint(x: 91.16, y: 265), controlPoint2: CGPoint(x: 86.1, y: 259.96))
    bezier3Path.addLine(to: CGPoint(x: 86.1, y: 242.48))
    bezier3Path.addLine(to: CGPoint(x: 120, y: 242.48))
    bezier3Path.addLine(to: CGPoint(x: 120, y: 253.74))
    bezier3Path.addCurve(to: CGPoint(x: 108.7, y: 265), controlPoint1: CGPoint(x: 120, y: 259.96), controlPoint2: CGPoint(x: 114.94, y: 265))
    bezier3Path.addLine(to: CGPoint(x: 108.7, y: 265))
    bezier3Path.close()
    strokeColor3.setStroke()
    bezier3Path.lineWidth = 11.25
    bezier3Path.lineCapStyle = .round
    bezier3Path.lineJoinStyle = .round
    bezier3Path.stroke()
    
    
    //// Oval Drawing
    let ovalPath = UIBezierPath(ovalIn: CGRect(x: 29.6, y: 51.05, width: 17, height: 16.9))
    fillColor2.setFill()
    ovalPath.fill()
    
    
    //// Bezier 4 Drawing
    let bezier4Path = UIBezierPath()
    bezier4Path.move(to: CGPoint(x: 74.8, y: 32.28))
    bezier4Path.addCurve(to: CGPoint(x: 94.38, y: 51.27), controlPoint1: CGPoint(x: 83.6, y: 36.14), controlPoint2: CGPoint(x: 90.62, y: 42.92))
    strokeColor3.setStroke()
    bezier4Path.lineWidth = 11.25
    bezier4Path.lineCapStyle = .round
    bezier4Path.lineJoinStyle = .round
    bezier4Path.stroke()
    
  }
  
  func drawRightAirPod(){
    let strokeColor3 = UIColor(red: 0.005, green: 0.009, blue: 0.007, alpha: 1.000)
    let fillColor2 = UIColor(red: 0.005, green: 0.009, blue: 0.007, alpha: 1.000)
    
    //// Group 2
    //// Bezier Drawing
    let bezierPath = UIBezierPath()
    bezierPath.move(to: CGPoint(x: 69.11, y: 6.24))
    bezierPath.addCurve(to: CGPoint(x: 119.63, y: 30.26), controlPoint1: CGPoint(x: 90.01, y: 6.24), controlPoint2: CGPoint(x: 108.46, y: 15.74))
    bezierPath.addLine(to: CGPoint(x: 119.63, y: 94.94))
    bezierPath.addCurve(to: CGPoint(x: 69.11, y: 118.96), controlPoint1: CGPoint(x: 108.46, y: 109.46), controlPoint2: CGPoint(x: 90.01, y: 118.96))
    bezierPath.addCurve(to: CGPoint(x: 41.05, y: 112.76), controlPoint1: CGPoint(x: 59, y: 118.96), controlPoint2: CGPoint(x: 49.48, y: 116.69))
    bezierPath.addLine(to: CGPoint(x: 41.05, y: 242.95))
    bezierPath.addLine(to: CGPoint(x: 7.37, y: 242.95))
    bezierPath.addLine(to: CGPoint(x: 7.37, y: 62.6))
    bezierPath.addCurve(to: CGPoint(x: 69.11, y: 6.24), controlPoint1: CGPoint(x: 7.37, y: 31.48), controlPoint2: CGPoint(x: 35.01, y: 6.24))
    bezierPath.addLine(to: CGPoint(x: 69.11, y: 6.24))
    bezierPath.close()
    strokeColor3.setStroke()
    bezierPath.lineWidth = 11.25
    bezierPath.lineCapStyle = .round
    bezierPath.lineJoinStyle = .round
    bezierPath.stroke()
    
    
    //// Bezier 2 Drawing
    let bezier2Path = UIBezierPath()
    bezier2Path.move(to: CGPoint(x: 57.89, y: 96.41))
    bezier2Path.addCurve(to: CGPoint(x: 41.05, y: 113.32), controlPoint1: CGPoint(x: 48.59, y: 96.41), controlPoint2: CGPoint(x: 41.05, y: 103.99))
    strokeColor3.setStroke()
    bezier2Path.lineWidth = 11.25
    bezier2Path.lineCapStyle = .round
    bezier2Path.lineJoinStyle = .round
    bezier2Path.stroke()
    
    
    //// Bezier 3 Drawing
    let bezier3Path = UIBezierPath()
    bezier3Path.move(to: CGPoint(x: 18.6, y: 265.49))
    bezier3Path.addLine(to: CGPoint(x: 29.82, y: 265.49))
    bezier3Path.addCurve(to: CGPoint(x: 41.05, y: 254.22), controlPoint1: CGPoint(x: 36.02, y: 265.49), controlPoint2: CGPoint(x: 41.05, y: 260.44))
    bezier3Path.addLine(to: CGPoint(x: 41.05, y: 242.95))
    bezier3Path.addLine(to: CGPoint(x: 7.37, y: 242.95))
    bezier3Path.addLine(to: CGPoint(x: 7.37, y: 254.22))
    bezier3Path.addCurve(to: CGPoint(x: 18.6, y: 265.49), controlPoint1: CGPoint(x: 7.37, y: 260.44), controlPoint2: CGPoint(x: 12.4, y: 265.49))
    bezier3Path.addLine(to: CGPoint(x: 18.6, y: 265.49))
    bezier3Path.close()
    strokeColor3.setStroke()
    bezier3Path.lineWidth = 11.25
    bezier3Path.lineCapStyle = .round
    bezier3Path.lineJoinStyle = .round
    bezier3Path.stroke()
    
    
    //// Bezier 4 Drawing
    let bezier4Path = UIBezierPath()
    bezier4Path.move(to: CGPoint(x: 52.3, y: 32.3))
    bezier4Path.addCurve(to: CGPoint(x: 32.84, y: 51.32), controlPoint1: CGPoint(x: 43.55, y: 36.17), controlPoint2: CGPoint(x: 36.58, y: 42.95))
    strokeColor3.setStroke()
    bezier4Path.lineWidth = 11.25
    bezier4Path.lineCapStyle = .round
    bezier4Path.lineJoinStyle = .round
    bezier4Path.stroke()
    
    
    //// Oval Drawing
    let ovalPath = UIBezierPath(ovalIn: CGRect(x: 80.3, y: 51.4, width: 16.9, height: 16.8))
    fillColor2.setFill()
    ovalPath.fill()
  }
}

