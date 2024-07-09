//
//  UITest.swift
//  MarkdownKit
//
//  Created by dadi on 2024/7/8.
//

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
    var body: some View {
        MarkdownUI(body: markdown)
    }
}

#Preview {
    UITest()
}
