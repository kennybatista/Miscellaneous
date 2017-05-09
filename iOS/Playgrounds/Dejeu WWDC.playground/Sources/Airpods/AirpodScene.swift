import UIKit

extension Cloud {
  func moveCloudAnimation(from dir : dir, shift : CGFloat, delay: Double){
    UIView.animate(withDuration: 2.5, delay: delay, animations: {
      switch dir {
      case .left:
        self.frame = CGRect(x: self.frame.minX + shift, y: self.frame.minY, width: self.frame.width, height: self.frame.height)
      case .right:
        self.frame = CGRect(x: self.frame.minX - shift, y: self.frame.minY, width: self.frame.width, height: self.frame.height)
      }
    })
  }
  
  func shiftCloudToStarting(dir : dir, shift : CGFloat){
    switch dir{
    case .left:
      self.frame = CGRect(x: self.frame.minX - shift, y: self.frame.minY, width: self.frame.width, height: self.frame.height)
    case .right:
      self.frame = CGRect(x: self.frame.minX + shift, y: self.frame.minY, width: self.frame.width, height: self.frame.height)
    }
  }
  
  func fadeOut(){
    UIView.animate(withDuration: 3.0, animations: {
      self.alpha = 0
    })
  }
}

public enum dir{
  case left
  case right
}

open class AirPodScene : UIView {
  //MARK: - Public Properties
  public var done = false
  
  
  //MARK: - Properties
  var miniSun = UIView()
  var group1L : [Cloud] = []
  var group2L : [Cloud] = []
  var group3L : [Cloud] = []
  
  var group1R : [Cloud] = []
  var group2R : [Cloud] = []
  var group3R : [Cloud] = []
  
  let leftAirpodStartingX : CGFloat = 25
  let leftAirpodStartingY : CGFloat = 198
  
  let leftAirpodRotatedX : CGFloat = 170
  let leftAirpodRotatedY : CGFloat = 124
  
  let leftAirpodFinalX : CGFloat = 170
  let leftAirpodFinalY : CGFloat = 767
  
  let rightAirpodStartingX : CGFloat = 314
  let rightAirpodStartingY : CGFloat = 197
  
  let rightAirpodRotatedX : CGFloat = 317
  let rightAirpodRotatedY : CGFloat = 124
  
  let rightAirpodFinalX : CGFloat = 317
  let rightAirpodFinalY : CGFloat = 767
  
  let smallCloud : Cloud = Cloud(frame : CGRect(x: 36, y: 32.25, width: 125.25, height: 78))
  let doubleCloud : Cloud = Cloud(frame : CGRect(x: 366.75, y: 33, width: 213, height: 105))
  let singleCenterCloud : Cloud = Cloud(frame: CGRect(x: 198.75, y: 75.75, width: 172.5, height: 104.25))
  let singleLeftCloud : Cloud = Cloud(frame: CGRect(x: 39, y: 138, width: 148.5, height: 99))
  let bigFillCloud : Cloud = Cloud(frame: CGRect(x: 113.25, y: 110.25, width: 220.5, height: 139.5))
  let longRightCloud : Cloud = Cloud(frame: CGRect(x: 334.5, y: 187.5, width: 189, height: 99))
  let filledSmallRightCloud : Cloud = Cloud(frame: CGRect(x: 473.25, y: 232.5, width: 125.25, height: 78))
  
  let fatLeftLongCloud : Cloud = Cloud(frame: CGRect(x: 36, y: 272.25, width: 229.5, height: 135))
  let tripleBumpCloud : Cloud = Cloud(frame: CGRect(x: 361.5, y: 354.75, width: 216, height: 141.75))
  let largestCloud : Cloud = Cloud(frame: CGRect(x: 177, y: 354.75, width: 252, height: 156))
  
  let leftAirPodCloud : Cloud = Cloud(frame: CGRect(x: -123.24, y: 241.88, width: 271.25, height: 126))
  let rightAirPodCloud : Cloud = Cloud(frame: CGRect(x: 406.5, y: 110.25, width: 271.25, height: 126))
  
  var startDisplayLinkTime : Double = -1
  var endTimeStamp : Double = 0
  var stageOneFlag = -1
  var stageTwoFlag = -1
  var stageThreeFlag = -1
  
  var moveAndRotateAirpodsFlag = -1
  var transformToDetailAirPodFlag = -1
  var moveToFinalLocationFlag = -1
  
