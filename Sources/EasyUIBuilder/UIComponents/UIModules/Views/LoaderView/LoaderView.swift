import Foundation
import UIKit
import SnapKit

public class LoaderView: UIViewController {

  // MARK: - Private Typealiases

  private typealias builder = LoaderUIFactory

  // MARK: - Subviews

  private let indicatorView = builder.indicatorViewBuild()
  private let backgroundView = builder.backgroundUIView(size: Constants.backgroundView.size)

  // MARK: - Lifecycle

  public init() {
    super.init(nibName: nil, bundle: nil)
    modalPresentationStyle = .custom
  }
  
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

// MARK: - Animations

extension LoaderView {
  private func initalAnimation() {
    UIView.animate(withDuration: Constants.animations.duration) {
      self.view.backgroundColor = Constants.backgroundColor.initialBackgroundColor
    }
  }
}

// MARK: - Layouts

extension LoaderView {
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
      make.size.equalTo(Constants.backgroundView.size)
    }
  }
}

// MARK: - Constants

private enum Constants {
  enum backgroundColor {
    static let initialBackgroundColor = EasyUIAssets.Colors.nightDark.color.withAlphaComponent(0.3)
    static let dismissBackgroundColor = EasyUIAssets.Colors.transparent.color
  }

  enum backgroundView {
    static let size: CGFloat = 60
  }

  enum animations {
    static let duration = 0.5
  }
}
