import Foundation

public enum LayerCornerType {
  case none
  case circle

  func cornerRadius(forWidth width: CGFloat) -> CGFloat {
    switch self {
    case .none:
      return 0
    case .circle:
      return width / 2
    }
  }
}
