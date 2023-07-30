import UIKit

class OnboardingViewController: UIViewController {

  // MARK: - Private Typealiases

  private typealias builder = OnboardingUIFactory

  // MARK: - Properties

  var nextButtonDidTap: (() -> Void)?
  var getStartedButtonDidTap: (() -> Void)?

  // MARK: - Private Properties

  private var model: OnboardingModel

  // MARK: - Subviews

  private lazy var transitionView = TransitionView(model: model)
  private lazy var buttonsStackView = builder.makeButtonUIStackView(
    buttons: [nextButton, getStartedButton]
  )
  private lazy var stackView = builder.makeStackView(views: [transitionView, buttonsStackView])
  private let nextButton = EasyUIBuilder.Buttons.build(
    target: self,
    action: #selector(nextButtonTapped),
    type: .hollow,
    model: builder.nextButtonModel
  )
  private let getStartedButton = EasyUIBuilder.Buttons.build(
    target: self,
    action: #selector(getStartedButtonTapped),
    type: .basic,
    model: builder.getStartedButtonModel
  )

  // MARK: - Lifecycle

  init(model: OnboardingModel) {
    self.model = model
    super.init(nibName: nil, bundle: nil)
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = AppColorMode.currentMode().mainColor
    layout()
    setupGesture()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    transitionView.startTimer()
  }
}

// MARK: - Functions

extension OnboardingViewController {
  func stopAnimation() {
    transitionView.stopTimer()
  }
}

// MARK: - Private functions

extension OnboardingViewController {
  @objc
  private func nextButtonTapped() {
    nextButtonDidTap?()
    transitionView.handleTap(direction: .right)
  }

  @objc
  private func getStartedButtonTapped() {
    getStartedButtonDidTap?()
  }
}

// MARK: - Layout

extension OnboardingViewController {
  private func layout() {
    addViews()
    stackViewLayout()
    buttonsStackViewLayout()
    nextButtonLayout()
  }

  private func addViews() {
    view.addSubview(stackView)
  }

  private func stackViewLayout() {
    stackView.snp.makeConstraints { make in
      make.right.equalToSuperview()
      make.left.equalToSuperview()
      make.top.equalToSuperview()
      make.bottom.equalToSuperview().offset(Constants.StackView.bottomOffset)
    }
  }

  private func buttonsStackViewLayout() {
    buttonsStackView.layoutMargins = Constants.ButtonsStackView.layoutMargins
    buttonsStackView.isLayoutMarginsRelativeArrangement = true
    buttonsStackView.heightAnchor.constraint(
      equalToConstant: Constants.ButtonsStackView.height
    ).isActive = true
  }

  private func nextButtonLayout() {
    nextButton.snp.makeConstraints { make in
      make.width.equalTo(getStartedButton.snp.width).multipliedBy(Constants.half)
    }
  }
}

// MARK: - TapGesture

extension OnboardingViewController {
  private func setupGesture() {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewDidTap(_:)))
    transitionView.addGestureRecognizer(tapGesture)
  }
  
  @objc
  private func viewDidTap(_ tap: UITapGestureRecognizer) {
    let point = tap.location(in: view)
    let midPoint = transitionView.frame.size.width * Constants.half
    if point.x > midPoint {
      transitionView.handleTap(direction: .right)
    } else {
      transitionView.handleTap(direction: .left)
    }
  }
}

// MARK: - Constants

private enum Constants {
  static let half = 0.5

  enum ButtonsStackView {
    static let layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    static let height: CGFloat = 60
  }

  enum StackView {
    static let bottomOffset: CGFloat = -50
  }
}
