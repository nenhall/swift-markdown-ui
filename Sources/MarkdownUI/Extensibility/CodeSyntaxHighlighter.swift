import SwiftUI

/// A type that provides syntax highlighting to code blocks in a Markdown view.
///
/// To configure the current code syntax highlighter for a view hierarchy, use the
/// `markdownCodeSyntaxHighlighter(_:)` modifier.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8, *)
public protocol CodeSyntaxHighlighter {
  /// Returns a text view configured with the syntax highlighted code.
  /// - Parameters:
  ///   - code: The code block.
  ///   - language: The language of the code block.
  func highlightCode(_ code: String, language: String?) -> Text
}

/// A code syntax highlighter that returns unstyled code blocks.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8, *)
public struct PlainTextCodeSyntaxHighlighter: CodeSyntaxHighlighter {
  /// Creates a plain text code syntax highlighter.
  public init() {}

  public func highlightCode(_ code: String, language: String?) -> Text {
    Text(code)
  }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8, *)
extension CodeSyntaxHighlighter where Self == PlainTextCodeSyntaxHighlighter {
  /// A code syntax highlighter that returns unstyled code blocks.
  public static var plainText: Self {
    PlainTextCodeSyntaxHighlighter()
  }
}
