import Foundation
import UIKit

enum AnimatedBarViewUIFactory {
  static func makeBackgroundBarView() -> UIView {
    let view = UIView()
    view.clipsToBounds = true
    return view
  }
}
