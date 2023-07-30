import Foundation
import UIKit

enum TransitionViewUIFactory {
  static func makeImageView() -> UIImageView {
    let view = UIImageView()
    view.contentMode = .scaleAspectFill
    view.clipsToBounds = true
    return view
  }

  static func makeBarViews(model: OnboardingModel) -> [AnimatedBarView] {
    var views: [AnimatedBarView] = []
    model.slides.forEach { _ in
      views.append(AnimatedBarView(tintColor: model.tintColor))
    }
    return views
  }

  static func makeBarStackView(barViews: [AnimatedBarView]) -> UIStackView {
    let stackView = UIStackView()
    barViews.forEach { barView in
      stackView.addArrangedSubview(barView)
    }
    stackView.axis = .horizontal
    stackView.spacing = Constants.barStackViewSpacing
    stackView.distribution = .fillEqually
    return stackView
  }

  static func makeStackView(UIViews: [UIView]) -> UIStackView {
    let stackView = UIStackView(arrangedSubviews: UIViews)
    stackView.distribution = .fill
    stackView.axis = .vertical
    return stackView
  }
}

// MARK: - Models

extension TransitionViewUIFactory {
  static let titleLabelModel = LabelModel(
    textColor: AppColorMode.currentMode().secondaryColor,
    font: .boldSystemFont(ofSize: Constants.TitleLabel.fontSize),
    textAlignment: .center,
    numberOfLines: Constants.TitleLabel.numberOfLines
  )
}

// MARK: - Constants

private enum Constants {
  static let barStackViewSpacing: CGFloat = 5

  enum TitleLabel {
    static let fontSize: CGFloat = 28
    static let numberOfLines: Int = 2
  }
}
