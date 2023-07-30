import UIKit

// MARK: - Model

public struct OnboardingSlideModel {
  public let image: UIImage
  public let title: String
  
  public init(image: UIImage, title: String) {
    self.image = image
    self.title = title
  }
}
