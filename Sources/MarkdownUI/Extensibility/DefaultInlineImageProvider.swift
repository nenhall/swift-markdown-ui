import NetworkImage
import SwiftUI

/// The default inline image provider, which loads images from the network.
public struct DefaultInlineImageProvider: InlineImageProvider {
  public func image(with url: URL, label: String) async throws -> Image {
    try await Image(
      DefaultNetworkImageLoader.shared.image(from: url),
      scale: 1,
      label: Text(label)
    )
  }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8, *)
extension InlineImageProvider where Self == DefaultInlineImageProvider {
  /// The default inline image provider, which loads images from the network.
  ///
  /// Use the `markdownInlineImageProvider(_:)` modifier to configure
  /// this image provider for a view hierarchy.
  public static var `default`: Self {
    .init()
  }
}
