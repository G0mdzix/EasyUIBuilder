import Foundation
import UIKit

enum OnboardingUIFactory {
  static func makeButtonUIStackView(buttons: [UIButton]) -> UIStackView {
    let stackView = UIStackView(arrangedSubviews: buttons)
    stackView.axis = .horizontal
    stackView.spacing = Constants.StackView.spacing
    return stackView
  }

  static func makeStackView(views: [UIView]) -> UIStackView {
    let view = UIStackView(arrangedSubviews: views)
    view.axis = .vertical
    return view
  }
}

// MARK: - Models

extension OnboardingUIFactory {
  static let nextButtonModel = ButtonModel(
    color: AppColorMode.currentMode().mainColor,
    buttonTextModel: ButtonTextModel(
      text: Constants.NextButton.text,
      font: .boldSystemFont(ofSize: Constants.NextButton.fontSize),
      fontColor: AppColorMode.currentMode().secondaryColor
    ),
    layer: LayerModel(
      color: AppColorMode.currentMode().secondaryColor,
      borderWidth: Constants.NextButton.borderWidth,
      cornerType: .oval
    )
  )

  static let getStartedButtonModel = ButtonModel(
    color: AppColorMode.currentMode().secondaryColor,
    buttonTextModel: ButtonTextModel(
      text: Constants.GetStartedButton.text,
      font: .boldSystemFont(ofSize: Constants.GetStartedButton.fontSize),
      fontColor: AppColorMode.currentMode().mainColor
    ),
    layer: LayerModel(
      color: AppColorMode.currentMode().secondaryColor,
      borderWidth: Constants.GetStartedButton.borderWidth,
      shadowLayer: LayerShadowModel(
        shadowColor: AppColorMode.currentMode().secondaryColor,
        shadowOpacity: Constants.GetStartedButton.shadowOpacity,
        shadowOffset: Constants.GetStartedButton.shadowOffset,
        shadowRadius: Constants.GetStartedButton.shadowRadius
      ),
      cornerType: .oval
    )
  )
}

// MARK: - Constants

private enum Constants {
  enum StackView {
    static let spacing: CGFloat = 24
  }

  enum NextButton {
    static let text = "Next"
    static let fontSize: CGFloat = 16
    static let borderWidth: CGFloat = 2
  }

  enum GetStartedButton {
    static let text = "Get started"
    static let fontSize: CGFloat = 16
    static let borderWidth: CGFloat = 2
    static let shadowOpacity: Float = 0.5
    static let shadowOffset: CGSize = .init(width: 4, height: 4)
    static let shadowRadius: CGFloat = 8
  }
}
