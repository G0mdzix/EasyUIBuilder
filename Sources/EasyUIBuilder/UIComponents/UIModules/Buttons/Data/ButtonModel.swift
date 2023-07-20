import Foundation
import UIKit

// MARK: - Model

public struct ButtonModel {
  public let color: UIColor
  public let buttonTextModel: ButtonTextModel?
  public let image: UIImage?
  public let layer: LayerModel?

  public init(
    color: UIColor,
    buttonTextModel: ButtonTextModel? = nil,
    image: UIImage? = nil,
    layer: LayerModel? = nil
  ) {
    self.color = color
    self.buttonTextModel = buttonTextModel
    self.image = image
    self.layer = layer
  }
}
