import Foundation
import UIKit

// MARK: - Model

public struct ButtonModel {
  public let color: UIColor
  public let font: UIFont?
  public let fontColor: UIColor?
  public let image: UIImage?
  public let layer: LayerModel?

  public init(
    color: UIColor,
    font: UIFont? = nil,
    fontColor: UIColor? = nil,
    image: UIImage? = nil,
    layer: LayerModel? = DefaultUIModelSettings.layer
  ) {
    self.color = color
    self.font = font
    self.image = image
    self.fontColor = fontColor
    self.layer = layer
  }
}
