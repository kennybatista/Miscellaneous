import UIKit

public class AppleIconView: UIView {
  //MARK: - Properties
  var leafPath: UIBezierPath!
  var applePath: UIBezierPath!
  
  
  //MARK: - Lifecycle
  override public func draw(_ rect: CGRect) {
    leafPath = createLeafPath(height: rect.height, width: rect.width)
    applePath = createApplePath(height: rect.height, width: rect.width)
    UIColor.white.setStroke()
    leafPath.stroke()
    applePath.stroke()
  }
  
  
  //MARK: - Helpers
  public func addMask(){
    let combinePath = UIBezierPath()
    let newLeaf = createLeafPath(height: self.frame.height, width: self.frame.width)
    let newApple = createApplePath(height: self.frame.height, width: self.frame.width)
    combinePath.append(newLeaf)
    combinePath.append(newApple)
    
    let shapeLayerMask = CAShapeLayer()
    shapeLayerMask.path = combinePath.cgPath
    shapeLayerMask.backgroundColor = #colorLiteral(red: 0.8803832531, green: 0.2371731997, blue: 0.2013332248, alpha: 1).cgColor
    self.layer.mask = shapeLayerMask
  }
  
  func createLeafPath(height h: CGFloat, width w : CGFloat) -> UIBezierPath {
    
    let leafPathClipper = UIBezierPath()
    
    leafPathClipper.move(to: CGPoint(x: 0.4886569873 * w, y: 0.263382467 * h))
    leafPathClipper.addCurve(to: CGPoint(x: 0.5140653358 * w , y: 0.1501163693 * h), controlPoint1: CGPoint(x: 0.4886569873 * w, y: 0.263382467 * h), controlPoint2: CGPoint(x: 0.4795825771 * w, y: 0.1958882855 * h))
    leafPathClipper.addCurve(to: CGPoint(x: 0.5921052632 * w, y: 0.07719162141 * h), controlPoint1: CGPoint(x: 0.5485480944 * w, y: 0.1043444531 * h), controlPoint2: CGPoint(x: 0.5921052632 * w, y: 0.07719162141 * h))
    leafPathClipper.addLine(to: CGPoint(x: 0.6265880218 * w, y: 0.05857253685 * h))
    leafPathClipper.addLine(to: CGPoint(x: 0.6665154265 * w, y: 0.04615981381 * h))
    leafPathClipper.addLine(to: CGPoint(x: 0.7019056261 * w, y: 0.04072924748 * h))
    leafPathClipper.addLine(to: CGPoint(x: 0.7109800363 * w, y: 0.04072924748 * h))
    leafPathClipper.addCurve(to: CGPoint(x: 0.6710526316 * w, y: 0.1757176106 * h), controlPoint1: CGPoint(x: 0.7109800363 * w, y: 0.04072924748 * h), controlPoint2: CGPoint(x: 0.7155172414 * w, y: 0.1299456943 * h))
    leafPathClipper.addCurve(to: CGPoint(x: 0.6147912886 * w, y: 0.2261442979 * h), controlPoint1: CGPoint(x: 0.6265880218 * w, y: 0.2214895268 * h), controlPoint2: CGPoint(x: 0.6147912886 * w, y: 0.2261442979 * h))
    leafPathClipper.addLine(to: CGPoint(x: 0.5721415608 * w, y: 0.2478665632 * h))
    leafPathClipper.addLine(to: CGPoint(x: 0.5440108893 * w, y: 0.2556245151 * h))
    leafPathClipper.addCurve(to: CGPoint(x: 0.4995462795 * w, y: 0.263382467 * h), controlPoint1: CGPoint(x: 0.5440108893 * w, y: 0.2556245151 * h), controlPoint2: CGPoint(x: 0.5104355717 * w, y: 0.263382467 * h))
    leafPathClipper.addCurve(to: CGPoint(x: 0.4886569873 * w, y: 0.263382467 * h), controlPoint1: CGPoint(x: 0.4886569873 * w, y: 0.263382467 * h), controlPoint2: CGPoint(x: 0.4886569873 * w, y: 0.263382467 * h))
    leafPathClipper.close()
    leafPathClipper.lineWidth = 0
    
    return leafPathClipper
  }
  
