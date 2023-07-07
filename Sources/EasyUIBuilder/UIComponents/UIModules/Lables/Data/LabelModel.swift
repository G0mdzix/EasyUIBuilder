import Foundation
import UIKit

// MARK: - Model

public struct LabelModel {
  public let text: String
  public let textColor: UIColor?
  public let font: UIFont
  public let attributedText: NSMutableParagraphStyle?
  public let textAlignment: NSTextAlignment?
  public let numberOfLines: Int?
  public let lineBreakMode: NSLineBreakMode?
  public let layer: LayerModel?

  public init(
    text: String,
    textColor: UIColor? = nil,
    font: UIFont,
    textAlignment: NSTextAlignment? = nil,
    attributedText: NSMutableParagraphStyle? = nil,
    numberOfLines: Int? = nil,
    lineBreakMode: NSLineBreakMode? = nil,
    layer: LayerModel? = DefaultUIModelSettings.layer
  ) {
    self.text = text
    self.textColor = textColor
    self.font = font
    self.textAlignment = textAlignment
    self.attributedText = attributedText
    self.numberOfLines = numberOfLines
    self.lineBreakMode = lineBreakMode
    self.layer = layer
  }
}

