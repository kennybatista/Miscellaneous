import UIKit

open class NightSky : UIView {
  //MARK: - Public Properties
  public var done = false
  
  //MARK: - Private Properties
  var dotArray : [UIView] = []
  var leftStartingX : CGFloat = 1
  var bothStartingY : CGFloat = 1
  var rightStartingX : CGFloat = 1
  
  var leftInnerStartingX : CGFloat = 1
  var rightInnterStartingX : CGFloat = 1
  var innerStartingY : CGFloat = 1
  
  var outerHoriStartingX : CGFloat = 1
  var topHoriStartingY : CGFloat = 1
  var bottomHoriStartingY : CGFloat = 1
  
  var innerHoriStartingX : CGFloat = 1
  var innerHoriTopY : CGFloat = 1
  var innerHoriBottomY : CGFloat = 1
  
  var homeButtonCenterX : CGFloat = 1
  var homeButtonCenterY : CGFloat = 1
  var homeButtonRadius : CGFloat = 1
  
  var ventStartingX : CGFloat = 1
  var ventStartingY : CGFloat = 1
  
  var microphoneStartingX : CGFloat = 1
  var microphoneStartingY : CGFloat = 1
  
  var startDisplayLinkTime : Double = -1
  var endTimeStamp : Double = 0
  var viewsAddedCounter = 0
  
  //MARK: - Lifecycle
  override public init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = #colorLiteral(red: 0, green: 0.003921568627, blue: 0.1215686275, alpha: 1)
    let w : CGFloat = self.frame.width
    let h : CGFloat = self.frame.height
    
    leftStartingX = 0.2077596996 * w
    bothStartingY = 0.1158730159 * h
    rightStartingX = 0.7834793492 * w
    
    leftInnerStartingX = 0.2321652065 * w
    rightInnterStartingX = 0.7590738423 * w
    innerStartingY = 0.1571428571 * h
    
    outerHoriStartingX = 0.296620776 * w
    topHoriStartingY = 0.06626984127 * h
    bottomHoriStartingY = 0.8337301587 * h
    
    innerHoriStartingX = 0.2453066333 * w
    innerHoriTopY = 0.1571428571 * h
    innerHoriBottomY = 0.7523809524 * h
    
    homeButtonCenterX = 0.4981226533 * w
    homeButtonCenterY = 0.7944444444 * h
    homeButtonRadius = 0.03015873016 * h
    
    ventStartingX = 0.4545075125 * w
    ventStartingY = 0.1095238095 * h
    
