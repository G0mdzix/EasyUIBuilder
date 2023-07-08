import Foundation
import UIKit

// MARK: - Factory

public enum LabelBuilder {
  public static func build(model: LabelModel) -> UILabel {
    let label = UILabel()
    label.text = model.text
    label.font = model.font
    labelSettings(label: label, model: model)
    guard let layer = model.layer else { return label }
    LayerConfigurator.configurUIElementsBasicLayer(element: label, model: layer)
    return label
  }
}

// MARK: - private functions

private extension LabelBuilder {
  private static func labelSettings(label: UILabel, model: LabelModel) {
    validateLabelLineBreakMode(label: label, model: model)
    validateLabelNumberOfLines(label: label, model: model)
    validateLabelTextAlignment(label: label, model: model)
    validateLabelAttributedText(label: label, model: model)
    validateLabelTextColor(label: label, model: model)
  }

  private static func validateLabelLineBreakMode(label: UILabel, model: LabelModel) {
    guard let lineBreakMode = model.lineBreakMode else { return }
    label.lineBreakMode = lineBreakMode
  }

  private static func validateLabelNumberOfLines(label: UILabel, model: LabelModel) {
    guard let numberOfLines = model.numberOfLines else { return }
    label.numberOfLines = numberOfLines
  }

  private static func validateLabelTextAlignment(label: UILabel, model: LabelModel) {
    guard let textAlignment = model.textAlignment else { return }
    label.textAlignment = textAlignment
  }

  private static func validateLabelAttributedText(label: UILabel, model: LabelModel) {
    guard let attributedText = model.attributedText else { return }
    label.attributedText = NSAttributedString(
      string: model.text,
      attributes: [NSAttributedString.Key.paragraphStyle: attributedText]
    ) 
  }

  private static func validateLabelTextColor(label: UILabel, model: LabelModel) {
    guard let textColor = model.textColor else { return }
    label.textColor = textColor
  }
}
