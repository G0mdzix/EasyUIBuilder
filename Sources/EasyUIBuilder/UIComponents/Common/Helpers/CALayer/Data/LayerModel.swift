import Foundation
import UIKit

// MARK: - Model

public struct LayerModel {
  public let color: UIColor
  public let borderWidth: CGFloat
  public let shadowLayer: LayerShadowModel?
  public let cornerType: LayerCornerType

  public init(
    color: UIColor,
    borderWidth: CGFloat,
    shadowLayer: LayerShadowModel? = DefaultUIModelSettings.shadowLayer,
    cornerType: LayerCornerType
  ) {
    self.color = color
    self.borderWidth = borderWidth
    self.shadowLayer = shadowLayer
    self.cornerType = cornerType
  }
}
