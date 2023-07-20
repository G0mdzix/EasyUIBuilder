import Foundation
import UIKit

// MARK: - Factory

public enum ButtonBuilder {
  public static func build(
    target: Any,
    action: Selector,
    type: ButtonsType,
    model: ButtonModel = DefaultUIModelSettings.button
  ) -> UIButton {
    let button = UIButton(type: .system)
    button.addTarget(target, action: action, for: .touchUpInside)
    buttonSettings(button: button, model: model)
    validateButtonType(type: type, button: button, model: model)
    return button
  }
}

// MARK: - private functions 

private extension ButtonBuilder {
  private static func buttonSettings(button: UIButton, model: ButtonModel) {
    validateButtonFont(button: button, model: model)
    validateButtonImage(button: button, model: model)
  }

  private static func validateButtonType(type: ButtonsType, button: UIButton, model: ButtonModel) {
    switch type {
    case .basic:
      button.backgroundColor = model.color
      guard let layer = model.layer else { return }
      LayerConfigurator.configureUIElementShadow(element: button, model: layer)
    case .hollow:
      guard let layer = model.layer else { return }
      LayerConfigurator.configurUIElementsBasicLayer(element: button, model: layer)
    }
  }

  private static func validateButtonFont(button: UIButton, model: ButtonModel) {
    guard model.buttonTextModel != nil else { return }
    button.setTitleColor(model.buttonTextModel?.fontColor, for: .normal)
    button.titleLabel?.font = model.buttonTextModel?.font
    button.setTitle(model.buttonTextModel?.text, for: .normal)
  }

  private static func validateButtonImage(button: UIButton, model: ButtonModel) {
    guard model.image != nil else { return }
    button.setImage(model.image, for: .normal)
  }
}
