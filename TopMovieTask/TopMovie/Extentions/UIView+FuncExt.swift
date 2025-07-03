//
//  Created by Hader
//
import Foundation
import UIKit

extension UIView {
    @IBInspectable
    var bottomCorner: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
    }
}

extension UIView {
    @IBInspectable
    var topCorner: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
    }
}





class CustomTopRoundedView: UIView{
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        var path = UIBezierPath()
        path = UIBezierPath(roundedRect: bounds,
                            byRoundingCorners: [.topLeft , .topRight],
                            cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        layer.mask = shapeLayer
    }
}





@IBDesignable
class GradientView: UIView {
    private let gradientLayer = CAGradientLayer()

    @IBInspectable var bottomColor: UIColor = .white {
        didSet {
            updateGradient()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        layer.insertSublayer(gradientLayer, at: 0)
        layer.cornerRadius = 8
        clipsToBounds = true
        updateGradient()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    private func updateGradient() {
        // White with slight alpha for transition area
        let transitionWhite = UIColor.white.withAlphaComponent(0.6)

        gradientLayer.colors = [
            UIColor.white.cgColor,          // 0.0 - solid white
            UIColor.white.cgColor,          // 0.25 - still solid white
            transitionWhite.cgColor,        // 0.5 - fading white
            bottomColor.cgColor             // 1.0 - target color
        ]

        gradientLayer.locations = [
            0.0,    // full white
            0.25,   // still white
            0.5,    // fading starts
            1.0     // final color
        ]
    }
}




extension UITableView {
    
    func registerCellNib<Cell: UITableViewCell>(cellClass: Cell.Type){
        self.register(UINib(nibName: String(describing: Cell.self), bundle: nil), forCellReuseIdentifier: String(describing: Cell.self))
    }
    
    func dequeue<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        let identifier = String(describing: T.self)
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Error in cell")
        }
        return cell
    }
}
