import Foundation
import UIKit

enum LayerConfigurator {
  static func configurUIElementsBasicLayer(element: UIElement, model: ButtonModel) {
    guard let layer = model.layer else { return }
    element.layer.borderColor = model.color.cgColor
    element.layer.borderWidth = layer.borderWidth
    element.layer.cornerRadius = layer.cornerType.cornerRadius(
      forWidth: element.intrinsicContentSize.width
    )
  }

  static func configureUIElementShadow(element: UIElement, model: ButtonModel) {
    guard let layer = model.layer else { return }
    element.layer.masksToBounds = false
    element.layer.shadowColor = layer.shadowColor.cgColor
    element.layer.shadowOpacity = layer.shadowOpacity
    element.layer.shadowOffset = layer.shadowOffset
    element.layer.shadowRadius = layer.shadowRadius
    element.layer.cornerRadius = layer.cornerType.cornerRadius(
      forWidth: element.intrinsicContentSize.width
    )
  }
}

// MARK: - Constants

private enum Constants {
  static let circleCornerRadius: CGFloat = 2
}