    microphoneStartingX = 0.4983305509 * w
    microphoneStartingY = 0.0873015873 * h
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - Public Helpers
  public func start(){
    let displaylink = CADisplayLink(target: self,
                                    selector: #selector(step))
    displaylink.add(to: .current,
                    forMode: .defaultRunLoopMode)
    
    for i in 0..<533{
      let randX = Int(arc4random_uniform(UInt32(self.frame.width)))
      let randY = Int(arc4random_uniform(UInt32(self.frame.height)))
      
      let newDot : UIView = UIView(frame: CGRect(x: Double(randX), y: Double(randY), width: 3.75, height: 3.75))
      newDot.backgroundColor = .white
      newDot.clipsToBounds = true
      newDot.layer.cornerRadius = newDot.frame.width / 2.0
      
      dotArray.append(newDot)
    }
  }
  
  
  //MARK: - Helpers
  func step(displaylink: CADisplayLink) {
    if startDisplayLinkTime == -1{
      startDisplayLinkTime = displaylink.timestamp
      endTimeStamp = 7 + startDisplayLinkTime
    }
    let curTimeStamp = displaylink.timestamp
    
    let percentToEnd = (curTimeStamp - startDisplayLinkTime) / (endTimeStamp - startDisplayLinkTime)
    
    if percentToEnd >= 1.0 &&  viewsAddedCounter >= 533{
      displaylink.remove(from: .current, forMode: .defaultRunLoopMode)
      addVert(startingX: leftStartingX, startingY: bothStartingY, startingDotIndex: 0, count : 85)
      addVert(startingX: rightStartingX, startingY: bothStartingY, startingDotIndex: 85, count : 85)
      
      //Add Inner Vertical Lines
      addVert(startingX: leftInnerStartingX, startingY: innerStartingY,startingDotIndex: 170, count : 76)
      addVert(startingX: rightInnterStartingX, startingY: innerStartingY,startingDotIndex: 246, count : 76)
      
      addHori(startingX: outerHoriStartingX, startingY: topHoriStartingY, startingDotIndex: 322, count: 33)
      addHori(startingX: outerHoriStartingX, startingY: bottomHoriStartingY, startingDotIndex: 355, count: 33)
      
      addHori(startingX: innerHoriStartingX, startingY: innerHoriTopY, startingDotIndex: 388, count: 41)
      addHori(startingX: innerHoriStartingX, startingY: innerHoriBottomY, startingDotIndex: 429, count: 41)
      
      addCircle(centerX: homeButtonCenterX, centerY: homeButtonCenterY, startingDotIndex: 470, count: 20, sides: 20, radius: Double(homeButtonRadius), rotation: 0)
      
      addHori(startingX: ventStartingX, startingY: ventStartingY, startingDotIndex: 490, count: 8)
      addHori(startingX: microphoneStartingX, startingY: microphoneStartingY, startingDotIndex: 498, count: 1)
      
      // Add the rounded edges!
      addCorner(startingDotIndex: 499, count: 34)
    }
    
    let totalViewCount : Double = 533
    // Add the right amount of views!
    let amountToShow = totalViewCount * percentToEnd
    
    while viewsAddedCounter < Int(amountToShow){
      if viewsAddedCounter >= dotArray.count{
        return
      }
      self.addSubview(dotArray[viewsAddedCounter])
      viewsAddedCounter += 1
    }
  }
  
  func addCorner(startingDotIndex: Int, count : Int){
    let xPointsTL :[CGFloat] = [0.211602671118531, 0.21661101836394, 0.222871452420701, 0.234140233722871, 0.245409015025042, 0.257929883138564, 0.271702838063439, 0.284223706176962]
    let yPointsTL :[CGFloat] = [0.105164021164021, 0.0948359788359788, 0.0868994708994709, 0.078962962962963, 0.0742010582010582, 0.0702433862433862, 0.0678518518518519, 0.0666666666666667]
    
    let xPointsTR : [CGFloat] = [0.781302170283806, 0.776293823038397, 0.770033388981636, 0.758764607679466, 0.747495826377296, 0.734974958263773, 0.721202003338898, 0.708681135225376]
    let yPointsTR : [CGFloat] = [0.105164021164021, 0.0948359788359788, 0.0868994708994709, 0.078962962962963, 0.0742010582010582, 0.0702433862433862, 0.0678518518518519, 0.0666666666666667]
    
    let xPointsBR : [CGFloat] = [0.708046744574291, 0.720567612687813, 0.733088480801336, 0.745609348914858, 0.758130217028381, 0.768146911519199, 0.775659432387312, 0.779432387312187, 0.782420701168614]
    let yPointsBR : [CGFloat] = [0.833333333333333, 0.832539682539683, 0.83015873015873, 0.826190476190476, 0.820634920634921, 0.813492063492063, 0.805555555555556, 0.797619047619048, 0.79047619047619]
    
    let xPointsBL : [CGFloat] = [0.284223706176962, 0.271702838063439, 0.259181969949917, 0.246661101836394, 0.234140233722871, 0.224123539232053, 0.21661101836394, 0.212854757929883, 0.209849749582638]
    let yPointsBL : [CGFloat] = [0.833333333333333, 0.832539682539683, 0.83015873015873, 0.826190476190476, 0.820634920634921, 0.813492063492063, 0.805555555555556, 0.797619047619048, 0.79047619047619]
    
    let allXPoints : [CGFloat] = xPointsTL + xPointsTR + xPointsBR + xPointsBL
    let allYPoints : [CGFloat] = yPointsTL + yPointsTR + yPointsBR + yPointsBL
    
    let jetBlackLabel : coolUILabel = coolUILabel(frame: CGRect(x : 43.5, y: 826, width: self.frame.width, height: 72), text: "jet black iPhone 7")
    
    jetBlackLabel.textColor = .white
    jetBlackLabel.alpha = 0
    self.addSubview(jetBlackLabel)
    jetBlackLabel.frame = CGRect(x: 43.5, y: 826 + 100, width: jetBlackLabel.frame.width, height: jetBlackLabel.frame.height)
    
    for i in startingDotIndex..<startingDotIndex+count{
      let curX = allXPoints[i - startingDotIndex] * self.frame.width
      let curY = allYPoints[i - startingDotIndex] * self.frame.height
      
      UIView.animate(withDuration: 2.5, delay: 0.3, options: [.curveEaseOut], animations: {
        self.dotArray[i].frame = CGRect(x: curX, y: curY, width: 3.75, height: 3.75)
      }, completion: { boolean in
        UIView.animate(withDuration: 1.0, animations: {
          jetBlackLabel.frame = CGRect(x: 43.5, y: 826, width: jetBlackLabel.frame.width, height: jetBlackLabel.frame.height)
          jetBlackLabel.alpha = 1
        }, completion: self.setDoneFlag)
      })
    }
    
  }
  
  func setDoneFlag(boolean : Bool){
    self.done = true
  }
  
  func addVert(startingX : CGFloat, startingY : CGFloat, startingDotIndex : Int, count : Int){
    for i in startingDotIndex..<startingDotIndex+count{
      let curY = startingY + CGFloat(Double(i - startingDotIndex) * (3.75 + 3.75))
      UIView.animate(withDuration: 2.5, delay: 0.3, options: [.curveEaseOut], animations: {
        self.dotArray[i].frame = CGRect(x: startingX, y: curY, width: 3.75, height: 3.75)
      }, completion: nil)
    }
  }
  
  func addHori(startingX : CGFloat, startingY : CGFloat, startingDotIndex : Int, count : Int){
    for i in startingDotIndex..<startingDotIndex+count{
      let curX = startingX + CGFloat(Double(i - startingDotIndex) * (3.75 + 3.75))
      UIView.animate(withDuration: 2.5, delay: 0.3, options: [.curveEaseOut], animations: {
        self.dotArray[i].frame = CGRect(x: curX, y: startingY, width: 3.75, height: 3.75)
      }, completion: nil)
    }
  }
  
  func getPolyPoints(sides: Int, radius : Double, rotation : Double, centerX: Double, centerY : Double) -> [CGPoint] {
    /*
     x[n] = r * cos(2*pi*n/N)
     y[n] = r * sin(2*pi*n/N)
     
     If you want a different centre, then just add the coordinates of the centre point to each (x[n], y[n]). If you want a different orientation, you just need to add a constant angle. So the general form is:
     
     x[n] = r * cos(2*pi*n/N + theta) + x_centre
     y[n] = r * sin(2*pi*n/N + theta) + y_centre
     */
    var result : [CGPoint] = []
    
    for i in 0..<sides{
      let x = Double(radius) * cos(2.0 * M_PI * Double(i) / Double(sides) + rotation) + Double(centerX)
      let y = Double(radius) * sin(2.0 * M_PI * Double(i) / Double(sides) + rotation) + Double(centerY)
      result.append(CGPoint(x: x, y: y))
    }
    return result
  }
  
  func addCircle(centerX : CGFloat, centerY : CGFloat, startingDotIndex : Int, count : Int, sides: Int, radius : Double, rotation : Double){
    let points = getPolyPoints(sides: sides, radius: radius, rotation: rotation, centerX: Double(centerX), centerY: Double(centerY))
    
    for i in startingDotIndex..<startingDotIndex+count{
      let curX = points[i - startingDotIndex].x
      let curY = points[i - startingDotIndex].y
      UIView.animate(withDuration: 2.5, delay: 0.3, options: [.curveEaseOut], animations: {
        self.dotArray[i].frame = CGRect(x: curX, y: curY, width: 3.75, height: 3.75)
      }, completion: nil)
    }
  }
}
