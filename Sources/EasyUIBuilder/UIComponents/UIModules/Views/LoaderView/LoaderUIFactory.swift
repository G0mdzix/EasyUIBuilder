import Foundation
import UIKit

enum LoaderUIFactory {
  static func indicatorViewBuild() -> UIActivityIndicatorView {
    let indicator = UIActivityIndicatorView(style: .large)
    indicator.isUserInteractionEnabled = false
    indicator.backgroundColor = EasyUIAssets.Colors.transparent.color
    indicator.color = EasyUIAssets.Colors.nightDark.color
    indicator.hidesWhenStopped = true
    indicator.startAnimating()
    return indicator
  }

  static func backgroundUIView(size: CGFloat) -> UIView {
    let view = UIView()
    view.backgroundColor = .white
    view.layer.cornerRadius = size / Constants.BackgroundUIView.divider
    return view
  }
}

// MARK: - Constants

private enum Constants {
  enum BackgroundUIView {
    static let divider: CGFloat = 2
  }
}
