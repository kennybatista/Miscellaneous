import UIKit

open class coolUILabel : UILabel{
  //MARK: - Lifecycle
  public init(frame: CGRect, text : String){
    super.init(frame: frame)
    self.text = text
    self.textColor = .black
    self.font = UIFont.systemFont(ofSize: 64, weight: UIFontWeightMedium)
    self.minimumScaleFactor = 0.5
    self.textAlignment = .left
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

