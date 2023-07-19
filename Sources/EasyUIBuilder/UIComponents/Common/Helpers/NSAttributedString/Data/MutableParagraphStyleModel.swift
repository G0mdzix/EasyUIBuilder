import Foundation
import UIKit

// MARK: - Model

public struct MutableParagraphStyleModel {
  public let lineSpacing: CGFloat
  public let firstLineHeadIndent: CGFloat
  public let nsTextAlignment: NSTextAlignment
  public let baseWritingDirection: NSWritingDirection?

  public init(
    lineSpacing: CGFloat,
    firstLineHeadIndent: CGFloat,
    nsTextAlignment: NSTextAlignment,
    baseWritingDirection: NSWritingDirection? = nil
  ) {
    self.lineSpacing = lineSpacing
    self.firstLineHeadIndent = firstLineHeadIndent
    self.nsTextAlignment = nsTextAlignment
    self.baseWritingDirection = baseWritingDirection
  }
}
