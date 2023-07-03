import Foundation
import UIKit

enum ButtonsBuilder {
  static func makeHollowButton(
    target: Any?,
    action: Selector,
    model: ButtonModel = DummyModel.dummyButtonModel
  ) -> UIButton {
    let button = UIButton(type: .system)
    button.addTarget(target, action: action, for: .touchUpInside)
    button.setImage(model.image, for: .normal)
    validateButtonSettings(button: button, model: model)
    LayerConfigurator.configurUIElementsBasicLayer(element: button, model: model)
    return button
  }

  static func makeBasicButton(
    target: Any?,
    action: Selector,
    model: ButtonModel = DummyModel.dummyButtonModel
  ) -> UIButton {
    let button = UIButton(type: .system)
    button.addTarget(target, action: action, for: .touchUpInside)
    button.backgroundColor = model.color
    validateButtonSettings(button: button, model: model)
    LayerConfigurator.configureUIElementShadow(element: button, model: model)
    return button
  }

  static func makeBasicCircleButton(
    target: Any?,
    action: Selector,
    model: ButtonModel = DummyModel.dummyButtonModel
  ) -> UIButton {
    let button = UIButton(type: .system)
    button.addTarget(target, action: action, for: .touchUpInside)
    button.backgroundColor = model.color
    validateButtonSettings(button: button, model: model)
    LayerConfigurator.configureUIElementShadow(element: button, model: model)
    return button
  }

  static func makeHollowCircleButton(
    target: Any?,
    action: Selector,
    model: ButtonModel = DummyModel.dummyButtonModel
  ) -> UIButton {
    let button = UIButton(type: .system)
    button.addTarget(target, action: action, for: .touchUpInside)
    validateButtonSettings(button: button, model: model)
    LayerConfigurator.configurUIElementsBasicLayer(element: button, model: model)
    return button
  }
}

// MARK: - private functions 

private extension ButtonsBuilder {
  private static func validateButtonSettings(button: UIButton, model: ButtonModel) {
    validateButtonFont(button: button, model: model)
    validateButtonImage(button: button, model: model)
  }

  private static func validateButtonFont(button: UIButton, model: ButtonModel) {
    guard model.font != nil else { return }
    button.setTitleColor(.white, for: .normal) // ?
    button.titleLabel?.font = model.font
  }

  private static func validateButtonImage(button: UIButton, model: ButtonModel) {
    guard model.image != nil else { return }
    button.setImage(model.image, for: .normal)
  }
}
