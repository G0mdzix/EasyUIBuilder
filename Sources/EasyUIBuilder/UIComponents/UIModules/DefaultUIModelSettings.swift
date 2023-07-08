import Foundation
import UIKit

// MARK: - DefaultUI

public enum DefaultUIModelSettings {
  public static let shadowLayer = LayerShadowModel(
    shadowColor: Constants.shadowLayer.shadowColor,
    shadowOpacity: Constants.shadowLayer.shadowOpacity,
    shadowOffset: Constants.shadowLayer.shadowOffset,
    shadowRadius: Constants.shadowLayer.shadowRadius
  )

  public static let layer = LayerModel(
    color: Constants.layer.color,
    borderWidth: Constants.layer.borderWidth,
    shadowLayer: shadowLayer,
    cornerType: Constants.layer.cornerType
  )

  public static let button = ButtonModel(
    color: Constants.button.color,
    font: Constants.button.font,
    image: Constants.button.image,
    layer: layer
  )
}

// MARK: - Constants

private enum Constants {
  enum shadowLayer {
    static let shadowColor: UIColor = .black
    static let shadowOpacity: Float = 0.5
    static let shadowOffset = CGSize(width: 0, height: 0)
    static let shadowRadius: CGFloat = 5
  }

  enum layer {
    static let color: UIColor = .red
    static let borderWidth: CGFloat = 1
    static let cornerType: LayerCornerType = .none
  }

  enum button {
    static let color: UIColor = AppColorMode.currentMode().mainColor
    static let font: UIFont? = .boldSystemFont(ofSize: 16)
    static let image: UIImage? = EasyUIAssets.Images.defaultIcon.image
  }
}
