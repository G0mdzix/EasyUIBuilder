import Foundation
import UIKit
import SnapKit

public class LoaderViewController: UIViewController {

  // MARK: - Private Typealiases

  private typealias builder = LoaderUIFactory

  // MARK: - Subviews

  private let indicatorView = builder.indicatorViewBuild()
  private let backgroundView = builder.backgroundUIView(size: Constants.BackgroundView.size)

  // MARK: - Lifecycle

  public init() {
    super.init(nibName: nil, bundle: nil)
    modalPresentationStyle = .overCurrentContext
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
    view.backgroundColor = Constants.BackgroundColor.dismissBackgroundColor
  }
}

// MARK: - Animations

extension LoaderViewController {
  private func initalAnimation() {
    UIView.animate(withDuration: Constants.Animations.duration) {
      self.view.backgroundColor = Constants.BackgroundColor.initialBackgroundColor
    }
  }
}

// MARK: - Layouts

extension LoaderViewController {
  private func layout() {
    addViews()
    indicatorViewLayout()
    backgroundUIViewLayout()
  }

  private func addViews() {
    view.addSubview(backgroundView)
    view.addSubview(indicatorView)
  }

  private func indicatorViewLayout() {
    indicatorView.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }
  }

  private func backgroundUIViewLayout() {
    backgroundView.snp.makeConstraints { make in
      make.center.equalTo(indicatorView)
      make.size.equalTo(Constants.BackgroundView.size)
    }
  }
}

// MARK: - Constants

private enum Constants {
  enum BackgroundColor {
    static let initialBackgroundColor = EasyUIAssets.Colors.nightDark.color.withAlphaComponent(0.3)
    static let dismissBackgroundColor = EasyUIAssets.Colors.transparent.color
  }

  enum BackgroundView {
    static let size: CGFloat = 60
  }

  enum Animations {
    static let duration = 0.5
  }
}
