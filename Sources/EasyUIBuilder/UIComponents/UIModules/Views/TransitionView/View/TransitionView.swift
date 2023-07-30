import Foundation
import UIKit

class TransitionView: UIView {

  // MARK: - Private Typealiases

  private typealias builder = TransitionViewUIFactory

  // MARK: - Subviews

  private lazy var barViews = builder.makeBarViews(model: model)
  private lazy var stackView = builder.makeStackView(UIViews: [imageView, titleLabel])
  private lazy var barStackView = builder.makeBarStackView(barViews: barViews)
  private let imageView = builder.makeImageView()
  private let titleLabel = EasyUIBuilder.Labels.build(model: builder.titleLabelModel)

  // MARK: - Private Properties

  private var timer: DispatchSourceTimer?
  private var index: Int = -1
  private var transitionModel: TransitionViewModel?
  private let model: OnboardingModel

  // MARK: - Lifecycle

  init(model: OnboardingModel) {
    self.model = model
    super.init(frame: .zero)
    layout()
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Functions

extension TransitionView {
  func startTimer() {
    buildTimerIfNeeded()
    timer?.resume()
  }

  func stopTimer() {
    timer?.cancel()
    timer = nil
  }

  func handleTap(direction: OnboardingDirection) {
    switch direction {
    case .left:
      leftSideTapped()
    case .right:
      rightSideTapped()
    }
    stopTimer()
    startTimer()
  }
}

// MARK: - Animations

extension TransitionView {
  private func animateImageView() {
    UIView.transition(
      with: imageView,
      duration: Constants.ImageView.animationDuration,
      options: .transitionCrossDissolve
    ) {
      guard let model = self.transitionModel else { return }
      self.imageView.image = model.nextImage
    }
  }
}


// MARK: - Private functions

extension TransitionView {
  private func buildTimerIfNeeded() {
    guard timer == nil else { return }
    timer = DispatchSource.makeTimerSource()
    timer?.schedule(
      deadline: .now(),
      repeating: .seconds(Constants.Timer.repeating),
      leeway: .seconds(Constants.Timer.leeway)
    )
    timer?.setEventHandler { [weak self] in
      guard let self = self else { return }
      Task {
        self.showNext()
      }
    }
  }

  private func rightSideTapped() {
    barViews[index].setState(.filled)
  }

  private func leftSideTapped() {
    barViews[index].setState(.clear)
    if barViews.indices.contains(index - 1) {
      barViews[index - 1].setState(.clear)
    }
    index -= 2
  }

  private func showNext() {
    handleNextSlideIfNeeded()
    animateImageView()
    guard let model = transitionModel else { return }
    titleLabel.text = model.nextTitle
    model.nextBarView.setState(.animating)
  }

  private func handleNextSlideIfNeeded() {
    model.slides.indices.contains(index + 1) ? setNextSlide() : setSlidesToFirst()
  }

  private func setNextSlide() {
    transitionModel = TransitionViewModel(
      nextImage: model.slides[index + 1].image,
      nextTitle: model.slides[index + 1].title,
      nextBarView: barViews[index + 1]
    )
    index += 1
  }

  private func setSlidesToFirst() {
    barViews.forEach({ $0.setState(.clear) })
    guard let firstSlide = model.slides.first else { return }
    transitionModel = TransitionViewModel(
      nextImage: firstSlide.image,
      nextTitle: firstSlide.title,
      nextBarView: barViews[0]
    )
    index = 0
  }
}

// MARK: - Layouts

extension TransitionView {
  private func layout() {
    addViews()
    stackViewLayout()
    barStackViewLayout()
    imageViewLayout()
  }

  private func addViews() {
    addSubview(stackView)
    addSubview(barStackView)
  }

  private func stackViewLayout() {
    stackView.snp.makeConstraints { make in
      make.edges.equalTo(self)
    }
  }

  private func barStackViewLayout() {
    barStackView.snp.makeConstraints { make in
      make.leading.equalTo(snp.leading).offset(Constants.BarStackView.verticalOffset)
      make.trailing.equalTo(snp.trailing).offset(-Constants.BarStackView.verticalOffset)
      make.top.equalTo(snp.topMargin)
      make.height.equalTo(Constants.BarStackView.height)
    }
  }

  private func imageViewLayout() {
    imageView.snp.makeConstraints { make in
      make.height.equalTo(stackView.snp.height).multipliedBy(Constants.ImageView.multiplier)
    }
  }
}

// MARK: - Constants

private enum Constants {
  enum BarStackView {
    static let verticalOffset: CGFloat = 24
    static let height: CGFloat = 4
  }

  enum ImageView {
    static let multiplier: CGFloat = 0.8
    static let animationDuration: TimeInterval = 0.5
  }

  enum Timer {
    static let repeating = 3
    static let leeway = 1
  }
}
