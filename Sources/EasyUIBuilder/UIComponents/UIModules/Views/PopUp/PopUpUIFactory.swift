import Foundation
import UIKit
import Lottie

// MARK: - Functions

enum PopUpUIFactory {
  static func makeHorizontalStackView() -> UIStackView {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.alignment = .center
    return stackView
  }

  static func makeBackgroundUIView() -> UIView {
    let view = UIView()
    view.backgroundColor = AppColorMode.currentMode().mainColor
    view.layer.cornerRadius = Constants.Functions.backgroundViewCornerRadius
    return view
  }

  static func makeAnimationIcon(_ animationString: String) -> LottieAnimationView {
    let animationIcon = LottieAnimationView(name: animationString)
    animationIcon.contentMode = .scaleAspectFit
    animationIcon.loopMode = .loop
    animationIcon.animationSpeed = Constants.Functions.animationIconSpeed
    return animationIcon
  }

  static func makeImageIcon(image: UIImage) -> UIImageView {
    let imageIcon = UIImageView(image: image)
    imageIcon.contentMode = .scaleAspectFit
    return imageIcon
  }
}

// MARK: - Models

extension PopUpUIFactory {
  static let titleLabelModel = LabelModel(
    font: .boldSystemFont(ofSize: AppFontSize.large),
    textAlignment: .center,
    numberOfLines: 0
  )

  static let descriptionLabelModel = LabelModel(
    font: .boldSystemFont(ofSize: AppFontSize.medium),
    textAlignment: .center,
    numberOfLines: 0
  )

  static let attributedTextDescriptionLabel = MutableParagraphStyleConfigurator.configure(
    model: MutableParagraphStyleModel(
      lineSpacing: Constants.Models.attributedTextLineSpacing,
      firstLineHeadIndent: 0,
      nsTextAlignment: .center
  ))

  static let dissmisButtonModel = ButtonModel(
    color: AppColorMode.currentMode().secondaryColor,
    buttonTextModel: ButtonTextModel(
      text: Constants.Models.dissmisButtonText,
      font: .boldSystemFont(ofSize: AppFontSize.medium),
      fontColor: AppColorMode.currentMode().mainColor
    ),
    layer: LayerModel(
      color: .white,
      borderWidth: Constants.Models.dissmisButonLayerBorderWidth,
      cornerType: .oval
    )
  )
}

// MARK: - Constants

private enum Constants {
  enum Functions {
    static let backgroundViewCornerRadius: CGFloat = 10
    static let animationIconSpeed = 1.5
  }

  enum Models {
    static let attributedTextLineSpacing: CGFloat = 1.5
    static let dissmisButonLayerBorderWidth: CGFloat = 10
    static let dissmisButtonText: String = "OK"
  }
}