  func createApplePath(height h: CGFloat, width w : CGFloat) -> UIBezierPath {
    
    let applePathCplipper = UIBezierPath()
    
    //W = 1102
    //H = 1289
    
    applePathCplipper.move(to: CGPoint(x: 0.5131578947 * w, y: 0.9173778123 * h))
    
    applePathCplipper.addCurve(to: CGPoint(x: 0.416061706 * w, y: 0.936772692 * h), controlPoint1: CGPoint(x: 0.5131578947 * w, y: 0.9173778123 * h), controlPoint2: CGPoint(x: 0.4460072595 * w, y: 0.9228083786 * h))
    applePathCplipper.addCurve(to: CGPoint(x: 0.3461887477 * w, y: 0.9553917766 * h), controlPoint1: CGPoint(x: 0.3861161525 * w, y: 0.9507370054 * h), controlPoint2: CGPoint(x: 0.3461887477 * w, y: 0.9553917766 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.3144283122 * w, y: 0.9553917766 * h))
    applePathCplipper.addCurve(to: CGPoint(x: 0.2118874773 * w, y: 0.9034134988 * h), controlPoint1: CGPoint(x: 0.3144283122 * w, y: 0.9553917766 * h), controlPoint2: CGPoint(x: 0.248185118 * w, y: 0.9437548487 * h))
    applePathCplipper.addCurve(to: CGPoint(x: 0.1774047187 * w, y: 0.8692785105 * h), controlPoint1: CGPoint(x: 0.1755898367 * w, y: 0.863072149 * h), controlPoint2: CGPoint(x: 0.1774047187 * w, y: 0.8692785105 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.139292196 * w, y: 0.8250581846 * h))
    applePathCplipper.addCurve(to: CGPoint(x: 0.07123411978 * w, y: 0.7102404965 * h), controlPoint1: CGPoint(x: 0.139292196 * w, y: 0.8250581846 * h), controlPoint2: CGPoint(x: 0.07486388385 * w, y: 0.7288595811 * h))
    applePathCplipper.addCurve(to: CGPoint(x: 0.06397459165 * w, y: 0.6900698216 * h), controlPoint1: CGPoint(x: 0.06760435572 * w, y: 0.6916214119 * h), controlPoint2: CGPoint(x: 0.06941923775 * w, y: 0.7063615206 * h))
    applePathCplipper.addCurve(to: CGPoint(x: 0.05490018149 * w, y: 0.6652443755 * h), controlPoint1: CGPoint(x: 0.05852994555 * w, y: 0.6737781226 * h), controlPoint2: CGPoint(x: 0.05490018149 * w, y: 0.6652443755 * h))
    
    applePathCplipper.addLine(to: CGPoint(x: 0.04582577132  * w, y: 0.6357641583 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.04038112523  * w, y: 0.6070597362 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.03584392015  * w, y: 0.577579519 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.0331215971   * w, y: 0.5465477114 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.0331215971   * w, y: 0.5147401086 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.0331215971   * w, y: 0.4953452289 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.03584392015  * w, y: 0.4751745539 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.04310344828  * w, y: 0.4487975175 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.05036297641  * w, y: 0.4247478666 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.06397459165  * w, y: 0.3921644686 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.08393829401  * w, y: 0.3588052754 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.1075317604   * w, y: 0.3316524438 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.136569873    * w, y: 0.3060512025 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.1619782214   * w, y: 0.2897595035 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.1864791289   * w, y: 0.2765709853 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.2082577132   * w, y: 0.2680372382 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.2345735027   * w, y: 0.2602792863 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.2563520871   * w, y: 0.2556245151 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.2772232305   * w, y: 0.2525213344 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.2980943739   * w, y: 0.2501939488 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.3089836661   * w, y: 0.2501939488 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.3416515426   * w, y: 0.2501939488 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.3584392015  * w, y: 0.2501939488 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.3725045372   * w, y: 0.2525213344 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.3915607985   * w, y: 0.2556245151 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.4042649728   * w, y: 0.2602792863 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.4287658802   * w, y: 0.2680372382 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.4541742287   * w, y: 0.2765709853 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.4777676951   * w, y: 0.2851047324 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.4904718693   * w, y: 0.2874321179 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.5031760436   * w, y: 0.2897595035 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.5131578947   * w, y: 0.2897595035 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.5349364791   * w, y: 0.2851047324 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.5612522686   * w, y: 0.2765709853 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.5884754991   * w, y: 0.2680372382 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.6184210526   * w, y: 0.2602792863 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.6519963702   * w, y: 0.2525213344 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.6801270417   * w, y: 0.2501939488 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.7173321234   * w, y: 0.2501939488 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.7391107078   * w, y: 0.2501939488 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.7572595281   * w, y: 0.2525213344 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.7754083485   * w, y: 0.2556245151 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.8026315789   * w, y: 0.263382467 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.8244101633   * w, y: 0.2703646237 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.8434664247   * w, y: 0.2765709853 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.8670598911   * w, y: 0.2897595035 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.8824863884   * w, y: 0.2990690458 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.8979128857   * w, y: 0.3107059736 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.914246824    * w, y: 0.3238944919 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.9269509982   * w, y: 0.3363072149 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.9305807623   * w, y: 0.340961986 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.917876588    * w, y: 0.3479441427 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.9024500907   * w, y: 0.3588052754 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.8861161525   * w, y: 0.3719937936 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.863430127    * w, y: 0.3921644686 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.8407441016   * w, y: 0.4177657099 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.8280399274   * w, y: 0.43871218 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.8162431942   * w, y: 0.467416602 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.8089836661   * w, y: 0.5023273856 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.8089836661   * w, y: 0.5349107836 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.8117059891   * w, y: 0.5558572537 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.8189655172   * w, y: 0.577579519 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.8280399274   * w, y: 0.5993017843 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.8407441016   * w, y: 0.6210240497 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.8534482759   * w, y: 0.6357641583 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.8752268603   * w, y: 0.6574864236 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.9024500907   * w, y: 0.6784328937 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.9269509982   * w, y: 0.6923972071 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.9460072595   * w, y: 0.7017067494 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.9587114338   * w, y: 0.7079131109 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.9514519056   * w, y: 0.7257564003 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.9387477314   * w, y: 0.7521334368 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.9269509982   * w, y: 0.7754072925 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.9115245009   * w, y: 0.7986811482 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.8824863884   * w, y: 0.8390224981 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.8579854809   * w, y: 0.8669511249 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.8343920145   * w, y: 0.8894491854 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.8117059891   * w, y: 0.9096198604 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.7899274047   * w, y: 0.9251357642 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.7726860254   * w, y: 0.936772692 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.7572595281   * w, y: 0.9437548487 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.7391107078   * w, y: 0.9507370054 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.7173321234   * w, y: 0.9553917766 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.691923775    * w, y: 0.9553917766 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.6683303085   * w, y: 0.953064391 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.6421778584   * w, y: 0.9461830877 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.5944736842   * w, y: 0.9309309542 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.5766969147   * w, y: 0.9263227308 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.5584754991   * w, y: 0.9218153607 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.5478493648   * w, y: 0.9203568658 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.5402540835   * w, y: 0.9186035687 * h))
    applePathCplipper.addLine(to: CGPoint(x: 0.5131578947   * w, y: 0.9173778123 * h))
    applePathCplipper.close()
    applePathCplipper.lineWidth = 0
    
    return applePathCplipper
  }
}


