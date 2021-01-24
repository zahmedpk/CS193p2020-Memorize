//
//  ThemeEditorView.swift
//  Memorize
//
//  Created by Zubair Ahmed on 24/01/2021.
//

import SwiftUI

struct ThemeEditorView: View {
    @Binding var showThemeEditor: Bool
    var theme: Theme
    @State var newThemeName: String
    @State var newThemeColor: Color
    @State var newNumberOfCards: Int
    @State var addedEmojis: String = ""
    @EnvironmentObject var themeStore: ThemeStore
    
    init(showThemeEditor : Binding<Bool>, theme: Theme) {
        self._showThemeEditor = showThemeEditor
        self.theme = theme
        self._newThemeName = State(initialValue: theme.name)
        self._newThemeColor = State(initialValue: Color(UIColor.init(theme.color)))
        self._newNumberOfCards = State(initialValue: theme.numberOfPairs * 2)
    }
    
    var body: some View {
        VStack {
            ZStack {
                Text("Edit Theme")
                    .font(.headline)
                    .padding()
                HStack {
                    Spacer()
                    Button("Done", action: {
                        themeStore.changeColor(of: theme, to: newThemeColor)
                        themeStore.change(numberOfCards: newNumberOfCards, of: theme)
                        showThemeEditor = false
                    })
                    .padding(.horizontal)
                    .foregroundColor(.blue)
                }
            }
            NavigationView {
                Form {
                    Section {
                        TextField(theme.name, text: $newThemeName) { currentlyEditing in
                            if !currentlyEditing {
                                themeStore.changeName(of: theme, to: newThemeName)
                            }
                        }
                        ColorPicker(selection: $newThemeColor){
                            Text("Pick color").foregroundColor(.gray).font(.footnote)
                        }
                        Picker(selection: $newNumberOfCards, label: Text("Number of cards")){
                            ForEach(theme.possibleNumberOfCards(), id: \.self){
                                number in
                                Text("\(number)")
                            }
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                        }
                    }
                    
                    Section{
                        TextField("Add Emoji", text: $addedEmojis) {
                            currentlyEditing in
                            if(!currentlyEditing){
                                themeStore.addEmojis(to: theme, addedEmojis: addedEmojis.map {String($0)})
                            }
                        }
                        Text("Tap an emoji to remove").font(.footnote).foregroundColor(.gray)
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 30))], spacing: 10) {
                            ForEach(Array(theme.emojis), id: \.self){
                                emoji in
                                Text(emoji)
                                    .onTapGesture {
                                        themeStore.removeEmoji(from: theme, emoji: emoji)
                                    }
                            }
                        }
                    }
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
        }
    }
}
