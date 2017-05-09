import Foundation
import UIKit
import PlaygroundSupport


public func setupIphoneView(_ color1: UIColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), _ color2: UIColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), size: CGSize = CGSize(width: 500, height: 500)) -> UIView {
    let container = UIView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
    
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = container.frame
    
    gradientLayer.colors = [color1.cgColor, color2.cgColor]
    gradientLayer.locations = [0.0, 1.0]
    
    container.layer.addSublayer(gradientLayer)
    
    return container
}
