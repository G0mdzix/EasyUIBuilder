import Foundation
import UIKit

public enum ButtonsAssembly {
  public static func build(
    target: Any,
    action: Selector,
    type: ButtonsType,
    model: ButtonModel = DummyModel.dummyButtonModel
  ) -> UIButton {
    switch type {
    case .basic:
      return getBasicButtonDependOnModel(target: target, action: action, model: model)
    case .hollow:
      return ButtonsBuilder.makeHollowButton(target: target, action: action, model: model)
    }
  }
}

private extension ButtonsAssembly {
  private static func getBasicButtonDependOnModel(
    target: Any,
    action: Selector,
    model: ButtonModel = DummyModel.dummyButtonModel
  ) -> UIButton {
    guard let cornerType = model.layer?.cornerType else {
      return ButtonsBuilder.makeBasicButton(target: target, action: action, model: model)
    }
    switch cornerType {
    case .none:
      return ButtonsBuilder.makeBasicButton(target: target, action: action, model: model)
    case .circle:
      return ButtonsBuilder.makeBasicCircleButton(target: target, action: action, model: model)
    }
  }

  private static func getHollowButtonDependOnModel(
    target: Any,
    action: Selector,
    model: ButtonModel = DummyModel.dummyButtonModel
  ) -> UIButton {
    guard let cornerType = model.layer?.cornerType else {
      return ButtonsBuilder.makeHollowButton(target: target, action: action, model: model)
    }
    switch cornerType {
    case .none:
      return ButtonsBuilder.makeHollowButton(target: target, action: action, model: model)
    case .circle:
      return ButtonsBuilder.makeHollowCircleButton(target: target, action: action, model: model)
    }
  }
}
