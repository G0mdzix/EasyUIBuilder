import Foundation
import UIKit
import Combine

class AnimatedBarView: UIView {

  // MARK: - Private Typealiases

  private typealias builder = AnimatedBarViewUIFactory

  // MARK: - Subviews

  private var animator: UIViewPropertyAnimator?
  private let backgroundBarView = builder.makeBackgroundBarView()
  private let foregroundBarView = UIView()

  // MARK: - Private Properties

  @Published private var state: AnimatedBarState = .clear
  private var cancelables = Set<AnyCancellable>()

  // MARK: - Lifecycle

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public init(tintColor: UIColor) {
    super.init(frame: .zero)
    configurator(tintColor: tintColor)
    layout()
  }
}

// MARK: - Functions

extension AnimatedBarView {
  func setState(_ barState: AnimatedBarState) {
    switch barState {
    case .animating:
      state = .animating
    case .clear:
      state = .clear
    case .filled:
      state = .filled
    }
  }
}


// MARK: - Private functions

extension AnimatedBarView {
  private func configurator(tintColor: UIColor) {
    configureViewsColor(tintColor: tintColor)
    setupAnimator()
    observeState()
  }

  private func configureViewsColor(tintColor: UIColor) {
    foregroundBarView.backgroundColor = tintColor
    backgroundBarView.backgroundColor = tintColor.withAlphaComponent(Constants.backgroundBarAlpha)
  }

  private func setupAnimator() {
    animator = UIViewPropertyAnimator(
      duration: Constants.animatorDuration,
      curve: .easeInOut,
      animations: { [weak self] in
        guard let self = self else { return }
        self.foregroundBarView.transform = .identity
      }
    )
  }

  private func observeState() {
    $state.sink { [weak self] state in
      guard let self = self else { return }
      switch state {
      case .clear:
        self.onStateClear()
      case .animating:
        onStateAnimating()
      case .filled:
        onStateFilled()
      }
    }.store(in: &cancelables)
  }

  private func onStateClear() {
    setupAnimator()
    foregroundBarView.alpha = Constants.ForegroundBar.alphaOnClear
  }

  private func onStateAnimating() {
    guard let animator = animator else { return }
    foregroundBarView.transform = .init(scaleX: 0, y: 1)
    foregroundBarView.transform = .init(translationX: -frame.size.width, y: 0)
    foregroundBarView.alpha = Constants.ForegroundBar.alphaOnAnimating
    animator.startAnimation()
  }

  private func onStateFilled() {
    guard let animator = animator else { return }
    animator.stopAnimation(true)
    foregroundBarView.transform = .identity
  }
}

// MARK: - Layouts

extension AnimatedBarView {
  private func layout() {
    addViews()
    backgroundBarViewLayout()
    foregroundBarViewLayout()
  }

  private func addViews() {
    addSubview(backgroundBarView)
    backgroundBarView.addSubview(foregroundBarView)
  }

  private func backgroundBarViewLayout() {
    backgroundBarView.snp.makeConstraints { make in
      make.edges.equalTo(self)
    }
  }

  private func foregroundBarViewLayout() {
    foregroundBarView.snp.makeConstraints { make in
      make.edges.equalTo(backgroundBarView)
    }
  }
}

// MARK: - Constants

private enum Constants {
  enum ForegroundBar {
    static let alphaOnAnimating: CGFloat = 1.0
    static let alphaOnClear: CGFloat = 0.0
  }

  static let backgroundBarAlpha: CGFloat = 0.2
  static let animatorDuration: CGFloat = 3.0
}
