import Foundation
import UIKit

// MARK: - Model

public struct OnboardingModel {
  public let slides: [OnboardingSlideModel]
  public let tintColor: UIColor

  public init(slides: [OnboardingSlideModel], tintColor: UIColor) {
    self.slides = slides
    self.tintColor = tintColor
  }
}
