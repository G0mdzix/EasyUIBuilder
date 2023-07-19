import Foundation
import UIKit

// MARK: - Model

public struct ButtonTextModel {
  public let text: String
  public let font: UIFont
  public let fontColor: UIColor

  public init(text: String, font: UIFont, fontColor: UIColor) {
    self.text = text
    self.font = font
    self.fontColor = fontColor
  }
}
