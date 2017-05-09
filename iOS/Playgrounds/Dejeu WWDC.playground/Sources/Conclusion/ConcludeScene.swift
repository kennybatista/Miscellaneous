//: Playground - noun: a place where people can play

import UIKit
open class ConcludeScene : UIView{
  //MARK: - Properties
  let dotAnimationSpeed : Double = 1.2
  let imageOverlaySpeed : Double = 0.75
  var allDots : [UIView] = []
  var blueIndexs : [Int] = []
  var greenIndexs : [Int] = []
  var orangeIndexs : [Int] = []
  var redIndexs : [Int] = []
  var purpleIndexs : [Int] = []
  var yellowIndexs : [Int] = []
  
  let green = #colorLiteral(red: 0.4784313725, green: 0.6823529412, blue: 0.2196078431, alpha: 1)
  let greenCount = 62
  let orange = #colorLiteral(red: 0.8549019608, green: 0.5333333333, blue: 0.1921568627, alpha: 1)
  let orangeCount = 42
  let yellow = #colorLiteral(red: 0.9411764706, green: 0.737254902, blue: 0.2666666667, alpha: 1)
  let yellowCount = 42
  let red = #colorLiteral(red: 0.7137254902, green: 0.231372549, blue: 0.2235294118, alpha: 1)
  let redCount = 44
  let blue = #colorLiteral(red: 0.2392156863, green: 0.5529411765, blue: 0.7882352941, alpha: 1)
  let blueCount = 35
  let purple = #colorLiteral(red: 0.4862745098, green: 0.1960784314, blue: 0.4352941176, alpha: 1)
  let purpleCount = 42
  
  var possibleColors : [UIColor] = []
  
  var startDisplayLinkTime : Double = -1
  var endTimeStamp : Double = 0
  var viewsAddedCounter = 0
  
