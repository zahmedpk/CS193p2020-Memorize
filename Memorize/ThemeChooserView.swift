//
//  ThemeChooserView.swift
//  Memorize
//
//  Created by Zubair Ahmed on 22/01/2021.
//

import SwiftUI

struct ThemeChooserView: View {
    @ObservedObject var themeStore: ThemeStore = ThemeStore()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(themeStore.themes){
                    theme in
                    NavigationLink(theme.name, destination: EmojiMemoryGameView(viewModel: EmojiMemoryGame(theme: theme)))
                }
            }
            .navigationBarTitle("Theme Chooser")
            .navigationBarItems(leading: Button("Add a theme", action: {}), trailing: EditButton())
        }
    }
}
