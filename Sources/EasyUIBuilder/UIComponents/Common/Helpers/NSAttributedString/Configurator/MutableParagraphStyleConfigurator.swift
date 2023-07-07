import Foundation
import UIKit

// MARK: - Factory

public enum MutableParagraphStyleConfigurator {
  public static func configure(
    model: MutableParagraphStyleModel
  ) -> NSMutableParagraphStyle {
    let style = NSMutableParagraphStyle()
    style.lineSpacing = model.lineSpacing
    style.firstLineHeadIndent = model.firstLineHeadIndent
    style.baseWritingDirection = model.baseWritingDirection
    return style
  }
}
