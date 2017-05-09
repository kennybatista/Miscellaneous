//: Playground - noun: a place where people can play

import UIKit

open class WWDC2016Scene : UIView {
  //MARK: - Public Vars
  public var done = false
  
  
  //MARKL - Properties
  let background = #colorLiteral(red: 0.1560676694, green: 0.163968116, blue: 0.2117111683, alpha: 1)
  let blue = #colorLiteral(red: 0.008550111204, green: 0.6733478904, blue: 0.6374569535, alpha: 1)
  let red = #colorLiteral(red: 0.8803832531, green: 0.2371731997, blue: 0.2013332248, alpha: 1)
  let orange = #colorLiteral(red: 0.8292843103, green: 0.5515872836, blue: 0.3600230813, alpha: 1)
  let purple = #colorLiteral(red: 0.7077464461, green: 0.2335175574, blue: 0.6035909653, alpha: 1)
  let green = #colorLiteral(red: 0.5861430168, green: 0.778504312, blue: 0.4401960969, alpha: 1)
  
  var startingPointPercent : CGFloat = 1156.0 / 2208.0
  var heightOfLine : CGFloat = 0
  var shift1 : CGFloat = 0
  var shift2 : CGFloat = 0
  var startingPoint : CGFloat = 0
  var startingWidth : CGFloat = 0
  
  var blueLine = UIView()
  var redLine = UIView()
  var orangeLine = UIView()
  var purpleLine = UIView()
  var greenLine = UIView()

  
  //MARK: - Lifecycle
  override public init(frame: CGRect){
    super.init(frame: frame)
    self.backgroundColor = backgroundColor
    
    heightOfLine = (15.0 / 2208.0) * self.frame.height
    shift1 = (7.0 / 2208.0) * self.frame.height
    shift2 = (8.0 / 2208.0) * self.frame.height
    startingPoint = self.frame.height * startingPointPercent
    startingWidth = 0
    
    blueLine.frame = CGRect(x: 0, y: startingPoint, width: startingWidth, height: heightOfLine)
    redLine.frame =  CGRect(x: 0, y: startingPoint + heightOfLine + shift1, width: startingWidth, height: heightOfLine)
    orangeLine.frame = CGRect(x: 0, y: startingPoint + (heightOfLine * 2) + shift1 + shift2, width: startingWidth, height: heightOfLine)
    purpleLine.frame = CGRect(x: 0, y: startingPoint + (heightOfLine * 3) + (shift1 * 2) + shift2, width: startingWidth, height: heightOfLine)
    greenLine.frame = CGRect(x: 0, y: startingPoint + (heightOfLine * 4) + (shift1 * 2) + (shift2 * 2), width: startingWidth, height: heightOfLine)
    
    blueLine.backgroundColor = blue
    redLine.backgroundColor = red
    orangeLine.backgroundColor = orange
    purpleLine.backgroundColor = purple
    greenLine.backgroundColor = green
    
    self.addSubview(blueLine)
    self.addSubview(redLine)
    self.addSubview(orangeLine)
    self.addSubview(purpleLine)
    self.addSubview(greenLine)
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  //MARK: - Public Helpers
  public func start(){
    UIView.animate(withDuration: 2.0, animations : {
      self.blueLine.frame = CGRect(x: self.blueLine.frame.minX, y: self.blueLine.frame.minY, width: self.bounds.width, height: self.blueLine.frame.height)
      
      self.redLine.frame = CGRect(x: self.redLine.frame.minX, y: self.redLine.frame.minY, width: self.bounds.width, height: self.redLine.frame.height)
      
      self.orangeLine.frame = CGRect(x: self.orangeLine.frame.minX, y: self.orangeLine.frame.minY, width: self.bounds.width, height: self.orangeLine.frame.height)
      
      self.purpleLine.frame = CGRect(x: self.purpleLine.frame.minX, y: self.purpleLine.frame.minY, width: self.bounds.width, height: self.purpleLine.frame.height)
      
      self.greenLine.frame = CGRect(x: self.greenLine.frame.minX, y: self.greenLine.frame.minY, width: self.bounds.width, height: self.greenLine.frame.height)
    }, completion : { boolean in
        self.done = true
    })
    addWWDCLabel()
    addApple()
  }
  
  
  //MARK: - Helpers
  func addApple(){
    let appleRatio : CGFloat =  1102.0 / 1289.0
    let appleIconView = AppleIconView(frame: CGRect.init(x: 0, y: 0, width: (appleRatio * 325.0 / 2208.0) * self.frame.height, height: (325.0 / 2208.0) * self.frame.height))
    appleIconView.addMask()
    appleIconView.backgroundColor = red
    appleIconView.frame = CGRect(x: self.center.x - (appleIconView.frame.width / 2.0), y: blueLine.frame.minY - ((137.0 / 2208.0) * self.frame.height), width: appleIconView.frame.width, height: appleIconView.frame.height)
    appleIconView.alpha = 0
    self.addSubview(appleIconView)

    UIView.animate(withDuration: 0.5, animations: {
      appleIconView.alpha = 1
    }, completion: nil)
    
  }
  
  func addWWDCLabel(){
    let labelSpacing : CGFloat = (130.0 / 2208.0) * self.frame.height
    let labelHeight : CGFloat = (67.0 / 2208.0) * self.frame.height
    let WWDC2016Label = UILabel(frame: CGRect(x: 0, y: labelSpacing + greenLine.frame.maxY, width: self.frame.width, height: labelHeight))
    let myString:NSString = "W W D C 1 6"
    var myMutableString = NSMutableAttributedString()
    myMutableString = NSMutableAttributedString(string: myString as String, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: (67.0 / 2208.0) * self.frame.height, weight: UIFontWeightThin)])
    myMutableString.addAttribute(NSForegroundColorAttributeName, value: green, range: NSRange(location:0,length:1))
    myMutableString.addAttribute(NSForegroundColorAttributeName, value: purple, range: NSRange(location:2,length:1))
    myMutableString.addAttribute(NSForegroundColorAttributeName, value: orange, range: NSRange(location:4,length:1))
    myMutableString.addAttribute(NSForegroundColorAttributeName, value: red, range: NSRange(location:6,length:1))
    myMutableString.addAttribute(NSForegroundColorAttributeName, value: blue, range: NSRange(location:8,length:3))
    WWDC2016Label.attributedText = myMutableString
    WWDC2016Label.textAlignment = .center
    WWDC2016Label.alpha = 0
    self.addSubview(WWDC2016Label)
    UIView.animate(withDuration: 0.5, animations: {
      WWDC2016Label.alpha = 1
    }, completion: nil)
  }
}





