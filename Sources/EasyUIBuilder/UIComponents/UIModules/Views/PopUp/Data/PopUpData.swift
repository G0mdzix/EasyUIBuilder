import Foundation

// MARK: - Model

public struct PopUpModel {
  public let title: String
  public let description: String
  public let icon: PopUpIconType

  public init(title: String, description: String, icon: PopUpIconType) {
    self.title = title
    self.description = description
    self.icon = icon
  }
}
