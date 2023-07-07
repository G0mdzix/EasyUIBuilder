import Foundation
import UIKit

// MARK: - Configurator

enum LayerConfigurator {
  static func configurUIElementsBasicLayer(element: UIElement, model: LayerModel) {
    element.layer.borderColor = model.color.cgColor
    element.layer.borderWidth = model.borderWidth
    chooseCornerRadiusType(element: element, cornerType: model.cornerType)
  }

  static func configureUIElementShadow(element: UIElement, model: LayerModel) {
    guard let shadow = model.shadowLayer else { return }
    element.layer.masksToBounds = false
    element.layer.shadowColor = shadow.shadowColor.cgColor
    element.layer.shadowOpacity = shadow.shadowOpacity
    element.layer.shadowOffset = shadow.shadowOffset
    element.layer.shadowRadius = shadow.shadowRadius
    chooseCornerRadiusType(element: element, cornerType: model.cornerType)
  }
}

// MARK: - private functions

extension LayerConfigurator {
  private static func chooseCornerRadiusType(element: UIElement, cornerType: LayerCornerType) {
    switch cornerType {
    case .none:
      element.layer.cornerRadius = cornerType.cornerRadius(
        for: element.intrinsicContentSize.width
      )
    case .circle:
      element.layer.cornerRadius = cornerType.cornerRadius(
        for: element.intrinsicContentSize.width
      )
    case .oval:
      element.layer.cornerRadius = cornerType.cornerRadius(
        for: element.intrinsicContentSize.height
      )
    }
  }
}
