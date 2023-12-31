import Foundation
import UIKit

public enum AppColorMode {
  case light
  case dark

  var mainColor: UIColor {
    switch self {
    case .light:
      return UIColor.white
    case .dark:
      return UIColor.black
    }
  }

  var secondaryColor: UIColor {
    switch self {
    case .light:
      return UIColor.black
    case .dark:
      return UIColor.white
    }
  }

  public static func currentMode() -> AppColorMode {
    if UITraitCollection.current.userInterfaceStyle == .dark {
      return .dark
    } else {
      return .light
    }
  }
}
