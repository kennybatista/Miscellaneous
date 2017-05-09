import UIKit

public enum cloudStyle {
  case filledSmallCloud
  case partialLeftAndFullRightCloud
  case basicOutlineCloud
  case rightAirpodCloud
  case leftAirpodCloud
  case bigBasicFilledCloud
  case outlinedCloud
  case outlinedLongCloud
  case midLongCloud
  case indentedBottomCloud
  case largeFilledCloud
}

public class Cloud : UIView {
  //MARK: - Public Properties
  public var cloudType : cloudStyle = .filledSmallCloud {
    didSet {
      setNeedsDisplay()
    }
  }
  
  
  //MARK: - Lifecycle
  override public init(frame: CGRect){
    super.init(frame: frame)
    self.backgroundColor = .clear
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override public func draw(_ rect: CGRect){
    
    switch cloudType{
    case .filledSmallCloud: drawFilledSmallCloud()
    case .partialLeftAndFullRightCloud: drawPartialLeftAndFullRightCloud()
    case .basicOutlineCloud: drawBasicOutlineCloud()
      
    case .rightAirpodCloud: drawRightAirpodCloud()
    case .leftAirpodCloud: drawLeftAirpodCloud()
      
    case.bigBasicFilledCloud: drawBigBasicFilledCloud()
    case .outlinedCloud : drawOutlinedCloud()
    case .outlinedLongCloud: drawOutlinedLongCloud()
    case .midLongCloud: drawMidLongCloud()
    case .indentedBottomCloud : drawIndentedBottomCloud()
    case .largeFilledCloud : drawLargeFilledCloud()
    }
  }
  
  
  //MARK: - Helpers
  func drawFilledSmallCloud(){
    let fillColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
    
    //// Bezier Drawing
    let bezierPath = UIBezierPath()
    bezierPath.move(to: CGPoint(x: 75.79, y: 78))
    bezierPath.addLine(to: CGPoint(x: 27.14, y: 78))
    bezierPath.addCurve(to: CGPoint(x: 0, y: 50.59), controlPoint1: CGPoint(x: 12.15, y: 78), controlPoint2: CGPoint(x: 0, y: 65.73))
    bezierPath.addCurve(to: CGPoint(x: 27.14, y: 23.19), controlPoint1: CGPoint(x: 0, y: 35.46), controlPoint2: CGPoint(x: 12.15, y: 23.19))
    bezierPath.addCurve(to: CGPoint(x: 39.67, y: 26.28), controlPoint1: CGPoint(x: 31.66, y: 23.19), controlPoint2: CGPoint(x: 35.92, y: 24.31))
    bezierPath.addCurve(to: CGPoint(x: 76.19, y: 0), controlPoint1: CGPoint(x: 44.9, y: 10.99), controlPoint2: CGPoint(x: 59.27, y: 0))
    bezierPath.addCurve(to: CGPoint(x: 114.81, y: 39), controlPoint1: CGPoint(x: 97.52, y: 0), controlPoint2: CGPoint(x: 114.81, y: 17.46))
    bezierPath.addCurve(to: CGPoint(x: 114.79, y: 40.32), controlPoint1: CGPoint(x: 114.81, y: 39.44), controlPoint2: CGPoint(x: 114.81, y: 39.88))
    bezierPath.addCurve(to: CGPoint(x: 125.25, y: 57.97), controlPoint1: CGPoint(x: 121.02, y: 43.7), controlPoint2: CGPoint(x: 125.25, y: 50.34))
    bezierPath.addCurve(to: CGPoint(x: 105.42, y: 78), controlPoint1: CGPoint(x: 125.25, y: 69.03), controlPoint2: CGPoint(x: 116.37, y: 78))
    bezierPath.addLine(to: CGPoint(x: 76.19, y: 78))
    bezierPath.addCurve(to: CGPoint(x: 75.79, y: 78), controlPoint1: CGPoint(x: 76.13, y: 78), controlPoint2: CGPoint(x: 75.79, y: 78))
    bezierPath.addLine(to: CGPoint(x: 76.19, y: 78))
    bezierPath.addLine(to: CGPoint(x: 75.79, y: 78))
    bezierPath.close()
    bezierPath.usesEvenOddFillRule = true
    fillColor.setFill()
    bezierPath.fill()
  }
  
  func drawPartialLeftAndFullRightCloud(){
    let fillColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
    
    //// Group 2
    //// Bezier Drawing
    let bezierPath = UIBezierPath()
    bezierPath.move(to: CGPoint(x: 38.36, y: 74.77))
    bezierPath.addLine(to: CGPoint(x: 23.44, y: 74.77))
    bezierPath.addCurve(to: CGPoint(x: 5.81, y: 57.04), controlPoint1: CGPoint(x: 13.72, y: 74.77), controlPoint2: CGPoint(x: 5.81, y: 66.81))
    bezierPath.addCurve(to: CGPoint(x: 23.44, y: 39.31), controlPoint1: CGPoint(x: 5.81, y: 47.26), controlPoint2: CGPoint(x: 13.72, y: 39.31))
    bezierPath.addCurve(to: CGPoint(x: 25.68, y: 39.46), controlPoint1: CGPoint(x: 24.09, y: 39.31), controlPoint2: CGPoint(x: 24.8, y: 39.36))
    bezierPath.addLine(to: CGPoint(x: 28.55, y: 39.82))
    bezierPath.addLine(to: CGPoint(x: 28.83, y: 36.95))
    bezierPath.addCurve(to: CGPoint(x: 62.81, y: 6.13), controlPoint1: CGPoint(x: 30.61, y: 19.38), controlPoint2: CGPoint(x: 45.21, y: 6.13))
    bezierPath.addCurve(to: CGPoint(x: 83.48, y: 13.21), controlPoint1: CGPoint(x: 70.45, y: 6.13), controlPoint2: CGPoint(x: 77.66, y: 8.74))
    bezierPath.addCurve(to: CGPoint(x: 87.44, y: 9.19), controlPoint1: CGPoint(x: 84.74, y: 11.79), controlPoint2: CGPoint(x: 86.05, y: 10.44))
    bezierPath.addCurve(to: CGPoint(x: 62.81, y: 0.48), controlPoint1: CGPoint(x: 80.53, y: 3.7), controlPoint2: CGPoint(x: 71.87, y: 0.48))
    bezierPath.addCurve(to: CGPoint(x: 23.58, y: 33.66), controlPoint1: CGPoint(x: 43.16, y: 0.48), controlPoint2: CGPoint(x: 26.83, y: 14.37))
    bezierPath.addLine(to: CGPoint(x: 23.44, y: 33.66))
    bezierPath.addCurve(to: CGPoint(x: 0.16, y: 57.04), controlPoint1: CGPoint(x: 10.6, y: 33.66), controlPoint2: CGPoint(x: 0.16, y: 44.15))
    bezierPath.addCurve(to: CGPoint(x: 23.44, y: 80.42), controlPoint1: CGPoint(x: 0.16, y: 69.93), controlPoint2: CGPoint(x: 10.6, y: 80.42))
    bezierPath.addLine(to: CGPoint(x: 38.5, y: 80.42))
    bezierPath.addCurve(to: CGPoint(x: 38.27, y: 76.85), controlPoint1: CGPoint(x: 38.36, y: 79.25), controlPoint2: CGPoint(x: 38.27, y: 78.06))
    bezierPath.addCurve(to: CGPoint(x: 38.36, y: 74.77), controlPoint1: CGPoint(x: 38.27, y: 76.15), controlPoint2: CGPoint(x: 38.32, y: 75.46))
    bezierPath.close()
    bezierPath.usesEvenOddFillRule = true
    fillColor.setFill()
    bezierPath.fill()
    
    //// Bezier 2 Drawing
    let bezier2Path = UIBezierPath()
    bezier2Path.move(to: CGPoint(x: 177.6, y: 33.71))
    bezier2Path.addCurve(to: CGPoint(x: 170.15, y: 34.51), controlPoint1: CGPoint(x: 175.09, y: 33.71), controlPoint2: CGPoint(x: 172.59, y: 33.98))
    bezier2Path.addCurve(to: CGPoint(x: 124.38, y: 4.24), controlPoint1: CGPoint(x: 162.34, y: 16.35), controlPoint2: CGPoint(x: 144.11, y: 4.24))
    bezier2Path.addCurve(to: CGPoint(x: 75.22, y: 45.82), controlPoint1: CGPoint(x: 99.77, y: 4.24), controlPoint2: CGPoint(x: 79.3, y: 21.64))
    bezier2Path.addLine(to: CGPoint(x: 75.05, y: 45.82))
    bezier2Path.addCurve(to: CGPoint(x: 45.86, y: 75.12), controlPoint1: CGPoint(x: 58.95, y: 45.82), controlPoint2: CGPoint(x: 45.86, y: 58.96))
    bezier2Path.addCurve(to: CGPoint(x: 75.05, y: 104.42), controlPoint1: CGPoint(x: 45.86, y: 91.28), controlPoint2: CGPoint(x: 58.95, y: 104.42))
    bezier2Path.addLine(to: CGPoint(x: 177.6, y: 104.42))
    bezier2Path.addCurve(to: CGPoint(x: 212.8, y: 69.07), controlPoint1: CGPoint(x: 197.01, y: 104.42), controlPoint2: CGPoint(x: 212.8, y: 88.56))
    bezier2Path.addCurve(to: CGPoint(x: 177.6, y: 33.71), controlPoint1: CGPoint(x: 212.8, y: 49.57), controlPoint2: CGPoint(x: 197.01, y: 33.71))
    bezier2Path.addLine(to: CGPoint(x: 177.6, y: 33.71))
    bezier2Path.close()
    bezier2Path.move(to: CGPoint(x: 205.72, y: 69.07))
    bezier2Path.addCurve(to: CGPoint(x: 177.6, y: 97.34), controlPoint1: CGPoint(x: 205.72, y: 84.66), controlPoint2: CGPoint(x: 193.1, y: 97.34))
    bezier2Path.addLine(to: CGPoint(x: 75.05, y: 97.34))
    bezier2Path.addCurve(to: CGPoint(x: 52.94, y: 75.12), controlPoint1: CGPoint(x: 62.86, y: 97.34), controlPoint2: CGPoint(x: 52.94, y: 87.37))
    bezier2Path.addCurve(to: CGPoint(x: 75.05, y: 52.9), controlPoint1: CGPoint(x: 52.94, y: 62.87), controlPoint2: CGPoint(x: 62.86, y: 52.9))
    bezier2Path.addCurve(to: CGPoint(x: 77.85, y: 53.1), controlPoint1: CGPoint(x: 75.86, y: 52.9), controlPoint2: CGPoint(x: 76.75, y: 52.96))
    bezier2Path.addLine(to: CGPoint(x: 81.44, y: 53.54))
    bezier2Path.addLine(to: CGPoint(x: 81.8, y: 49.94))
    bezier2Path.addCurve(to: CGPoint(x: 124.38, y: 11.32), controlPoint1: CGPoint(x: 84.03, y: 27.92), controlPoint2: CGPoint(x: 102.33, y: 11.32))
    bezier2Path.addCurve(to: CGPoint(x: 164.67, y: 39.93), controlPoint1: CGPoint(x: 142.42, y: 11.32), controlPoint2: CGPoint(x: 158.61, y: 22.82))
    bezier2Path.addLine(to: CGPoint(x: 165.81, y: 43.16))
    bezier2Path.addLine(to: CGPoint(x: 169.07, y: 42.12))
    bezier2Path.addCurve(to: CGPoint(x: 177.6, y: 40.8), controlPoint1: CGPoint(x: 171.85, y: 41.24), controlPoint2: CGPoint(x: 174.71, y: 40.8))
    bezier2Path.addCurve(to: CGPoint(x: 205.72, y: 69.07), controlPoint1: CGPoint(x: 193.1, y: 40.8), controlPoint2: CGPoint(x: 205.72, y: 53.48))
    bezier2Path.addLine(to: CGPoint(x: 205.72, y: 69.07))
    bezier2Path.close()
    bezier2Path.usesEvenOddFillRule = true
    fillColor.setFill()
    bezier2Path.fill()
  }
  
  func drawBasicOutlineCloud(){
    let fillColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
    
    //// Bezier Drawing
    let bezierPath = UIBezierPath()
    bezierPath.move(to: CGPoint(x: 135.72, y: 30.74))
    bezierPath.addCurve(to: CGPoint(x: 128.07, y: 31.57), controlPoint1: CGPoint(x: 133.15, y: 30.74), controlPoint2: CGPoint(x: 130.58, y: 31.02))
    bezierPath.addCurve(to: CGPoint(x: 81.04, y: 0.27), controlPoint1: CGPoint(x: 120.04, y: 12.8), controlPoint2: CGPoint(x: 101.31, y: 0.27))
    bezierPath.addCurve(to: CGPoint(x: 30.53, y: 43.25), controlPoint1: CGPoint(x: 55.75, y: 0.27), controlPoint2: CGPoint(x: 34.72, y: 18.26))
    bezierPath.addCurve(to: CGPoint(x: 30.35, y: 43.25), controlPoint1: CGPoint(x: 30.47, y: 43.25), controlPoint2: CGPoint(x: 30.41, y: 43.25))
    bezierPath.addCurve(to: CGPoint(x: 0.36, y: 73.54), controlPoint1: CGPoint(x: 13.81, y: 43.25), controlPoint2: CGPoint(x: 0.36, y: 56.84))
    bezierPath.addCurve(to: CGPoint(x: 30.35, y: 103.82), controlPoint1: CGPoint(x: 0.36, y: 90.23), controlPoint2: CGPoint(x: 13.81, y: 103.82))
    bezierPath.addLine(to: CGPoint(x: 135.72, y: 103.82))
    bezierPath.addCurve(to: CGPoint(x: 171.9, y: 67.28), controlPoint1: CGPoint(x: 155.67, y: 103.82), controlPoint2: CGPoint(x: 171.9, y: 87.43))
    bezierPath.addCurve(to: CGPoint(x: 135.72, y: 30.74), controlPoint1: CGPoint(x: 171.9, y: 47.13), controlPoint2: CGPoint(x: 155.67, y: 30.74))
    bezierPath.addLine(to: CGPoint(x: 135.72, y: 30.74))
    bezierPath.close()
    bezierPath.move(to: CGPoint(x: 164.62, y: 67.28))
    bezierPath.addCurve(to: CGPoint(x: 135.72, y: 96.5), controlPoint1: CGPoint(x: 164.62, y: 83.39), controlPoint2: CGPoint(x: 151.66, y: 96.5))
    bezierPath.addLine(to: CGPoint(x: 30.35, y: 96.5))
    bezierPath.addCurve(to: CGPoint(x: 7.63, y: 73.54), controlPoint1: CGPoint(x: 17.82, y: 96.5), controlPoint2: CGPoint(x: 7.63, y: 86.2))
    bezierPath.addCurve(to: CGPoint(x: 30.35, y: 50.57), controlPoint1: CGPoint(x: 7.63, y: 60.87), controlPoint2: CGPoint(x: 17.82, y: 50.57))
    bezierPath.addCurve(to: CGPoint(x: 33.23, y: 50.77), controlPoint1: CGPoint(x: 31.19, y: 50.57), controlPoint2: CGPoint(x: 32.1, y: 50.63))
    bezierPath.addLine(to: CGPoint(x: 36.92, y: 51.24))
    bezierPath.addLine(to: CGPoint(x: 37.3, y: 47.51))
    bezierPath.addCurve(to: CGPoint(x: 81.04, y: 7.6), controlPoint1: CGPoint(x: 39.58, y: 24.75), controlPoint2: CGPoint(x: 58.38, y: 7.6))
    bezierPath.addCurve(to: CGPoint(x: 122.44, y: 37.17), controlPoint1: CGPoint(x: 99.58, y: 7.6), controlPoint2: CGPoint(x: 116.21, y: 19.48))
    bezierPath.addLine(to: CGPoint(x: 123.61, y: 40.5))
    bezierPath.addLine(to: CGPoint(x: 126.97, y: 39.43))
    bezierPath.addCurve(to: CGPoint(x: 135.72, y: 38.06), controlPoint1: CGPoint(x: 129.81, y: 38.52), controlPoint2: CGPoint(x: 132.76, y: 38.06))
    bezierPath.addCurve(to: CGPoint(x: 164.62, y: 67.28), controlPoint1: CGPoint(x: 151.66, y: 38.06), controlPoint2: CGPoint(x: 164.62, y: 51.17))
    bezierPath.addLine(to: CGPoint(x: 164.62, y: 67.28))
    bezierPath.close()
    bezierPath.usesEvenOddFillRule = true
    fillColor.setFill()
    bezierPath.fill()
  }
  
  func drawRightAirpodCloud(){
    let strokeColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
    let fillColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
    
    //// Group 2
    //// Bezier Drawing
    let bezierPath = UIBezierPath()
    bezierPath.move(to: CGPoint(x: 6.24, y: 56.75))
    bezierPath.addCurve(to: CGPoint(x: 30.21, y: 6.12), controlPoint1: CGPoint(x: 6.24, y: 35.8), controlPoint2: CGPoint(x: 15.72, y: 17.32))
    bezierPath.addLine(to: CGPoint(x: 94.77, y: 6.12))
    bezierPath.addCurve(to: CGPoint(x: 118.74, y: 56.75), controlPoint1: CGPoint(x: 109.26, y: 17.32), controlPoint2: CGPoint(x: 118.74, y: 35.8))
    bezierPath.addCurve(to: CGPoint(x: 112.55, y: 84.88), controlPoint1: CGPoint(x: 118.74, y: 66.89), controlPoint2: CGPoint(x: 116.48, y: 76.43))
    bezierPath.addLine(to: CGPoint(x: 242.49, y: 84.88))
    bezierPath.addLine(to: CGPoint(x: 242.49, y: 118.62))
    bezierPath.addLine(to: CGPoint(x: 62.49, y: 118.62))
    bezierPath.addCurve(to: CGPoint(x: 6.24, y: 56.75), controlPoint1: CGPoint(x: 31.43, y: 118.62), controlPoint2: CGPoint(x: 6.24, y: 90.93))
    bezierPath.addLine(to: CGPoint(x: 6.24, y: 56.75))
    bezierPath.close()
    bezierPath.usesEvenOddFillRule = true
    fillColor.setFill()
    bezierPath.fill()
    
    //// Bezier 2 Drawing
    let bezier2Path = UIBezierPath()
    bezier2Path.move(to: CGPoint(x: 6.24, y: 56.75))
    bezier2Path.addCurve(to: CGPoint(x: 30.21, y: 6.12), controlPoint1: CGPoint(x: 6.24, y: 35.8), controlPoint2: CGPoint(x: 15.72, y: 17.32))
    bezier2Path.addLine(to: CGPoint(x: 94.77, y: 6.12))
    bezier2Path.addCurve(to: CGPoint(x: 118.74, y: 56.75), controlPoint1: CGPoint(x: 109.26, y: 17.32), controlPoint2: CGPoint(x: 118.74, y: 35.8))
    bezier2Path.addCurve(to: CGPoint(x: 112.55, y: 84.88), controlPoint1: CGPoint(x: 118.74, y: 66.89), controlPoint2: CGPoint(x: 116.48, y: 76.43))
    bezier2Path.addLine(to: CGPoint(x: 242.49, y: 84.88))
    bezier2Path.addLine(to: CGPoint(x: 242.49, y: 118.62))
    bezier2Path.addLine(to: CGPoint(x: 62.49, y: 118.62))
    bezier2Path.addCurve(to: CGPoint(x: 6.24, y: 56.75), controlPoint1: CGPoint(x: 31.43, y: 118.62), controlPoint2: CGPoint(x: 6.24, y: 90.93))
    bezier2Path.addLine(to: CGPoint(x: 6.24, y: 56.75))
    bezier2Path.close()
    strokeColor.setStroke()
    bezier2Path.lineWidth = 11.25
    bezier2Path.lineCapStyle = .round
    bezier2Path.lineJoinStyle = .round
    bezier2Path.stroke()
    
    //// Bezier 3 Drawing
    let bezier3Path = UIBezierPath()
    bezier3Path.move(to: CGPoint(x: 264.99, y: 107.38))
    bezier3Path.addLine(to: CGPoint(x: 264.99, y: 96.12))
    bezier3Path.addCurve(to: CGPoint(x: 253.74, y: 84.88), controlPoint1: CGPoint(x: 264.99, y: 89.91), controlPoint2: CGPoint(x: 259.95, y: 84.88))
    bezier3Path.addLine(to: CGPoint(x: 242.49, y: 84.88))
    bezier3Path.addLine(to: CGPoint(x: 242.49, y: 118.62))
    bezier3Path.addLine(to: CGPoint(x: 253.74, y: 118.62))
    bezier3Path.addCurve(to: CGPoint(x: 264.99, y: 107.38), controlPoint1: CGPoint(x: 259.95, y: 118.62), controlPoint2: CGPoint(x: 264.99, y: 113.59))
    bezier3Path.addLine(to: CGPoint(x: 264.99, y: 107.38))
    bezier3Path.close()
    bezier3Path.usesEvenOddFillRule = true
    fillColor.setFill()
    bezier3Path.fill()
    
    //// Bezier 4 Drawing
    let bezier4Path = UIBezierPath()
    bezier4Path.move(to: CGPoint(x: 264.99, y: 107.38))
    bezier4Path.addLine(to: CGPoint(x: 264.99, y: 96.12))
    bezier4Path.addCurve(to: CGPoint(x: 253.74, y: 84.88), controlPoint1: CGPoint(x: 264.99, y: 89.91), controlPoint2: CGPoint(x: 259.95, y: 84.88))
    bezier4Path.addLine(to: CGPoint(x: 242.49, y: 84.88))
    bezier4Path.addLine(to: CGPoint(x: 242.49, y: 118.62))
    bezier4Path.addLine(to: CGPoint(x: 253.74, y: 118.62))
    bezier4Path.addCurve(to: CGPoint(x: 264.99, y: 107.38), controlPoint1: CGPoint(x: 259.95, y: 118.62), controlPoint2: CGPoint(x: 264.99, y: 113.59))
    bezier4Path.addLine(to: CGPoint(x: 264.99, y: 107.38))
    bezier4Path.close()
    strokeColor.setStroke()
    bezier4Path.lineWidth = 11.25
    bezier4Path.lineCapStyle = .round
    bezier4Path.lineJoinStyle = .round
    bezier4Path.stroke()
  }
  
  func drawLeftAirpodCloud(){
    let strokeColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
    let fillColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
    
    //// Group 2
    //// Bezier Drawing
    let bezierPath = UIBezierPath()
    bezierPath.move(to: CGPoint(x: 29.12, y: 119.12))
    bezierPath.addLine(to: CGPoint(x: 29.12, y: 85.38))
    bezierPath.addLine(to: CGPoint(x: 159.06, y: 85.38))
    bezierPath.addCurve(to: CGPoint(x: 152.88, y: 57.25), controlPoint1: CGPoint(x: 155.14, y: 76.93), controlPoint2: CGPoint(x: 152.88, y: 67.39))
    bezierPath.addCurve(to: CGPoint(x: 176.85, y: 6.62), controlPoint1: CGPoint(x: 152.88, y: 36.3), controlPoint2: CGPoint(x: 162.36, y: 17.82))
    bezierPath.addLine(to: CGPoint(x: 241.4, y: 6.62))
    bezierPath.addCurve(to: CGPoint(x: 265.38, y: 57.25), controlPoint1: CGPoint(x: 255.89, y: 17.82), controlPoint2: CGPoint(x: 265.38, y: 36.3))
    bezierPath.addCurve(to: CGPoint(x: 209.12, y: 119.12), controlPoint1: CGPoint(x: 265.38, y: 91.43), controlPoint2: CGPoint(x: 240.19, y: 119.12))
    bezierPath.addLine(to: CGPoint(x: 29.12, y: 119.12))
    bezierPath.close()
    bezierPath.move(to: CGPoint(x: 29.12, y: 119.12))
    bezierPath.addLine(to: CGPoint(x: 17.88, y: 119.12))
    bezierPath.addCurve(to: CGPoint(x: 6.62, y: 107.88), controlPoint1: CGPoint(x: 11.67, y: 119.12), controlPoint2: CGPoint(x: 6.62, y: 114.08))
    bezierPath.addLine(to: CGPoint(x: 6.62, y: 96.62))
    bezierPath.addCurve(to: CGPoint(x: 17.88, y: 85.38), controlPoint1: CGPoint(x: 6.62, y: 90.41), controlPoint2: CGPoint(x: 11.67, y: 85.38))
    bezierPath.addLine(to: CGPoint(x: 29.12, y: 85.38))
    bezierPath.addLine(to: CGPoint(x: 29.12, y: 119.12))
    bezierPath.close()
    bezierPath.usesEvenOddFillRule = true
    fillColor.setFill()
    bezierPath.fill()
    
    //// Bezier 2 Drawing
    let bezier2Path = UIBezierPath()
    bezier2Path.move(to: CGPoint(x: 29.12, y: 119.12))
    bezier2Path.addLine(to: CGPoint(x: 29.12, y: 85.38))
    bezier2Path.addLine(to: CGPoint(x: 159.06, y: 85.38))
    bezier2Path.addCurve(to: CGPoint(x: 152.88, y: 57.25), controlPoint1: CGPoint(x: 155.14, y: 76.93), controlPoint2: CGPoint(x: 152.88, y: 67.39))
    bezier2Path.addCurve(to: CGPoint(x: 176.85, y: 6.62), controlPoint1: CGPoint(x: 152.88, y: 36.3), controlPoint2: CGPoint(x: 162.36, y: 17.82))
    bezier2Path.addLine(to: CGPoint(x: 241.4, y: 6.62))
    bezier2Path.addCurve(to: CGPoint(x: 265.38, y: 57.25), controlPoint1: CGPoint(x: 255.89, y: 17.82), controlPoint2: CGPoint(x: 265.38, y: 36.3))
    bezier2Path.addCurve(to: CGPoint(x: 209.12, y: 119.12), controlPoint1: CGPoint(x: 265.38, y: 91.43), controlPoint2: CGPoint(x: 240.19, y: 119.12))
    bezier2Path.addLine(to: CGPoint(x: 29.12, y: 119.12))
    bezier2Path.close()
    bezier2Path.move(to: CGPoint(x: 29.12, y: 119.12))
    bezier2Path.addLine(to: CGPoint(x: 17.88, y: 119.12))
    bezier2Path.addCurve(to: CGPoint(x: 6.62, y: 107.88), controlPoint1: CGPoint(x: 11.66, y: 119.12), controlPoint2: CGPoint(x: 6.62, y: 114.09))
    bezier2Path.addLine(to: CGPoint(x: 6.62, y: 96.62))
    bezier2Path.addCurve(to: CGPoint(x: 17.88, y: 85.38), controlPoint1: CGPoint(x: 6.62, y: 90.42), controlPoint2: CGPoint(x: 11.66, y: 85.38))
    bezier2Path.addLine(to: CGPoint(x: 29.12, y: 85.38))
    bezier2Path.addLine(to: CGPoint(x: 29.12, y: 119.12))
    bezier2Path.close()
    strokeColor.setStroke()
    bezier2Path.lineWidth = 11.25
    bezier2Path.lineCapStyle = .round
    bezier2Path.lineJoinStyle = .round
    bezier2Path.stroke()
  }
  
  func drawBigBasicFilledCloud(){
    let fillColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
    
    //// Bezier Drawing
    let bezierPath = UIBezierPath()
    bezierPath.move(to: CGPoint(x: 45.04, y: 139.5))
    bezierPath.addCurve(to: CGPoint(x: 0, y: 95.16), controlPoint1: CGPoint(x: 20.16, y: 139.5), controlPoint2: CGPoint(x: 0, y: 119.65))
    bezierPath.addCurve(to: CGPoint(x: 27.41, y: 54.34), controlPoint1: CGPoint(x: 0, y: 76.83), controlPoint2: CGPoint(x: 11.3, y: 61.1))
    bezierPath.addCurve(to: CGPoint(x: 59.93, y: 26.94), controlPoint1: CGPoint(x: 29.85, y: 38.82), controlPoint2: CGPoint(x: 43.48, y: 26.94))
    bezierPath.addCurve(to: CGPoint(x: 73.7, y: 29.91), controlPoint1: CGPoint(x: 64.85, y: 26.94), controlPoint2: CGPoint(x: 69.51, y: 28.01))
    bezierPath.addCurve(to: CGPoint(x: 126.45, y: 0), controlPoint1: CGPoint(x: 84.25, y: 12.02), controlPoint2: CGPoint(x: 103.92, y: 0))
    bezierPath.addCurve(to: CGPoint(x: 187.34, y: 56.94), controlPoint1: CGPoint(x: 159.07, y: 0), controlPoint2: CGPoint(x: 185.7, y: 25.22))
    bezierPath.addCurve(to: CGPoint(x: 220.5, y: 97.72), controlPoint1: CGPoint(x: 206.31, y: 61.1), controlPoint2: CGPoint(x: 220.5, y: 77.78))
    bezierPath.addCurve(to: CGPoint(x: 178.06, y: 139.5), controlPoint1: CGPoint(x: 220.5, y: 120.79), controlPoint2: CGPoint(x: 201.5, y: 139.5))
    bezierPath.addCurve(to: CGPoint(x: 177.72, y: 139.5), controlPoint1: CGPoint(x: 177.95, y: 139.5), controlPoint2: CGPoint(x: 177.83, y: 139.5))
    bezierPath.addLine(to: CGPoint(x: 45.04, y: 139.5))
    bezierPath.addLine(to: CGPoint(x: 45.04, y: 139.5))
    bezierPath.close()
    bezierPath.usesEvenOddFillRule = true
    fillColor.setFill()
    bezierPath.fill()
  }
  
  func drawOutlinedCloud(){
    let fillColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
    
    //// Bezier Drawing
    let bezierPath = UIBezierPath()
    bezierPath.move(to: CGPoint(x: 44.27, y: 79.18))
    bezierPath.addCurve(to: CGPoint(x: 30.85, y: 83.79), controlPoint1: CGPoint(x: 40.46, y: 82.16), controlPoint2: CGPoint(x: 35.79, y: 83.79))
    bezierPath.addCurve(to: CGPoint(x: 9, y: 61.91), controlPoint1: CGPoint(x: 18.78, y: 83.79), controlPoint2: CGPoint(x: 9, y: 74))
    bezierPath.addCurve(to: CGPoint(x: 30.85, y: 40.03), controlPoint1: CGPoint(x: 9, y: 49.83), controlPoint2: CGPoint(x: 18.78, y: 40.03))
    bezierPath.addCurve(to: CGPoint(x: 33.9, y: 40.25), controlPoint1: CGPoint(x: 31.88, y: 40.03), controlPoint2: CGPoint(x: 32.9, y: 40.11))
    bezierPath.addLine(to: CGPoint(x: 37.66, y: 40.77))
    bezierPath.addLine(to: CGPoint(x: 38.81, y: 37.16))
    bezierPath.addCurve(to: CGPoint(x: 77.35, y: 9), controlPoint1: CGPoint(x: 44.12, y: 20.52), controlPoint2: CGPoint(x: 59.63, y: 9))
    bezierPath.addCurve(to: CGPoint(x: 117.8, y: 49.5), controlPoint1: CGPoint(x: 99.69, y: 9), controlPoint2: CGPoint(x: 117.8, y: 27.13))
    bezierPath.addCurve(to: CGPoint(x: 117.75, y: 51.49), controlPoint1: CGPoint(x: 117.8, y: 50.17), controlPoint2: CGPoint(x: 117.78, y: 50.83))
    bezierPath.addLine(to: CGPoint(x: 117.45, y: 57.77))
    bezierPath.addLine(to: CGPoint(x: 123.49, y: 56.04))
    bezierPath.addCurve(to: CGPoint(x: 126.95, y: 55.55), controlPoint1: CGPoint(x: 124.6, y: 55.72), controlPoint2: CGPoint(x: 125.76, y: 55.55))
    bezierPath.addCurve(to: CGPoint(x: 139.5, y: 68.12), controlPoint1: CGPoint(x: 133.88, y: 55.55), controlPoint2: CGPoint(x: 139.5, y: 61.18))
    bezierPath.addCurve(to: CGPoint(x: 126.95, y: 80.69), controlPoint1: CGPoint(x: 139.5, y: 75.06), controlPoint2: CGPoint(x: 133.88, y: 80.69))
    bezierPath.addCurve(to: CGPoint(x: 116.41, y: 74.94), controlPoint1: CGPoint(x: 122.64, y: 80.69), controlPoint2: CGPoint(x: 118.71, y: 78.5))
    bezierPath.addLine(to: CGPoint(x: 112.99, y: 69.67))
    bezierPath.addLine(to: CGPoint(x: 109.1, y: 74.6))
    bezierPath.addCurve(to: CGPoint(x: 77.35, y: 90), controlPoint1: CGPoint(x: 101.47, y: 84.26), controlPoint2: CGPoint(x: 89.89, y: 90))
    bezierPath.addCurve(to: CGPoint(x: 50.08, y: 79.41), controlPoint1: CGPoint(x: 67.11, y: 90), controlPoint2: CGPoint(x: 57.48, y: 86.18))
    bezierPath.addLine(to: CGPoint(x: 47.27, y: 76.84))
    bezierPath.addLine(to: CGPoint(x: 44.27, y: 79.18))
    bezierPath.addLine(to: CGPoint(x: 44.27, y: 79.18))
    bezierPath.close()
    bezierPath.move(to: CGPoint(x: 49.81, y: 86.28))
    bezierPath.addLine(to: CGPoint(x: 44, y: 86.05))
    bezierPath.addCurve(to: CGPoint(x: 77.35, y: 99), controlPoint1: CGPoint(x: 53.05, y: 94.33), controlPoint2: CGPoint(x: 64.84, y: 99))
    bezierPath.addCurve(to: CGPoint(x: 116.16, y: 80.18), controlPoint1: CGPoint(x: 92.67, y: 99), controlPoint2: CGPoint(x: 106.84, y: 91.98))
    bezierPath.addLine(to: CGPoint(x: 108.85, y: 79.83))
    bezierPath.addCurve(to: CGPoint(x: 126.95, y: 89.69), controlPoint1: CGPoint(x: 112.8, y: 85.93), controlPoint2: CGPoint(x: 119.55, y: 89.69))
    bezierPath.addCurve(to: CGPoint(x: 148.5, y: 68.12), controlPoint1: CGPoint(x: 138.85, y: 89.69), controlPoint2: CGPoint(x: 148.5, y: 80.03))
    bezierPath.addCurve(to: CGPoint(x: 126.95, y: 46.55), controlPoint1: CGPoint(x: 148.5, y: 56.21), controlPoint2: CGPoint(x: 138.85, y: 46.55))
    bezierPath.addCurve(to: CGPoint(x: 121.01, y: 47.38), controlPoint1: CGPoint(x: 124.92, y: 46.55), controlPoint2: CGPoint(x: 122.93, y: 46.83))
    bezierPath.addLine(to: CGPoint(x: 122.25, y: 51.71))
    bezierPath.addLine(to: CGPoint(x: 126.74, y: 51.93))
    bezierPath.addCurve(to: CGPoint(x: 126.8, y: 49.5), controlPoint1: CGPoint(x: 126.78, y: 51.12), controlPoint2: CGPoint(x: 126.8, y: 50.31))
    bezierPath.addCurve(to: CGPoint(x: 77.35, y: 0), controlPoint1: CGPoint(x: 126.8, y: 22.16), controlPoint2: CGPoint(x: 104.66, y: 0))
    bezierPath.addCurve(to: CGPoint(x: 30.24, y: 34.42), controlPoint1: CGPoint(x: 55.68, y: 0), controlPoint2: CGPoint(x: 36.73, y: 14.08))
    bezierPath.addLine(to: CGPoint(x: 34.52, y: 35.79))
    bezierPath.addLine(to: CGPoint(x: 35.15, y: 31.33))
    bezierPath.addCurve(to: CGPoint(x: 30.85, y: 31.03), controlPoint1: CGPoint(x: 33.73, y: 31.13), controlPoint2: CGPoint(x: 32.3, y: 31.03))
    bezierPath.addCurve(to: CGPoint(x: 0, y: 61.91), controlPoint1: CGPoint(x: 13.81, y: 31.03), controlPoint2: CGPoint(x: 0, y: 44.86))
    bezierPath.addCurve(to: CGPoint(x: 30.85, y: 92.79), controlPoint1: CGPoint(x: 0, y: 78.97), controlPoint2: CGPoint(x: 13.81, y: 92.79))
    bezierPath.addCurve(to: CGPoint(x: 49.81, y: 86.28), controlPoint1: CGPoint(x: 37.81, y: 92.79), controlPoint2: CGPoint(x: 44.43, y: 90.47))
    bezierPath.addLine(to: CGPoint(x: 49.81, y: 86.28))
    bezierPath.close()
    fillColor.setFill()
    bezierPath.fill()
  }
  
  func drawOutlinedLongCloud(){
    let fillColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
    
    //// Bezier Drawing
    let bezierPath = UIBezierPath()
    bezierPath.move(to: CGPoint(x: 125.62, y: 80.92))
    bezierPath.addCurve(to: CGPoint(x: 103.5, y: 90), controlPoint1: CGPoint(x: 119.76, y: 86.7), controlPoint2: CGPoint(x: 111.9, y: 90))
    bezierPath.addCurve(to: CGPoint(x: 77.76, y: 76.66), controlPoint1: CGPoint(x: 93.14, y: 90), controlPoint2: CGPoint(x: 83.63, y: 84.97))
    bezierPath.addLine(to: CGPoint(x: 75.85, y: 73.96))
    bezierPath.addLine(to: CGPoint(x: 72.7, y: 74.98))
    bezierPath.addCurve(to: CGPoint(x: 63, y: 76.5), controlPoint1: CGPoint(x: 69.6, y: 75.98), controlPoint2: CGPoint(x: 66.34, y: 76.5))
    bezierPath.addCurve(to: CGPoint(x: 53.23, y: 74.96), controlPoint1: CGPoint(x: 59.64, y: 76.5), controlPoint2: CGPoint(x: 56.36, y: 75.98))
    bezierPath.addLine(to: CGPoint(x: 50.95, y: 74.21))
    bezierPath.addLine(to: CGPoint(x: 49.05, y: 75.7))
    bezierPath.addCurve(to: CGPoint(x: 33.75, y: 81), controlPoint1: CGPoint(x: 44.72, y: 79.12), controlPoint2: CGPoint(x: 39.39, y: 81))
    bezierPath.addCurve(to: CGPoint(x: 9, y: 56.25), controlPoint1: CGPoint(x: 20.08, y: 81), controlPoint2: CGPoint(x: 9, y: 69.92))
    bezierPath.addCurve(to: CGPoint(x: 32.08, y: 31.56), controlPoint1: CGPoint(x: 9, y: 43.2), controlPoint2: CGPoint(x: 19.13, y: 32.42))
    bezierPath.addLine(to: CGPoint(x: 34.48, y: 31.4))
    bezierPath.addLine(to: CGPoint(x: 35.68, y: 29.31))
    bezierPath.addCurve(to: CGPoint(x: 63, y: 13.5), controlPoint1: CGPoint(x: 41.27, y: 19.61), controlPoint2: CGPoint(x: 51.6, y: 13.5))
    bezierPath.addCurve(to: CGPoint(x: 77.85, y: 17.21), controlPoint1: CGPoint(x: 68.26, y: 13.5), controlPoint2: CGPoint(x: 73.32, y: 14.79))
    bezierPath.addLine(to: CGPoint(x: 80.58, y: 18.67))
    bezierPath.addLine(to: CGPoint(x: 82.92, y: 16.65))
    bezierPath.addCurve(to: CGPoint(x: 103.5, y: 9), controlPoint1: CGPoint(x: 88.6, y: 11.74), controlPoint2: CGPoint(x: 95.83, y: 9))
    bezierPath.addCurve(to: CGPoint(x: 130.05, y: 23.54), controlPoint1: CGPoint(x: 114.37, y: 9), controlPoint2: CGPoint(x: 124.29, y: 14.55))
    bezierPath.addLine(to: CGPoint(x: 132.14, y: 26.8))
    bezierPath.addLine(to: CGPoint(x: 135.67, y: 25.22))
    bezierPath.addCurve(to: CGPoint(x: 148.5, y: 22.5), controlPoint1: CGPoint(x: 139.67, y: 23.43), controlPoint2: CGPoint(x: 144.02, y: 22.5))
    bezierPath.addCurve(to: CGPoint(x: 180, y: 54), controlPoint1: CGPoint(x: 165.9, y: 22.5), controlPoint2: CGPoint(x: 180, y: 36.6))
    bezierPath.addCurve(to: CGPoint(x: 148.5, y: 85.5), controlPoint1: CGPoint(x: 180, y: 71.4), controlPoint2: CGPoint(x: 165.9, y: 85.5))
    bezierPath.addCurve(to: CGPoint(x: 131.25, y: 80.36), controlPoint1: CGPoint(x: 142.28, y: 85.5), controlPoint2: CGPoint(x: 136.34, y: 83.7))
    bezierPath.addLine(to: CGPoint(x: 128.21, y: 78.37))
    bezierPath.addLine(to: CGPoint(x: 125.62, y: 80.92))
    bezierPath.addLine(to: CGPoint(x: 125.62, y: 80.92))
    bezierPath.close()
    bezierPath.move(to: CGPoint(x: 131.94, y: 87.33))
    bezierPath.addLine(to: CGPoint(x: 126.32, y: 87.89))
    bezierPath.addCurve(to: CGPoint(x: 148.5, y: 94.5), controlPoint1: CGPoint(x: 132.86, y: 92.18), controlPoint2: CGPoint(x: 140.51, y: 94.5))
    bezierPath.addCurve(to: CGPoint(x: 189, y: 54), controlPoint1: CGPoint(x: 170.87, y: 94.5), controlPoint2: CGPoint(x: 189, y: 76.37))
    bezierPath.addCurve(to: CGPoint(x: 148.5, y: 13.5), controlPoint1: CGPoint(x: 189, y: 31.63), controlPoint2: CGPoint(x: 170.87, y: 13.5))
    bezierPath.addCurve(to: CGPoint(x: 132, y: 17), controlPoint1: CGPoint(x: 142.75, y: 13.5), controlPoint2: CGPoint(x: 137.15, y: 14.7))
    bezierPath.addLine(to: CGPoint(x: 137.63, y: 18.68))
    bezierPath.addCurve(to: CGPoint(x: 103.5, y: 0), controlPoint1: CGPoint(x: 130.23, y: 7.14), controlPoint2: CGPoint(x: 117.47, y: 0))
    bezierPath.addCurve(to: CGPoint(x: 77.04, y: 9.84), controlPoint1: CGPoint(x: 93.65, y: 0), controlPoint2: CGPoint(x: 84.34, y: 3.53))
    bezierPath.addLine(to: CGPoint(x: 82.1, y: 9.28))
    bezierPath.addCurve(to: CGPoint(x: 63, y: 4.5), controlPoint1: CGPoint(x: 76.27, y: 6.16), controlPoint2: CGPoint(x: 69.75, y: 4.5))
    bezierPath.addCurve(to: CGPoint(x: 27.88, y: 24.82), controlPoint1: CGPoint(x: 48.35, y: 4.5), controlPoint2: CGPoint(x: 35.06, y: 12.35))
    bezierPath.addLine(to: CGPoint(x: 31.48, y: 22.58))
    bezierPath.addCurve(to: CGPoint(x: 0, y: 56.25), controlPoint1: CGPoint(x: 13.81, y: 23.75), controlPoint2: CGPoint(x: 0, y: 38.46))
    bezierPath.addCurve(to: CGPoint(x: 33.75, y: 90), controlPoint1: CGPoint(x: 0, y: 74.89), controlPoint2: CGPoint(x: 15.11, y: 90))
    bezierPath.addCurve(to: CGPoint(x: 54.63, y: 82.77), controlPoint1: CGPoint(x: 41.43, y: 90), controlPoint2: CGPoint(x: 48.72, y: 87.42))
    bezierPath.addLine(to: CGPoint(x: 51.84, y: 79.24))
    bezierPath.addLine(to: CGPoint(x: 50.45, y: 83.52))
    bezierPath.addCurve(to: CGPoint(x: 63, y: 85.5), controlPoint1: CGPoint(x: 54.47, y: 84.83), controlPoint2: CGPoint(x: 58.69, y: 85.5))
    bezierPath.addCurve(to: CGPoint(x: 75.47, y: 83.54), controlPoint1: CGPoint(x: 67.28, y: 85.5), controlPoint2: CGPoint(x: 71.47, y: 84.83))
    bezierPath.addLine(to: CGPoint(x: 74.09, y: 79.26))
    bezierPath.addLine(to: CGPoint(x: 70.41, y: 81.86))
    bezierPath.addCurve(to: CGPoint(x: 103.5, y: 99), controlPoint1: CGPoint(x: 77.95, y: 92.52), controlPoint2: CGPoint(x: 90.19, y: 99))
    bezierPath.addCurve(to: CGPoint(x: 131.94, y: 87.33), controlPoint1: CGPoint(x: 114.29, y: 99), controlPoint2: CGPoint(x: 124.42, y: 94.76))
    bezierPath.addLine(to: CGPoint(x: 131.94, y: 87.33))
    bezierPath.close()
    fillColor.setFill()
    bezierPath.fill()
  }
  
  func drawMidLongCloud(){
    let context = UIGraphicsGetCurrentContext()!
    
    //// Color Declarations
    let fillColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
    
    //// Bezier Drawing
    context.saveGState()
    context.setBlendMode(.lighten)
    
    let bezierPath = UIBezierPath()
    bezierPath.move(to: CGPoint(x: 119.58, y: 113.38))
    bezierPath.addCurve(to: CGPoint(x: 90.78, y: 112.1), controlPoint1: CGPoint(x: 110.13, y: 115.72), controlPoint2: CGPoint(x: 100.2, y: 115.33))
    bezierPath.addCurve(to: CGPoint(x: 70.41, y: 99.05), controlPoint1: CGPoint(x: 82.92, y: 109.4), controlPoint2: CGPoint(x: 75.99, y: 104.93))
    bezierPath.addLine(to: CGPoint(x: 65.46, y: 93.83))
    bezierPath.addLine(to: CGPoint(x: 60.53, y: 99.07))
    bezierPath.addCurve(to: CGPoint(x: 31.87, y: 106.18), controlPoint1: CGPoint(x: 53.28, y: 106.8), controlPoint2: CGPoint(x: 42.09, y: 109.68))
    bezierPath.addCurve(to: CGPoint(x: 15.05, y: 71.83), controlPoint1: CGPoint(x: 17.7, y: 101.32), controlPoint2: CGPoint(x: 10.17, y: 85.94))
    bezierPath.addCurve(to: CGPoint(x: 49.53, y: 55.08), controlPoint1: CGPoint(x: 19.93, y: 57.72), controlPoint2: CGPoint(x: 35.36, y: 50.22))
    bezierPath.addCurve(to: CGPoint(x: 49.6, y: 55.11), controlPoint1: CGPoint(x: 49.57, y: 55.09), controlPoint2: CGPoint(x: 49.57, y: 55.09))
    bezierPath.addLine(to: CGPoint(x: 56.41, y: 57.46))
    bezierPath.addLine(to: CGPoint(x: 58.36, y: 50.55))
    bezierPath.addCurve(to: CGPoint(x: 59.25, y: 47.7), controlPoint1: CGPoint(x: 58.63, y: 49.59), controlPoint2: CGPoint(x: 58.93, y: 48.64))
    bezierPath.addCurve(to: CGPoint(x: 123.9, y: 16.29), controlPoint1: CGPoint(x: 68.4, y: 21.24), controlPoint2: CGPoint(x: 97.34, y: 7.18))
    bezierPath.addCurve(to: CGPoint(x: 155.67, y: 48.4), controlPoint1: CGPoint(x: 139.14, y: 21.52), controlPoint2: CGPoint(x: 150.72, y: 33.43))
    bezierPath.addLine(to: CGPoint(x: 159.63, y: 60.39))
    bezierPath.addLine(to: CGPoint(x: 167.45, y: 50.45))
    bezierPath.addCurve(to: CGPoint(x: 197.63, y: 41.58), controlPoint1: CGPoint(x: 174.52, y: 41.47), controlPoint2: CGPoint(x: 186.61, y: 37.8))
    bezierPath.addCurve(to: CGPoint(x: 214.45, y: 75.93), controlPoint1: CGPoint(x: 211.8, y: 46.44), controlPoint2: CGPoint(x: 219.33, y: 61.82))
    bezierPath.addCurve(to: CGPoint(x: 179.97, y: 92.68), controlPoint1: CGPoint(x: 209.57, y: 90.04), controlPoint2: CGPoint(x: 194.14, y: 97.54))
    bezierPath.addCurve(to: CGPoint(x: 179.46, y: 92.5), controlPoint1: CGPoint(x: 179.71, y: 92.59), controlPoint2: CGPoint(x: 179.71, y: 92.59))
    bezierPath.addLine(to: CGPoint(x: 171.51, y: 89.59))
    bezierPath.addLine(to: CGPoint(x: 170.4, y: 97.96))
    bezierPath.addCurve(to: CGPoint(x: 169.14, y: 103.25), controlPoint1: CGPoint(x: 170.16, y: 99.74), controlPoint2: CGPoint(x: 169.74, y: 101.52))
    bezierPath.addCurve(to: CGPoint(x: 134.67, y: 120.01), controlPoint1: CGPoint(x: 164.27, y: 117.36), controlPoint2: CGPoint(x: 148.83, y: 124.86))
    bezierPath.addCurve(to: CGPoint(x: 125.68, y: 114.84), controlPoint1: CGPoint(x: 131.31, y: 118.86), controlPoint2: CGPoint(x: 128.28, y: 117.1))
    bezierPath.addLine(to: CGPoint(x: 123.01, y: 112.52))
    bezierPath.addLine(to: CGPoint(x: 119.58, y: 113.38))
    bezierPath.addLine(to: CGPoint(x: 119.58, y: 113.38))
    bezierPath.close()
    bezierPath.move(to: CGPoint(x: 122.86, y: 126.49))
    bezierPath.addLine(to: CGPoint(x: 121.22, y: 119.93))
    bezierPath.addLine(to: CGPoint(x: 116.76, y: 125.02))
    bezierPath.addCurve(to: CGPoint(x: 130.25, y: 132.78), controlPoint1: CGPoint(x: 120.68, y: 128.43), controlPoint2: CGPoint(x: 125.24, y: 131.06))
    bezierPath.addCurve(to: CGPoint(x: 181.97, y: 107.65), controlPoint1: CGPoint(x: 151.5, y: 140.07), controlPoint2: CGPoint(x: 174.65, y: 128.82))
    bezierPath.addCurve(to: CGPoint(x: 183.85, y: 99.72), controlPoint1: CGPoint(x: 182.86, y: 105.06), controlPoint2: CGPoint(x: 183.49, y: 102.41))
    bezierPath.addLine(to: CGPoint(x: 177.12, y: 98.84))
    bezierPath.addLine(to: CGPoint(x: 174.79, y: 105.18))
    bezierPath.addCurve(to: CGPoint(x: 175.56, y: 105.45), controlPoint1: CGPoint(x: 175.17, y: 105.32), controlPoint2: CGPoint(x: 175.17, y: 105.32))
    bezierPath.addCurve(to: CGPoint(x: 227.27, y: 80.33), controlPoint1: CGPoint(x: 196.8, y: 112.74), controlPoint2: CGPoint(x: 219.96, y: 101.49))
    bezierPath.addCurve(to: CGPoint(x: 202.05, y: 28.81), controlPoint1: CGPoint(x: 234.59, y: 59.16), controlPoint2: CGPoint(x: 223.29, y: 36.09))
    bezierPath.addCurve(to: CGPoint(x: 156.77, y: 42.12), controlPoint1: CGPoint(x: 185.52, y: 23.14), controlPoint2: CGPoint(x: 167.38, y: 28.63))
    bezierPath.addLine(to: CGPoint(x: 168.55, y: 44.18))
    bezierPath.addCurve(to: CGPoint(x: 128.31, y: 3.51), controlPoint1: CGPoint(x: 162.3, y: 25.24), controlPoint2: CGPoint(x: 147.6, y: 10.13))
    bezierPath.addCurve(to: CGPoint(x: 46.43, y: 43.3), controlPoint1: CGPoint(x: 94.67, y: -8.03), controlPoint2: CGPoint(x: 58.01, y: 9.79))
    bezierPath.addCurve(to: CGPoint(x: 45.3, y: 46.9), controlPoint1: CGPoint(x: 46.02, y: 44.49), controlPoint2: CGPoint(x: 45.64, y: 45.69))
    bezierPath.addLine(to: CGPoint(x: 51.83, y: 48.72))
    bezierPath.addLine(to: CGPoint(x: 54.06, y: 42.34))
    bezierPath.addCurve(to: CGPoint(x: 53.94, y: 42.31), controlPoint1: CGPoint(x: 54, y: 42.32), controlPoint2: CGPoint(x: 54, y: 42.32))
    bezierPath.addCurve(to: CGPoint(x: 2.23, y: 67.43), controlPoint1: CGPoint(x: 32.7, y: 35.02), controlPoint2: CGPoint(x: 9.54, y: 46.27))
    bezierPath.addCurve(to: CGPoint(x: 27.45, y: 118.95), controlPoint1: CGPoint(x: -5.09, y: 88.6), controlPoint2: CGPoint(x: 6.21, y: 111.66))
    bezierPath.addCurve(to: CGPoint(x: 70.44, y: 108.3), controlPoint1: CGPoint(x: 42.77, y: 124.21), controlPoint2: CGPoint(x: 59.56, y: 119.89))
    bezierPath.addLine(to: CGPoint(x: 60.56, y: 108.33))
    bezierPath.addCurve(to: CGPoint(x: 86.37, y: 124.87), controlPoint1: CGPoint(x: 67.63, y: 115.78), controlPoint2: CGPoint(x: 76.42, y: 121.46))
    bezierPath.addCurve(to: CGPoint(x: 122.86, y: 126.49), controlPoint1: CGPoint(x: 98.28, y: 128.96), controlPoint2: CGPoint(x: 110.89, y: 129.46))
    bezierPath.addLine(to: CGPoint(x: 122.86, y: 126.49))
    bezierPath.close()
    fillColor.setFill()
    bezierPath.fill()
    context.restoreGState()
  }
  
  func drawIndentedBottomCloud(){
    let fillColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
    
    //// Bezier Drawing
    let bezierPath = UIBezierPath()
    bezierPath.move(to: CGPoint(x: 171.66, y: 45))
    bezierPath.addCurve(to: CGPoint(x: 108, y: 0), controlPoint1: CGPoint(x: 162.2, y: 18.25), controlPoint2: CGPoint(x: 136.84, y: 0))
    bezierPath.addCurve(to: CGPoint(x: 44.34, y: 45), controlPoint1: CGPoint(x: 79.16, y: 0), controlPoint2: CGPoint(x: 53.8, y: 18.25))
    bezierPath.addLine(to: CGPoint(x: 50.71, y: 47.25))
    bezierPath.addLine(to: CGPoint(x: 50.72, y: 40.5))
    bezierPath.addCurve(to: CGPoint(x: 50.62, y: 40.5), controlPoint1: CGPoint(x: 50.67, y: 40.5), controlPoint2: CGPoint(x: 50.67, y: 40.5))
    bezierPath.addCurve(to: CGPoint(x: 0, y: 91.12), controlPoint1: CGPoint(x: 22.67, y: 40.5), controlPoint2: CGPoint(x: 0, y: 63.17))
    bezierPath.addCurve(to: CGPoint(x: 50.62, y: 141.75), controlPoint1: CGPoint(x: 0, y: 119.08), controlPoint2: CGPoint(x: 22.67, y: 141.75))
    bezierPath.addCurve(to: CGPoint(x: 86.34, y: 127), controlPoint1: CGPoint(x: 64.19, y: 141.75), controlPoint2: CGPoint(x: 76.92, y: 136.38))
    bezierPath.addLine(to: CGPoint(x: 78.64, y: 128.3))
    bezierPath.addCurve(to: CGPoint(x: 108, y: 135), controlPoint1: CGPoint(x: 87.72, y: 132.69), controlPoint2: CGPoint(x: 97.7, y: 135))
    bezierPath.addCurve(to: CGPoint(x: 137.36, y: 128.3), controlPoint1: CGPoint(x: 118.3, y: 135), controlPoint2: CGPoint(x: 128.28, y: 132.69))
    bezierPath.addLine(to: CGPoint(x: 129.66, y: 127))
    bezierPath.addCurve(to: CGPoint(x: 165.38, y: 141.75), controlPoint1: CGPoint(x: 139.08, y: 136.38), controlPoint2: CGPoint(x: 151.81, y: 141.75))
    bezierPath.addCurve(to: CGPoint(x: 216, y: 91.12), controlPoint1: CGPoint(x: 193.33, y: 141.75), controlPoint2: CGPoint(x: 216, y: 119.08))
    bezierPath.addCurve(to: CGPoint(x: 165.38, y: 40.5), controlPoint1: CGPoint(x: 216, y: 63.17), controlPoint2: CGPoint(x: 193.33, y: 40.5))
    bezierPath.addCurve(to: CGPoint(x: 165.28, y: 40.5), controlPoint1: CGPoint(x: 165.33, y: 40.5), controlPoint2: CGPoint(x: 165.33, y: 40.5))
    bezierPath.addLine(to: CGPoint(x: 165.29, y: 47.25))
    bezierPath.addLine(to: CGPoint(x: 171.66, y: 45))
    bezierPath.addLine(to: CGPoint(x: 171.66, y: 45))
    bezierPath.close()
    bezierPath.move(to: CGPoint(x: 158.93, y: 49.5))
    bezierPath.addLine(to: CGPoint(x: 160.52, y: 54.01))
    bezierPath.addLine(to: CGPoint(x: 165.31, y: 54))
    bezierPath.addCurve(to: CGPoint(x: 165.38, y: 54), controlPoint1: CGPoint(x: 165.34, y: 54), controlPoint2: CGPoint(x: 165.34, y: 54))
    bezierPath.addCurve(to: CGPoint(x: 202.5, y: 91.12), controlPoint1: CGPoint(x: 185.88, y: 54), controlPoint2: CGPoint(x: 202.5, y: 70.62))
    bezierPath.addCurve(to: CGPoint(x: 165.38, y: 128.25), controlPoint1: CGPoint(x: 202.5, y: 111.63), controlPoint2: CGPoint(x: 185.88, y: 128.25))
    bezierPath.addCurve(to: CGPoint(x: 139.18, y: 117.44), controlPoint1: CGPoint(x: 155.42, y: 128.25), controlPoint2: CGPoint(x: 146.1, y: 124.32))
    bezierPath.addLine(to: CGPoint(x: 135.79, y: 114.06))
    bezierPath.addLine(to: CGPoint(x: 131.48, y: 116.14))
    bezierPath.addCurve(to: CGPoint(x: 108, y: 121.5), controlPoint1: CGPoint(x: 124.23, y: 119.65), controlPoint2: CGPoint(x: 116.25, y: 121.5))
    bezierPath.addCurve(to: CGPoint(x: 84.52, y: 116.14), controlPoint1: CGPoint(x: 99.75, y: 121.5), controlPoint2: CGPoint(x: 91.77, y: 119.65))
    bezierPath.addLine(to: CGPoint(x: 80.21, y: 114.06))
    bezierPath.addLine(to: CGPoint(x: 76.82, y: 117.44))
    bezierPath.addCurve(to: CGPoint(x: 50.62, y: 128.25), controlPoint1: CGPoint(x: 69.9, y: 124.32), controlPoint2: CGPoint(x: 60.58, y: 128.25))
    bezierPath.addCurve(to: CGPoint(x: 13.5, y: 91.12), controlPoint1: CGPoint(x: 30.12, y: 128.25), controlPoint2: CGPoint(x: 13.5, y: 111.63))
    bezierPath.addCurve(to: CGPoint(x: 50.62, y: 54), controlPoint1: CGPoint(x: 13.5, y: 70.62), controlPoint2: CGPoint(x: 30.12, y: 54))
    bezierPath.addCurve(to: CGPoint(x: 50.69, y: 54), controlPoint1: CGPoint(x: 50.66, y: 54), controlPoint2: CGPoint(x: 50.66, y: 54))
    bezierPath.addLine(to: CGPoint(x: 55.48, y: 54.01))
    bezierPath.addLine(to: CGPoint(x: 57.07, y: 49.5))
    bezierPath.addCurve(to: CGPoint(x: 108, y: 13.5), controlPoint1: CGPoint(x: 64.63, y: 28.1), controlPoint2: CGPoint(x: 84.93, y: 13.5))
    bezierPath.addCurve(to: CGPoint(x: 158.93, y: 49.5), controlPoint1: CGPoint(x: 131.07, y: 13.5), controlPoint2: CGPoint(x: 151.37, y: 28.1))
    bezierPath.addLine(to: CGPoint(x: 158.93, y: 49.5))
    bezierPath.close()
    fillColor.setFill()
    bezierPath.fill()
  }
  
  func drawLargeFilledCloud(){
    let fillColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
    
    //// Bezier Drawing
    let bezierPath = UIBezierPath()
    bezierPath.move(to: CGPoint(x: 152.09, y: 155))
    bezierPath.addLine(to: CGPoint(x: 54.46, y: 155))
    bezierPath.addCurve(to: CGPoint(x: 0, y: 100.54), controlPoint1: CGPoint(x: 24.38, y: 155), controlPoint2: CGPoint(x: 0, y: 130.62))
    bezierPath.addCurve(to: CGPoint(x: 54.46, y: 46.08), controlPoint1: CGPoint(x: 0, y: 70.46), controlPoint2: CGPoint(x: 24.38, y: 46.08))
    bezierPath.addCurve(to: CGPoint(x: 79.62, y: 52.23), controlPoint1: CGPoint(x: 63.54, y: 46.08), controlPoint2: CGPoint(x: 72.09, y: 48.3))
    bezierPath.addCurve(to: CGPoint(x: 152.91, y: 0), controlPoint1: CGPoint(x: 90.1, y: 21.83), controlPoint2: CGPoint(x: 118.95, y: 0))
    bezierPath.addCurve(to: CGPoint(x: 230.41, y: 77.5), controlPoint1: CGPoint(x: 195.71, y: 0), controlPoint2: CGPoint(x: 230.41, y: 34.7))
    bezierPath.addCurve(to: CGPoint(x: 230.36, y: 80.12), controlPoint1: CGPoint(x: 230.41, y: 78.38), controlPoint2: CGPoint(x: 230.39, y: 79.25))
    bezierPath.addCurve(to: CGPoint(x: 251.35, y: 115.2), controlPoint1: CGPoint(x: 242.86, y: 86.83), controlPoint2: CGPoint(x: 251.35, y: 100.03))
    bezierPath.addCurve(to: CGPoint(x: 211.55, y: 155), controlPoint1: CGPoint(x: 251.35, y: 137.18), controlPoint2: CGPoint(x: 233.53, y: 155))
    bezierPath.addLine(to: CGPoint(x: 152.91, y: 155))
    bezierPath.addCurve(to: CGPoint(x: 152.09, y: 155), controlPoint1: CGPoint(x: 152.78, y: 155), controlPoint2: CGPoint(x: 152.09, y: 155))
    bezierPath.addLine(to: CGPoint(x: 152.91, y: 155))
    bezierPath.addLine(to: CGPoint(x: 152.09, y: 155))
    bezierPath.close()
    bezierPath.usesEvenOddFillRule = true
    fillColor.setFill()
    bezierPath.fill()
  }
}
