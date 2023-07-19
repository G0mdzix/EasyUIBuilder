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
    style.alignment = model.nsTextAlignment
    validateBaseWritingDirection(style: style, model: model)
    return style
  }
}

// MARK: - private functions

private extension MutableParagraphStyleConfigurator {
  private static func validateBaseWritingDirection(
    style: NSMutableParagraphStyle,
    model: MutableParagraphStyleModel
  ) {
    guard let baseWritingDirection = model.baseWritingDirection else { return }
    style.baseWritingDirection = baseWritingDirection
  }
}
