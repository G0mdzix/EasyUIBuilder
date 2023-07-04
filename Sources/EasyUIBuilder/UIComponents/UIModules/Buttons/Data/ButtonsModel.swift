import Foundation
import UIKit

public struct ButtonModel {
  public let color: UIColor
  public let font: UIFont?
  public let image: UIImage?
  public let layer: LayerModel?

  public init(
    color: UIColor,
    font: UIFont? = nil,
    image: UIImage? = nil,
    layer: LayerModel? = nil
  ) {
    self.color = color
    self.font = font
    self.image = image
    self.layer = layer
  }
}
