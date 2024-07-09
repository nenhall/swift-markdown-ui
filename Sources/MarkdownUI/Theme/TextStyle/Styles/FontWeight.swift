import SwiftUI

/// A text style that adjusts the font weight.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8, *)
public struct FontWeight: TextStyle {
  private let weight: Font.Weight

  /// Creates a font weight text style.
  /// - Parameter weight: The font weight.
  public init(_ weight: Font.Weight) {
    self.weight = weight
  }

  public func _collectAttributes(in attributes: inout AttributeContainer) {
    attributes.fontProperties?.weight = self.weight
  }
}
