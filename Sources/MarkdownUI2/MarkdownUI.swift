import SwiftUI

#if os(macOS)
public typealias UIViewRepresentable = NSViewRepresentable
public typealias UIViewRepresentableContext = NSViewRepresentableContext
#endif

//@available(iOS, deprecated: 15.0, message: "Use MarkdownUI.Markdown(...) on iOS 15.0 and later")
//@available(macOS, deprecated: 12.0, message: "Use MarkdownUI.Markdown(...) on macOS 12.0 and later")
public struct MarkdownUI2: UIViewRepresentable {
#if os(macOS)
    private let scrollView: NSScrollView = .init()
#endif
    private let markdownView: MarkdownView

    @Binding public var body: String

    public init(body: String? = nil, css: String? = nil, plugins: [String]? = nil, stylesheets: [URL]? = nil, styled: Bool = true) {
        self._body = .constant(body ?? "")
        markdownView = MarkdownView(css: css, plugins: plugins, stylesheets: stylesheets, styled: styled)
        markdownView.isScrollEnabled = true
//        markdownView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
#if os(macOS)
        scrollView.autoresizingMask = [.width, .height]
        scrollView.documentView = self.markdownView
        markdownView.autoresizingMask = [.width, .height]
#endif
    }
  
    public func onTouchLink(perform action: @escaping ((URLRequest) -> Bool)) -> MarkdownUI2 {
        markdownView.onTouchLink = action
        return self
    }
  
    public func onRendered(perform action: @escaping ((CGFloat) -> Void)) -> MarkdownUI2 {
        markdownView.onRendered = action
        return self
    }
}

public extension MarkdownUI2 {
#if os(macOS)
    func makeNSView(context: Context) -> NSScrollView {
        return scrollView
    }
  
    func updateNSView(_ uiView: NSScrollView, context: Context) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.markdownView.show(markdown: self.body)
        }
    }
#else
    func makeUIView(context: Context) -> MarkdownView {
        return markdownView
    }
  
    func updateUIView(_ uiView: MarkdownView, context: Context) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.markdownView.show(markdown: self.body)
        }
    }
#endif
  
    func makeCoordinator() {}
}
