//
//  ThemeView.swift
//  Memorize
//
//  Created by Zubair Ahmed on 23/01/2021.
//
import SwiftUI

struct ThemeView: View {
    @Binding var editMode: EditMode
    @State var showThemeEditor: Bool = false
    let theme: Theme
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                if editMode.isEditing {
                    Image(systemName: "pencil")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20, alignment: .center)
                        .onTapGesture {
                            showThemeEditor = true
                        }
                        .sheet(isPresented: $showThemeEditor) {
                            ThemeEditorView(showThemeEditor: $showThemeEditor, theme: theme)
                        }
                }
                VStack(spacing: 10) {
                    HStack {
                        Text("\(theme.name): \(theme.numberOfPairs*2) cards")
                            .foregroundColor(Color(theme.color))
                            .font(.title2)
                        Spacer()
                    }
                    HStack {
                        Text(theme.emojis.joined()).lineLimit(1)
                        Spacer()
                    }
                }
            }
        }
    }
}
