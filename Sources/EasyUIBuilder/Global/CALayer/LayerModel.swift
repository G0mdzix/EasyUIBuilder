import Foundation
import UIKit

public struct LayerModel {
  public let color: UIColor
  public let cornerRadius: CGFloat // is it needed? 
  public let shadowColor: UIColor
  public let shadowOpacity: Float
  public let shadowOffset: CGSize
  public let shadowRadius: CGFloat
  public let borderWidth: CGFloat
  public let cornerType: LayerCornerType

  public init(
    color: UIColor,
    cornerRadius: CGFloat,
    shadowColor: UIColor,
    shadowOpacity: Float,
    shadowOffset: CGSize,
    shadowRadius: CGFloat,
    borderWidth: CGFloat,
    cornerType: LayerCornerType
  ) {
    self.color = color
    self.cornerRadius = cornerRadius
    self.shadowColor = shadowColor
    self.shadowOpacity = shadowOpacity
    self.shadowOffset = shadowOffset
    self.shadowRadius = shadowRadius
    self.borderWidth = borderWidth
    self.cornerType = cornerType
  }
}
