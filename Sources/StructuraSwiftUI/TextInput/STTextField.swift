//
//  STTextField.swift
//  StructuraDesignSystemSwiftui
//
//  Created by wepie on 2026/4/1.
//

import SwiftUI
import Observation

struct STTextFieldStyle: TextFieldStyle {
    /// the limit of word count. If nil, the trailing limit text won't show
    let wordLimit: Int?
    @Binding var label: String
    @Binding var text: String
    let icon: Image?
    let showClearButtonWhenEditing: Bool
    @FocusState private var isFocused: Bool
    
    func _body(configuration: TextField<_Label>) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            if !label.isEmpty {
                HStack(spacing: 4) {
                    if let icon {
                        icon
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                    }
                    Text(label).stTypography12Semibold(isSingleLine: true)
                        .foregroundStyle(stColor: .textSecondary)
                }
            }
            HStack(spacing: 12) {
                configuration.focused($isFocused)
                    .stTypography14Regular(isSingleLine: true)
                    .foregroundStyle(stColor: .textPrimary)
                    .frame(maxWidth: .infinity)
                if let wordLimit {
                    Text("\(text.count)/\(wordLimit)")
                        .stTypography14Regular(isSingleLine: true)
                        .foregroundStyle(stColor: .textDefault)
                }
                if showClearButtonWhenEditing && isFocused && !text.isEmpty {
                    Button {
                        emptyText()
                    } label: {
                        Image(systemName: "xmark")
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                }
            }
            .padding(.init(top: 12, leading: 16, bottom: 12, trailing: 16))
            .background(stColor: .grayBg)
            .clipShape(.rect(cornerRadius: 8))
        }
    }
    
    private func emptyText() {
        text = ""
    }
}

extension TextField {
    /// 设置指定样式
    /// - Parameters:
    ///   - wordLimit: 字数最大限制，如果为nil则不展示末尾的限制文本
    ///   - label: 输入框上方的标题。默认为空，不会展示上方一栏
    ///   - text: 输入框的文本。默认为空
    ///   - icon: 输入框上方的icon，如果为nil则不展示
    ///   - showClearButtonWhenEditing: 是否在编辑过程中展示末尾的清除按钮
    func stTextFieldStyle(
        wordLimit: Int? = nil,
        label: Binding<String> = .constant(""),
        text: Binding<String> = .constant(""),
        icon: Image? = nil,
        showClearButtonWhenEditing: Bool = true) -> some View {
        textFieldStyle(
            STTextFieldStyle(
                wordLimit: wordLimit,
                label: label,
                text: text,
                icon: icon,
                showClearButtonWhenEditing: showClearButtonWhenEditing
            )
        )
    }
}

#Preview {
    @Previewable @State var text1: String = ""
    
    VStack {
        TextField("placeholder", text: $text1)
            .stTextFieldStyle(
                wordLimit: 10,
                label: .constant("Title1"),
                text: $text1
            )
    }
}