  var firstRun = -1
  
  
  //MARK: - Lifecycle
  override public init(frame : CGRect){
    super.init(frame: frame)
    
    doubleCloud.cloudType = .partialLeftAndFullRightCloud
    singleCenterCloud.cloudType = .basicOutlineCloud
    singleLeftCloud.cloudType = .outlinedCloud
    bigFillCloud.cloudType = .bigBasicFilledCloud
    fatLeftLongCloud.cloudType = .midLongCloud
    longRightCloud.cloudType = .outlinedLongCloud
    largestCloud.cloudType = .largeFilledCloud
    tripleBumpCloud.cloudType = .indentedBottomCloud
    
    leftAirPodCloud.cloudType = .leftAirpodCloud
    rightAirPodCloud.cloudType = .rightAirpodCloud
    
    self.addSubview(smallCloud)
    self.addSubview(doubleCloud)
    self.addSubview(singleCenterCloud)
    self.addSubview(singleLeftCloud)
    self.addSubview(bigFillCloud)
    self.addSubview(fatLeftLongCloud)
    self.addSubview(filledSmallRightCloud)
    self.addSubview(rightAirPodCloud)
    self.addSubview(leftAirPodCloud)
    self.addSubview(tripleBumpCloud)
    self.addSubview(largestCloud)
    self.addSubview(longRightCloud)
    
    sendCloudsToStartingPosition()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  //MARK: - Helpers
  func start(){
    self.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.7529411765, blue: 0.2588235294, alpha: 1)
    miniSun.removeFromSuperview()
    
    let displaylink = CADisplayLink(target: self,
                                    selector: #selector(animateClouds))
    displaylink.add(to: .current,
                    forMode: .defaultRunLoopMode)
  }
  
  func animateClouds(displaylink: CADisplayLink) {
    if startDisplayLinkTime == -1{
      startDisplayLinkTime = displaylink.timestamp
      endTimeStamp = 8 + startDisplayLinkTime
    }
    let curTimeStamp = displaylink.timestamp
    
    let percentToEnd = (curTimeStamp - startDisplayLinkTime) / (endTimeStamp - startDisplayLinkTime)
    
    if percentToEnd >= 1.0{
      displaylink.remove(from: .current, forMode: .defaultRunLoopMode)
      startDisplayLinkTime == -1
      let displaylink = CADisplayLink(target: self,
                                      selector: #selector(animateAirpodPath))
      displaylink.add(to: .current,
                      forMode: .defaultRunLoopMode)
    }
    
    if percentToEnd >= 0.0 && stageOneFlag == -1{
      stageOneFlag = 1
      
      for i in 0..<group1L.count{
        group1L[i].moveCloudAnimation(from: .left, shift: self.frame.width, delay: (8.0 / 3.0 / Double(group1L.count)) * Double(i))
      }
      for i in 0..<group1R.count{
        let halfStep = ((8.0 / 3.0 / Double(group1R.count))) / 2.0
        group1R[i].moveCloudAnimation(from: .right, shift: self.frame.width, delay: (8.0 / 3.0 / Double(group1R.count)) * Double(i) + halfStep)
      }
    }
    if percentToEnd >= 0.333333 && stageTwoFlag == -1{
      stageTwoFlag = 1
      
      for i in 0..<group2L.count{
        group2L[i].moveCloudAnimation(from: .left, shift: self.frame.width, delay: (8.0 / 3.0 / Double(group2L.count)) * Double(i))
      }
      for i in 0..<group2R.count{
        let halfStep = ((8.0 / 3.0 / Double(group2R.count))) / 2.0
        group2R[i].moveCloudAnimation(from: .right, shift: self.frame.width, delay: (8.0 / 3.0 / Double(group2R.count)) * Double(i) + halfStep)
      }
    }
    if percentToEnd >= 0.666666 && stageThreeFlag == -1{
      stageThreeFlag = 1
      
      for i in 0..<group3L.count{
        group3L[i].moveCloudAnimation(from: .left, shift: self.frame.width, delay: (8.0 / 3.0 / Double(group3L.count)) * Double(i))

      }
      for i in 0..<group3R.count{
        group3R[i].moveCloudAnimation(from: .right, shift: self.frame.width, delay: (8.0 / 3.0 / Double(group3R.count)) * Double(i))

      }
    }
  }
  
  func animateAirpodPath(displaylink: CADisplayLink) {
    var detailLeftPod = AirPod()
    var detailRightPod = AirPod()
    
    if firstRun == -1{
      firstRun = 0
      
      startDisplayLinkTime = displaylink.timestamp
      endTimeStamp = 9 + startDisplayLinkTime
    }
    let curTimeStamp = displaylink.timestamp
    
    let percentToEnd = (curTimeStamp - startDisplayLinkTime) / (endTimeStamp - startDisplayLinkTime)
    
    if percentToEnd >= 1.0{
      displaylink.remove(from: .current, forMode: .defaultRunLoopMode)
    }
    
    if percentToEnd >= 0.0 && moveAndRotateAirpodsFlag == -1 {
      
      moveAndRotateAirpodsFlag = 1
      let allClouds = [smallCloud, doubleCloud, singleCenterCloud, singleLeftCloud, bigFillCloud, fatLeftLongCloud, filledSmallRightCloud, tripleBumpCloud, largestCloud, longRightCloud]
      
      for cloud in allClouds{
        cloud.fadeOut()
      }
      animateAirPodsToCenter()
    }
    
    if percentToEnd >= 0.3333333 && transformToDetailAirPodFlag == -1{
      
      transformToDetailAirPodFlag = 1
      detailLeftPod = AirPod(frame: CGRect(x: leftAirpodRotatedX, y: leftAirpodRotatedY, width: leftAirPodCloud.frame.width, height: leftAirPodCloud.frame.height))
      detailLeftPod.style = .left
      detailLeftPod.alpha = 0
      detailLeftPod.backgroundColor = .clear
      
      detailRightPod = AirPod(frame: CGRect(x: rightAirpodRotatedX, y: rightAirpodRotatedY, width: rightAirPodCloud.frame.width, height: rightAirPodCloud.frame.height))
      detailRightPod.style = .right
      detailRightPod.alpha = 0
      detailRightPod.backgroundColor = .clear
      
      
      self.addSubview(detailLeftPod)
      self.addSubview(detailRightPod)
      
      let airpodLabel : coolUILabel = coolUILabel(frame: CGRect(x: 0, y: 27, width: self.frame.width, height: 72), text: "airpods")
      airpodLabel.alpha = 0
      airpodLabel.textAlignment = .center
      self.addSubview(airpodLabel)
      
      UIView.animate(withDuration: 1.5, delay: 0.5, animations: {
        airpodLabel.alpha = 1
      })

      UIView.animate(withDuration: 2.0, animations: {
        
        detailLeftPod.alpha = 1
        detailRightPod.alpha = 1
        self.leftAirPodCloud.alpha = 0
        self.rightAirPodCloud.alpha = 0
      })
      
      UIView.animate(withDuration: 3.0, delay: 2.0,animations: {
        detailLeftPod.frame = CGRect(x: self.leftAirpodFinalX, y: self.leftAirpodFinalY, width: detailLeftPod.frame.width, height: detailLeftPod.frame.height)
        detailRightPod.frame = CGRect(x: self.rightAirpodFinalX, y: self.rightAirpodFinalY, width: detailRightPod.frame.width, height: detailRightPod.frame.height)
      }, completion: { boolean in
        self.done = true
        displaylink.remove(from: .current, forMode: .defaultRunLoopMode)
        
      })
      moveToFinalLocationFlag = 1
    }
  }
  
  func animateAirPodsToCenter(){
    UIView.animate(withDuration: 3.0, animations: {
      self.leftAirPodCloud.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI_2))
      self.leftAirPodCloud.frame = CGRect(x: self.leftAirpodRotatedX, y: self.leftAirpodRotatedY, width: self.leftAirPodCloud.frame.width, height: self.leftAirPodCloud.frame.height)
      
      
      self.rightAirPodCloud.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_2))
      self.rightAirPodCloud.frame = CGRect(x: self.rightAirpodRotatedX, y: self.rightAirpodRotatedY, width: self.rightAirPodCloud.frame.width, height: self.rightAirPodCloud.frame.height)
    })
  }
  
  func sendCloudsToStartingPosition(){
    let w = self.frame.width
    group1L = [doubleCloud, bigFillCloud]
    group2L = [singleCenterCloud, singleLeftCloud]
    group3L = [smallCloud, leftAirPodCloud, tripleBumpCloud]
    
    group1R = [fatLeftLongCloud,longRightCloud]
    group2R = [rightAirPodCloud, largestCloud]
    group3R = [filledSmallRightCloud]
    smallCloud.shiftCloudToStarting(dir: .left, shift : w)
    doubleCloud.shiftCloudToStarting(dir: .left, shift: w)
    singleCenterCloud.shiftCloudToStarting(dir: .left, shift: w)
    bigFillCloud.shiftCloudToStarting(dir: .left, shift: w)
    singleLeftCloud.shiftCloudToStarting(dir: .left, shift: w)
    
    fatLeftLongCloud.shiftCloudToStarting(dir: .right, shift: w)
    filledSmallRightCloud.shiftCloudToStarting(dir: .right, shift: w)
    filledSmallRightCloud.shiftCloudToStarting(dir: .right, shift: w)
    leftAirPodCloud.shiftCloudToStarting(dir: .left, shift: w)
    rightAirPodCloud.shiftCloudToStarting(dir: .right, shift: w)
    tripleBumpCloud.shiftCloudToStarting(dir: .left, shift: w)
    largestCloud.shiftCloudToStarting(dir: .right, shift: w)
    longRightCloud.shiftCloudToStarting(dir: .right, shift: w)
  }
  
  //MARK: - Public Helpers
  public func addSunAndAnimate(){
    let startingRadius = self.frame.width / 2.0
    
    miniSun.frame = CGRect(x: startingRadius, y: self.frame.height - startingRadius, width: startingRadius * 2.0, height: startingRadius * 2.0)
    miniSun.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.7529411765, blue: 0.2588235294, alpha: 1)
    miniSun.clipsToBounds = true
    miniSun.layer.cornerRadius = startingRadius
    miniSun.alpha = 0
    
    self.addSubview(miniSun)
    UIView.animate(withDuration: 1.0, delay : 1.0, animations: {
      self.miniSun.alpha = 1.0
    }, completion: { boolean in
      UIView.animate(withDuration: 3.0, animations: {
        self.miniSun.transform = CGAffineTransform(scaleX: 4.0, y: 4.0)
      }, completion: { boolean in
        self.start()
      })
    })
  }
}