  //MARK: - Lifecycle
  override public init(frame: CGRect) {
    super.init(frame: frame)
    possibleColors = [green, orange, yellow, red, blue, purple]
    
    var greenC = 0
    var blueC = 0
    var redC = 0
    var yellowC = 0
    var orangeC = 0
    var purpleC = 0
    
    for i in 0..<267{
      let randX = Int(arc4random_uniform(UInt32(self.frame.width)))
      let randY = Int(arc4random_uniform(UInt32(self.frame.height)))
      
      let newDot : UIView = UIView(frame: CGRect(x: Double(randX), y: Double(randY), width: 15, height: 15))
      newDot.layer.cornerRadius = newDot.frame.width / 2.0
      
      let randColorIndex = Int(arc4random_uniform(UInt32(possibleColors.count)))
      let color = possibleColors[randColorIndex]
      switch color{
      case green:
        greenC += 1
        greenIndexs.append(i)
        if greenC == greenCount{
          possibleColors.remove(at: randColorIndex)
        }
      case blue:
        blueC += 1
        blueIndexs.append(i)
        if blueC == blueCount{
          possibleColors.remove(at: randColorIndex)
        }
      case red:
        redC += 1
        redIndexs.append(i)
        if redC == redCount{
          possibleColors.remove(at: randColorIndex)
        }
      case yellow:
        yellowC += 1
        yellowIndexs.append(i)
        if yellowC == yellowCount{
          possibleColors.remove(at: randColorIndex)
        }
      case purple:
        purpleC += 1
        purpleIndexs.append(i)
        if purpleC == purpleCount{
          possibleColors.remove(at: randColorIndex)
        }
      case orange:
        orangeC += 1
        orangeIndexs.append(i)
        if orangeC == orangeCount{
          possibleColors.remove(at: randColorIndex)
        }
      default:
        break
      }
      
      newDot.backgroundColor = color
      newDot.clipsToBounds = true
      newDot.layer.cornerRadius = newDot.frame.width / 2.0
      
      allDots.append(newDot)
    }
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  //MARK: - Public Helpers
  public func start(){
    let displaylink = CADisplayLink(target: self,
                                    selector: #selector(updateDots))
    displaylink.add(to: .current,
                    forMode: .defaultRunLoopMode)
  }
  
  
  //MARK: - Helpers
  func updateDots(displaylink: CADisplayLink){
    if startDisplayLinkTime == -1{
      startDisplayLinkTime = displaylink.timestamp
      endTimeStamp = 6 + startDisplayLinkTime
    }
    let curTimeStamp = displaylink.timestamp
    
    let percentToEnd = (curTimeStamp - startDisplayLinkTime) / (endTimeStamp - startDisplayLinkTime)
    
    if percentToEnd >= 1.0 &&  viewsAddedCounter >= 267{
      displaylink.remove(from: .current, forMode: .defaultRunLoopMode)
      animateBlue()
      
    }
    let totalViewCount : Double = 267
    // Add the right amount of views!
    let amountToShow = totalViewCount * percentToEnd
    
    while viewsAddedCounter < Int(amountToShow){
      if viewsAddedCounter >= allDots.count{
        return
      }
      self.addSubview(allDots[viewsAddedCounter])
      viewsAddedCounter += 1
    }
  }
  
  func animateBlue(){
    // Blue Group 35 dots
    addHori(startingX: 172, startingY: 600, startingDotIndex: 0, count: 12, indexArray : blueIndexs)
    addHori(startingX: 183, startingY: 615, startingDotIndex: 12, count: 11, indexArray : blueIndexs)
    addHori(startingX: 200, startingY: 630, startingDotIndex: 23, count: 4, indexArray : blueIndexs)
    addHori(startingX: 331, startingY: 630, startingDotIndex: 27, count: 4, indexArray : blueIndexs)
    addHori(startingX: 212, startingY: 645, startingDotIndex: 31, count: 2, indexArray : blueIndexs)
    addHori(startingX: 364, startingY: 645, startingDotIndex: 33, count: 2, indexArray : blueIndexs, completionBlock: { boolean in
      self.animatePurple()
    })
    // Top Left - 172, 600....12 dots
    // Mid Left - 183, 615 ... 11 dots
    // PartialLeft - 200, 630... 4
    // partialRight - 331, 630...4
    // minLeft - 212, 645...2
    // minRight - 364, 645...2
  }
  
  func animatePurple(){
    // PurpleGroup 42 Dots
    // TopLeft - 141, 546...15
    // MidLeft - 153, 564...14
    // BottomLeft - 163, 582 ...13
    addHori(startingX: 141, startingY: 546, startingDotIndex: 0, count: 15, indexArray : purpleIndexs)
    addHori(startingX: 153, startingY: 564, startingDotIndex: 15, count: 14, indexArray : purpleIndexs)
    addHori(startingX: 163, startingY: 582, startingDotIndex: 29, count: 13, indexArray : purpleIndexs, completionBlock: { boolean in
      self.animateRed()
    })
  }
  
  func animateRed(){
    // RedGroup 44 Dots
    // TopLeft - 125, 493 ... 14
    // MidLeft - 129, 512 ... 15
    // BottomLeft - 138, 530 ... 15
    addHori(startingX: 125, startingY: 493, startingDotIndex: 0, count: 14, indexArray : redIndexs)
    addHori(startingX: 129, startingY: 512, startingDotIndex: 14, count: 15, indexArray : redIndexs)
    addHori(startingX: 138, startingY: 530, startingDotIndex: 29, count: 15, indexArray : redIndexs, completionBlock: { boolean in
      self.animateOrange()
    })
  }
  
  func animateOrange(){
    // OrangeGroup 42
    // TopLeft - 121, 439 ... 14
    // MidLeft - 120, 458 ... 14
    // BottomLeft - 122, 477 ... 14
    addHori(startingX: 121, startingY: 439, startingDotIndex: 0, count: 14, indexArray : orangeIndexs)
    addHori(startingX: 120, startingY: 458, startingDotIndex: 14, count: 14, indexArray : orangeIndexs)
    addHori(startingX: 122, startingY: 477, startingDotIndex: 28, count: 14, indexArray : orangeIndexs, completionBlock: { boolean in
      self.animateYellow()
    })
  }
  
  func animateYellow(){
    // YellowGroup 42
    // TopLeft - 135, 385 ... 14
    // MiddleLeft - 128, 404 ... 14
    // BottomLeft - 122, 423 ... 14
    addHori(startingX: 135, startingY: 385, startingDotIndex: 0, count: 14, indexArray : yellowIndexs)
    addHori(startingX: 128, startingY: 404, startingDotIndex: 14, count: 14, indexArray : yellowIndexs)
    addHori(startingX: 122, startingY: 423, startingDotIndex: 28, count: 14, indexArray : yellowIndexs, completionBlock: { boolean in
      self.animateGreen()
    })
  }
  
  func animateGreen(){
    // GreenGroup 42
    // BottomLeft - 147, 370 ... 14
    // MiddleLeft - 161, 355 ... 14
    // PartialLeft - 172, 340 ... 5
    // PartialRight - 330, 340 ... 5
    // MinLeft - 205, 325 ... 2
    // Min Right - 365, 325 ... 2
    addHori(startingX: 147, startingY: 370, startingDotIndex: 0, count: 14, indexArray : greenIndexs)
    addHori(startingX: 161, startingY: 355, startingDotIndex: 14, count: 14, indexArray : greenIndexs)
    addHori(startingX: 172, startingY: 340, startingDotIndex: 28, count: 5, indexArray : greenIndexs)
    addHori(startingX: 330, startingY: 340, startingDotIndex: 33, count: 5, indexArray : greenIndexs)
    addHori(startingX: 205, startingY: 325, startingDotIndex: 38, count: 2, indexArray : greenIndexs)
    addHori(startingX: 365, startingY: 325, startingDotIndex: 40, count: 2, indexArray : greenIndexs)
    animateLeaf()
  }
  
  func animateLeaf(){
    //Leaf 20 dots
    let leafX : [CGFloat] = [294, 295, 309, 300, 314, 328, 306, 319, 332, 345, 316, 329, 342, 355, 334, 347, 361, 351, 365, 366]
    let leafY : [CGFloat] = [320, 304, 315, 288, 298, 308, 272, 281, 290, 299, 258, 267, 276, 285, 247, 256, 267, 239, 250, 234]
    
    for i in 0..<leafX.count {
      let curX = leafX[i]
      let curY = leafY[i]
      if i == leafX.count - 1{
        UIView.animate(withDuration: dotAnimationSpeed, delay: 0.3, options: [.curveEaseOut], animations: {
          self.allDots[self.greenIndexs[i + 42]].frame = CGRect(x: curX, y: curY, width: 15, height: 15)
        }, completion: startAnimatingImages)
      }
      else{
        UIView.animate(withDuration: dotAnimationSpeed, delay: 0.3, options: [.curveEaseOut], animations: {
          self.allDots[self.greenIndexs[i + 42]].frame = CGRect(x: curX, y: curY, width: 15, height: 15)
        }, completion: nil)
      }
    }
  }
  
  func startAnimatingImages(status : Bool){
    let blueStageImage = UIImageView(image: UIImage(named: "blueStageImage"))
    blueStageImage.frame = CGRect(x: 114, y: 600, width: 372, height: 66)
    blueStageImage.alpha = 0
    self.addSubview(blueStageImage)
    
    let purpleStageImage = UIImageView(image : UIImage(named: "purpleStageImage"))
    purpleStageImage.frame = CGRect(x: 114, y: 547, width: 372, height: 119)
    purpleStageImage.alpha = 0
    self.addSubview(purpleStageImage)
    
    let redStageImage = UIImageView(image : UIImage(named: "redStageImage"))
    redStageImage.frame = CGRect(x: 114, y: 493, width: 372, height: 173)
    redStageImage.alpha = 0
    self.addSubview(redStageImage)
    
    let orangeStageImage = UIImageView(image : UIImage(named: "orangeStageImage"))
    orangeStageImage.frame = CGRect(x: 114, y: 439, width: 372, height: 225)
    orangeStageImage.alpha = 0
    self.addSubview(orangeStageImage)
    
    let yellowStageImage = UIImageView(image : UIImage(named: "yellowStageImage"))
    yellowStageImage.frame = CGRect(x: 114, y: 385, width: 372, height: 281)
    yellowStageImage.alpha = 0
    self.addSubview(yellowStageImage)
    
    let greenStageImage = UIImageView(image : UIImage(named: "greenStageImage"))
    greenStageImage.frame = CGRect(x: 114, y: 226, width: 372, height: 440)
    greenStageImage.alpha = 0
    self.addSubview(greenStageImage)
    
    transitionFromDotsToImage(array: blueIndexs, image: blueStageImage, completionBlock: {
      self.transitionFromDotsToImage(array: self.purpleIndexs, image: purpleStageImage, completionBlock:  {
        self.transitionFromDotsToImage(array: self.redIndexs, image: redStageImage, completionBlock: {
          self.transitionFromDotsToImage(array: self.orangeIndexs, image: orangeStageImage, completionBlock: {
            self.transitionFromDotsToImage(array: self.yellowIndexs, image: yellowStageImage, completionBlock: {
              self.transitionFromDotsToImage(array: self.greenIndexs, image: greenStageImage, completionBlock: {
                self.addThankYouLabel()
              })
            })
          })
        })
      })
    })
  }
  
  func addThankYouLabel(){
    // Thank you y cord 694
    // SF Light 60
    // T H A N K   Y O U
    let thankYou = UILabel(frame: CGRect(x: 0, y: 694, width: self.frame.width, height: 72))
    
    
    var myString:NSString = "T H A N K   Y O U"
    var myMutableString = NSMutableAttributedString()
    
    myMutableString = NSMutableAttributedString(string: myString as String, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 60, weight: UIFontWeightLight)])
    
    myMutableString.addAttribute(NSForegroundColorAttributeName, value: blue, range: NSRange(location:0,length:1))
    myMutableString.addAttribute(NSForegroundColorAttributeName, value: purple, range: NSRange(location:2,length:1))
    myMutableString.addAttribute(NSForegroundColorAttributeName, value: red, range: NSRange(location:4,length:1))
    myMutableString.addAttribute(NSForegroundColorAttributeName, value: orange, range: NSRange(location:6,length:1))
    myMutableString.addAttribute(NSForegroundColorAttributeName, value: yellow, range: NSRange(location:8,length:1))
    myMutableString.addAttribute(NSForegroundColorAttributeName, value: green, range: NSRange(location:12,length:5))
    
    
    thankYou.attributedText = myMutableString
    
    thankYou.textAlignment = .center
    thankYou.alpha = 0
    self.addSubview(thankYou)
    UIView.animate(withDuration: imageOverlaySpeed, delay: 0.3, options: [.curveEaseOut], animations: {
      thankYou.alpha = 1
    }, completion: nil)
  }
  
