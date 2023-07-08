import Foundation
import UIKit

// MARK: - Model

public struct LayerShadowModel {
  public let shadowColor: UIColor
  public let shadowOpacity: Float
  public let shadowOffset: CGSize
  public let shadowRadius: CGFloat

  public init(
    shadowColor: UIColor,
    shadowOpacity: Float,
    shadowOffset: CGSize,
    shadowRadius: CGFloat
  ) {
    self.shadowColor = shadowColor
    self.shadowOpacity = shadowOpacity
    self.shadowOffset = shadowOffset
    self.shadowRadius = shadowRadius
  }
}
