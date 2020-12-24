//
//  GridView.swift
//  Memorize
//
//  Created by Zubair Ahmed on 24/12/2020.
//

import SwiftUI

struct GridView<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView ){
        self.items = items
        self.viewForItem = viewForItem
    }
    var body: some View {
        GeometryReader {
            geometry in
            self.body(usingLayout: GridLayout(itemCount: items.count, in: geometry.size))
        }
    }
    
    func body(usingLayout layout: GridLayout) -> some View {
        ForEach (self.items) {
            item in
            self.body(for: item, in: layout)
        }
    }
    
    func body(for item: Item, in layout: GridLayout) -> some View {
        let index = self.items.firstIndex {$0.id == item.id}!
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }
}
