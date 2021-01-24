//
//  ThemeChooserView.swift
//  Memorize
//
//  Created by Zubair Ahmed on 22/01/2021.
//

import SwiftUI

struct ThemeChooserView: View {
    @Environment(\.presentationMode) var presentation //added to fix intermittent behavior of Navigation Bar Buttons
    @ObservedObject var themeStore: ThemeStore = ThemeStore()
    @State var editMode: EditMode = .inactive
    var body: some View {
        NavigationView {
            List {
                ForEach(themeStore.themes){
                    theme in
                    NavigationLink(destination: EmojiMemoryGameView(viewModel: EmojiMemoryGame(theme: theme)))
                    {
                        ThemeView(editMode: $editMode, theme: theme).environmentObject(themeStore)
                    }
                }
                .onDelete { (indexSet) in
                    indexSet.forEach { (index) in
                        themeStore.themes.remove(at: index)
                    }
                }
            }
            .navigationBarTitle("Memorize")
            .navigationBarItems(leading: Button("Add a theme", action: {
                themeStore.addTheme()
            }), trailing: EditButton())
            .environment(\.editMode, $editMode)
        }
    }
}
