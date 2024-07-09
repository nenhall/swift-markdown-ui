import SwiftUI

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8, *)
struct ListBullet: View {
  private let image: Image

  var body: some View {
    TextStyleAttributesReader { attributes in
      let fontSize = attributes.fontProperties?.scaledSize ?? FontProperties.defaultSize
      self.image.font(.system(size: round(fontSize / 3)))
    }
  }

  static var disc: Self {
    .init(image: .init(systemName: "circle.fill"))
  }

  static var circle: Self {
    .init(image: .init(systemName: "circle"))
  }

  static var square: Self {
    .init(image: .init(systemName: "square.fill"))
  }
}
