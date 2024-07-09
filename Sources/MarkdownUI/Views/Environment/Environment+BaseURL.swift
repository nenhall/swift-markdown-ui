import SwiftUI

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8, *)
extension EnvironmentValues {
  var baseURL: URL? {
    get { self[BaseURLKey.self] }
    set { self[BaseURLKey.self] = newValue }
  }

  var imageBaseURL: URL? {
    get { self[ImageBaseURLKey.self] }
    set { self[ImageBaseURLKey.self] = newValue }
  }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8, *)
private struct BaseURLKey: EnvironmentKey {
  static var defaultValue: URL? = nil
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8, *)
private struct ImageBaseURLKey: EnvironmentKey {
  static var defaultValue: URL? = nil
}
