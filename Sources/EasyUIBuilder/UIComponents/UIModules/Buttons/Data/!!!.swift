import Foundation
import UIKit

// MARK: - Constants

public enum DummyModel {
  public static let dummyLayerModel = LayerModel(
    color: .red,
    cornerRadius: 16,
    shadowColor: .red,
    shadowOpacity: 3,
    shadowOffset: .init(width: 4, height: 4),
    shadowRadius: 16,
    borderWidth: 5,
    cornerType: .none
  )

  public static let dummyButtonModel = ButtonModel(
    color: AppColorMode.currentMode().mainColor,
    font: .boldSystemFont(ofSize: 16),
    image: UIImage(named: "TAK")!,
    layer: dummyLayerModel
  )
}
