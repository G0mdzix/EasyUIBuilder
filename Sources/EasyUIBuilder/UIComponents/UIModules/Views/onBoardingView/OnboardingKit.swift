
import UIKit

public class OnboardingKit {

  // MARK: - Properties

  public weak var delegate: OnboardingKitProtocol?

  // MARK: - Private Properties

  private var model: OnboardingModel
  private var rootVC: UIViewController?

  // MARK: - Subviews

  private lazy var onboardingViewController: OnboardingViewController = {
    let controller = OnboardingViewController(model: model)
    controller.modalTransitionStyle = .crossDissolve
    controller.modalPresentationStyle = .fullScreen
    controller.nextButtonDidTap = { [weak self] in
      guard let self = self else { return }
      self.delegate?.nextButtonDidTap()
    }
    controller.getStartedButtonDidTap = { [weak self] in
      guard let self = self else { return }
      self.delegate?.getStartedButtonDidTap()
    }
    return controller
  }()

  // MARK: - Lifecycle

  public init(model: OnboardingModel) {
    self.model = model
  }
}
  // MARK: - Functions

extension OnboardingKit {
  public func launchOnboarding(rootVC: UIViewController) {
    self.rootVC = rootVC
    rootVC.present(onboardingViewController, animated: true, completion: nil)
  }
  
  public func dismissOnboarding() {
    onboardingViewController.stopAnimation()
    if rootVC?.presentedViewController == onboardingViewController {
      onboardingViewController.dismiss(animated: true)
    }
  }
}
