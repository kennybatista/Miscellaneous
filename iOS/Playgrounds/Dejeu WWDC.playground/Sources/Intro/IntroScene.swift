import UIKit

open class IntroScene : UIView{
  //MARK: - Private Properties
  public var done = false
  
  
  //MARK: - Lifecycle
  public override init(frame: CGRect){
    super.init(frame: frame)
    self.backgroundColor = .white
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  //MARK: Public Helpers
  public func start(){
    let hello = coolUILabel(frame: CGRect(x: 132, y: 431, width: 100, height: 100), text: "hello")
    let world = coolUILabel(frame: CGRect(x: 100, y: 0, width: 100, height: 100), text: "world,")
    let groupOne : [coolUILabel] = [hello,world]
    
    let ifL = coolUILabel(frame: CGRect(x: 107.5, y: 431, width: 100, height: 100), text: "if")
    let everyone = coolUILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100), text: "everyone")
    let isL = coolUILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100), text: "is")
    let groupTwo : [coolUILabel] = [ifL,everyone,isL]
    
    let always = coolUILabel(frame: CGRect(x: 39.5, y: 431, width: 100, height: 100), text: "always")
    let looking = coolUILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100), text: "looking")
    let forL = coolUILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100), text: "for")
    let groupThree : [coolUILabel] = [always,looking,forL]
    
    let the = coolUILabel(frame: CGRect(x: 13.5, y: 431, width: 100, height: 100), text: "the")
    let newest = coolUILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100), text: "newest,")
    let fastest = coolUILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100), text: "fastest,")
    let groupFour : [coolUILabel] = [the,newest,fastest]
    
    let and = coolUILabel(frame: CGRect(x: 108.5, y: 431, width: 100, height: 100), text: "and")
    let greatest = coolUILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100), text: "greatest")
    let groupFive : [coolUILabel] = [and,greatest]
    
    let innovations = coolUILabel(frame: CGRect(x: 134, y: 431, width: 100, height: 100), text: "innovations")
    let groupSix : [coolUILabel] = [innovations]
    
    let we = coolUILabel(frame: CGRect(x: 23, y: 431, width: 100, height: 100), text: "we")
    let never = coolUILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100), text: "never")
    let reflect = coolUILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100), text: "reflect")
    let on = coolUILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100), text: "on")
    let groupSeven : [coolUILabel] = [we,never,reflect,on]
    
    let our = coolUILabel(frame: CGRect(x: 137.5, y: 431, width: 100, height: 100), text: "our")
    let current = coolUILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100), text: "current")
    let groupEight : [coolUILabel] = [our,current]
    
    let achievements = coolUILabel(frame: CGRect(x: 90, y: 431, width: 100, height: 100), text: "achievements.")
    let groupNine : [coolUILabel] = [achievements]
    
    let apple = coolUILabel(frame: CGRect(x: 139, y: 431, width: 100, height: 100), text: "Apple")
    let isL2 = coolUILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100), text: "is")
    let no = coolUILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100), text: "no")
    let groupTen : [coolUILabel] = [apple,isL2,no]
    
    let exception = coolUILabel(frame: CGRect(x: 149, y: 431, width: 100, height: 100), text: "exception.")
    let groupEleven : [coolUILabel] = [exception]
    
    let so = coolUILabel(frame: CGRect(x: 28, y: 431, width: 100, height: 100), text: "So")
    let lets = coolUILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100), text: "let's")
    let take = coolUILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100), text: "take")
    let a = coolUILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100), text: "a")
    let look = coolUILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100), text: "look")
    let groupTwelve : [coolUILabel] = [so,lets,take,a,look]
    
    let at = coolUILabel(frame: CGRect(x: 94.5, y: 431, width: 100, height: 100), text: "at")
    let apple1 = coolUILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100), text: "Apple")
    let since = coolUILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100), text: "since")
    let groupThirteen : [coolUILabel] = [at,apple1,since]
    
    let wwdc = coolUILabel(frame: CGRect(x: 116, y: 431, width: 100, height: 100), text: "WWDC")
    let num2016 = coolUILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100), text: "2016")
    let groupFourteen : [coolUILabel] = [wwdc,num2016]
    
    self.animateGroup(group: groupOne, closure: {
      self.animateGroup(group: groupTwo, closure: {
        self.animateGroup(group: groupThree, closure: {
          self.animateGroup(group: groupFour, closure: {
            self.animateGroup(group: groupFive, closure: {
              self.animateGroup(group: groupSix, closure: {
                self.animateGroup(group: groupSeven, closure: {
                  self.animateGroup(group: groupEight, closure: {
                    self.animateGroup(group: groupNine, closure: {
                      self.animateGroup(group: groupTen, closure: {
                        self.animateGroup(group: groupEleven, closure: {
                          self.animateGroup(group: groupTwelve, closure: {
                            self.animateGroup(group: groupThirteen, closure: {
                              self.animateGroup(group: groupFourteen, closure: {
                                self.done = true
                              })
                            })
                          })
                        })
                      })
                    })
                  })
                })
              })
            })
          })
        })
      })
    })
  }
  
  
  //MARK: - Helpers
  func animateGroup(group : [coolUILabel], closure : @escaping ()->()?){
    var delayBuildup = 0.0
    
    for i in 0..<group.count{
      if group.count == 1 {
        group[0].alpha = 0
        self.addSubview(group[0])
        group[0].sizeToFit()
        var str = group[i].text!
        UIView.animate(withDuration: 0.7, animations: {
          group[0].textColor = .black
          group[0].alpha = 1
        }, completion : { boolean in
          UIView.animate(withDuration: 0.5, delay : 0.5, animations: {
            group[0].alpha = 0
          }, completion : { boolean in
            closure()
          })
        })
        return 
      }
      group[i].alpha = 0
      self.addSubview(group[i])
      if i == 0{
        group[i].sizeToFit()
        var str = group[i].text!
        UIView.animate(withDuration: Double(str.characters.count) * 0.1, animations: {
          group[i].textColor = .black
          group[i].alpha = 1
        })
      }
      else{
        if i == group.count - 1 {
          group[i].alpha = 0
          group[i].sizeToFit()
          group[i].frame = CGRect(x: group[i-1].frame.maxX + 20, y: group[i-1].frame.minY, width: group[i].frame.width, height: group[i].frame.height)
          self.addSubview(group[i])
          var str = group[i].text!
          var prvStr = group[i-1].text!
          let delay : Double = max(0.35,(Double(prvStr.characters.count) * 0.15))
          delayBuildup += delay
          UIView.animate(withDuration: Double(str.characters.count) * 0.1, delay: delayBuildup, animations: {
            group[i].textColor = .black
            group[i].alpha = 1
          }, completion : { boolean in
            for a in 0..<group.count{
              if a == group.count - 1{
                UIView.animate(withDuration: 0.5, animations: {
                  group[a].alpha = 0
                }, completion : { boolean in
                  closure()
                })
              }
              else{
                UIView.animate(withDuration: 0.5, animations: {
                  group[a].alpha = 0
                })
              }
              
            }
          })
        }
        else{
          group[i].alpha = 0
          group[i].sizeToFit()
          group[i].frame = CGRect(x: group[i-1].frame.maxX + 20, y: group[i-1].frame.minY, width: group[i].frame.width, height: group[i].frame.height)
          self.addSubview(group[i])
          var str = group[i].text!
          var prvStr = group[i-1].text!
          let delay : Double = max(0.35,(Double(prvStr.characters.count) * 0.15))
          delayBuildup += delay
          UIView.animate(withDuration: Double(str.characters.count) * 0.1, delay: delayBuildup, animations: {
            group[i].textColor = .black
            group[i].alpha = 1
          })
        }
      }
    }
  }
}
