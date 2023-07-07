import Foundation

public enum LayerCornerType {
  case none
  case circle
  case oval

  func cornerRadius(for lenght: CGFloat) -> CGFloat {
    switch self {
    case .none:
      return 0
    case .circle:
      return lenght / Constants.half
    case .oval:
      return lenght / Constants.half
    }
  }
}

// MARK: - Constants

private enum Constants {
  static let half: CGFloat = 2
}
