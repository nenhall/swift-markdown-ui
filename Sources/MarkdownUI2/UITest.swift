//
//  UITest.swift
//  MarkdownKit
//
//  Created by dadi on 2024/7/8.
//

import MarkdownUI
import SwiftUI

let markdown =
    """
    ``` swift
    var body: some View {
        // Markdown(ChatItem.markdownCode)
        Text(content)
            .multilineTextAlignment(.leading)
            .translatesAutoresizingMaskIntoConstraintstranslatesAutoresizingMaskIntoConstraints(.byWordWrapping)
            .padding(5)
            .background(Color.gray01)
            .cornerRadius(4.0)
             }
    ```
    """

struct UITest: View {
    @State var content: String

    var body: some View {
        contentView()
    }

    func contentView() -> some View {
        if #available(iOS 15, macOS 12, *) {
            return Markdown(self.content)
        } else {
            return MarkdownUI2(body: content)
                .background(Color.gray.opacity(0.2))
        }
    }
}

#Preview {
    UITest(content: markdown)
}