  func transitionFromDotsToImage(array: [Int], image : UIImageView, completionBlock: (() -> ())? = nil){
    UIView.animate(withDuration: imageOverlaySpeed, delay: 0.0, options: [.curveEaseOut], animations: {
      image.alpha = 1
      
    }, completion: nil)
    
    for i in 0..<array.count {
      if i == array.count - 1{
        UIView.animate(withDuration: imageOverlaySpeed, delay: 0.0, options: [.curveEaseOut], animations: {
          self.allDots[array[i]].alpha = 0
        }, completion: { boolean in
          completionBlock!()
        })
      }
      else{
        UIView.animate(withDuration: imageOverlaySpeed, delay: 0.0, options: [.curveEaseOut], animations: {
          self.allDots[array[i]].alpha = 0
          
        }, completion: nil)
      }
    }
    // For all dots in array - Fade out
    // at the same time have the image view fade in
    
  }
  
  func addHori(startingX : CGFloat, startingY : CGFloat, startingDotIndex : Int, count : Int, indexArray : [Int], completionBlock: ((Bool) -> ())? = nil){
    for i in 0..<count{
      let curX = startingX + CGFloat(Double(i) * (7.5 + 15))
      if i == count-1 {
        UIView.animate(withDuration: dotAnimationSpeed, delay: 0.3, options: [.curveEaseOut], animations: {
          self.allDots[indexArray[i + startingDotIndex]].frame = CGRect(x: curX, y: startingY, width: 15, height: 15)
        }, completion: completionBlock)
      }
      else{
        UIView.animate(withDuration: dotAnimationSpeed, delay: 0.3, options: [.curveEaseOut], animations: {
          
          self.allDots[indexArray[i + startingDotIndex]].frame = CGRect(x: curX, y: startingY, width: 15, height: 15)
        })
      }
      
    }
  }
}
