import Foundation
import UIKit

protocol UIElement {
  var layer: CALayer { get }
  var intrinsicContentSize: CGSize { get }
}

extension UIButton: UIElement {}
extension UIView: UIElement {}
extension UILabel: UIElement {}
extension UITableView: UIElement {} 
