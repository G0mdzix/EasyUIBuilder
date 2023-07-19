import Foundation
import SnapKit
import UIKit
import Lottie

public class PopUpViewController: UIViewController {

  // MARK: - Private Typealiases

  private typealias builder = PopUpUIFactory

  // MARK: - Subviews

  private let backgroundView = builder.makeBackgroundUIView()
  private let labelsStackView = builder.makeHorizontalStackView()
  private let iconStackView = builder.makeHorizontalStackView()
  private let titleLabel = EasyUIBuilder.Labels.build(model: builder.titleLabelModel)
  private let descriptionLabel = EasyUIBuilder.Labels.build(model: builder.descriptionLabelModel)
  private let dismissButton = EasyUIBuilder.Buttons.build(
    target: self,
    action: #selector(dismissPopUp),
    type: .basic,
    model: builder.dissmisButtonModel
  )

  // MARK: - Lifecycle

  public init(model: PopUpModel) {
    super.init(nibName: nil, bundle: nil)
    modalPresentationStyle = .overCurrentContext
    configure(model: model)
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override public func viewDidLoad() {
    super.viewDidLoad()
    layout()
  }

  override public func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    initalAnimation()
  }

  override public func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    view.backgroundColor = Constants.backgroundColor.dismissBackgroundColor
  }
}

// MARK: - Private functions

extension PopUpViewController {
  private func configure(model: PopUpModel) {
    titleLabel.text = model.title
    descriptionLabel.attributedText = NSAttributedString(
      string: model.description,
      attributes: [NSAttributedString.Key.paragraphStyle: builder.attributedTextDescriptionLabel]
    )
    handleIconType(icon: model.icon)
  }

  private func handleIconType(icon: PopUpIconType) {
    switch icon {
    case .animation(let animation):
      setupAnimationIcon(animation: animation)
    case .image(let image):
      setupImageIcon(image: image)
    }
  }

  private func setupImageIcon(image: UIImage) {
    let imageIcon = builder.makeImageIcon(image: image)
    iconStackView.addArrangedSubview(imageIcon)
  }

  @objc
  private func dismissPopUp() {
    dismiss(animated: true)
  }
}

// MARK: - Animations

extension PopUpViewController {
  private func initalAnimation() {
    UIView.animate(withDuration: Constants.animations.duration) {
      self.view.backgroundColor = Constants.backgroundColor.initialBackgroundColor
    }
  }

  private func setupAnimationIcon(animation: String) {
    let animationIcon = builder.makeAnimationIcon(animation)
    animationIcon.play()
    iconStackView.addArrangedSubview(animationIcon)
  }
}

// MARK: - Layouts

extension PopUpViewController {
  private func layout() {
    addViews()
    backgroundViewLayout()
    iconStackViewLayout()
    labelsStackViewLayout()
    labelsStackViewAddSpacings()
    dismissButtonLayout()
  }

  private func addViews() {
    view.addSubview(backgroundView)
    backgroundView.addSubview(iconStackView)
    backgroundView.addSubview(labelsStackView)
    backgroundView.addSubview(dismissButton)
    labelsStackView.addArrangedSubview(titleLabel)
    labelsStackView.addArrangedSubview(descriptionLabel)
  }

  private func labelsStackViewAddSpacings() {
    labelsStackView.setCustomSpacing(Constants.Constraints.defaultOffset, after: titleLabel)
  }

  private func backgroundViewLayout() {
    backgroundView.snp.makeConstraints { make in
      make.center.equalToSuperview()
      make.left.equalToSuperview().offset(Constants.Constraints.backgroundViewEdgesOffest)
      make.right.equalToSuperview().offset(-Constants.Constraints.backgroundViewEdgesOffest)
      make.height.greaterThanOrEqualTo(Constants.Constraints.backgroundViewHeight)
      make.height.lessThanOrEqualTo(
        UIScreen.main.bounds.height - Constants.Constraints.defaultOffset
      )
    }
  }

  private func labelsStackViewLayout() {
    labelsStackView.snp.makeConstraints { make in
      make.top.equalTo(iconStackView.snp.bottom).offset(
        Constants.Constraints.offsetBetweenStackViews
      )
      make.right.equalToSuperview().offset(-Constants.Constraints.defaultOffset)
      make.left.equalToSuperview().offset(Constants.Constraints.defaultOffset)
      make.bottom.equalTo(dismissButton.snp.top).offset(-Constants.Constraints.defaultOffset)
    }
  }

  private func iconStackViewLayout() {
    iconStackView.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(Constants.Constraints.offsetBetweenStackViews)
      make.height.equalTo(Constants.Constraints.iconStackViewHeight)
      make.right.equalToSuperview()
      make.left.equalToSuperview()
    }
  }

  private func dismissButtonLayout() {
    dismissButton.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.bottom.equalToSuperview().offset(-Constants.Constraints.defaultOffset)
      make.height.equalTo(Constants.Constraints.dismissButtonHeight)
      make.width.equalTo(labelsStackView)
    }
  }
}

// MARK: - Constants

private enum Constants {
  enum backgroundColor {
    static let initialBackgroundColor = EasyUIAssets.Colors.nightDark.color.withAlphaComponent(0.3)
    static let dismissBackgroundColor = EasyUIAssets.Colors.transparent.color
  }

  enum animations {
    static let duration = 0.5
  }

  enum AnimationIcon {
    static let animationSpeed = 1.5
  }

  enum Constraints {
    static let defaultOffset: CGFloat = 20
    static let dismissButtonHeight: CGFloat = 44
    static let iconStackViewHeight: CGFloat = 100
    static let offsetBetweenStackViews: CGFloat = 10
    static let backgroundViewHeight: CGFloat = 225
    static let backgroundViewEdgesOffest: CGFloat = 40
  }
}
