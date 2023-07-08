import Foundation
import UIKit

// MARK: - Model

public struct MutableParagraphStyleModel {
  public let lineSpacing: CGFloat
  public let firstLineHeadIndent: CGFloat
  public let baseWritingDirection: NSWritingDirection

  public init(
    lineSpacing: CGFloat,
    firstLineHeadIndent: CGFloat,
    baseWritingDirection: NSWritingDirection
  ) {
    self.lineSpacing = lineSpacing
    self.firstLineHeadIndent = firstLineHeadIndent
    self.baseWritingDirection = baseWritingDirection
  }
}
