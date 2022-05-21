//
//  ItemRowView.swift
//  PortfolioApp
//
//  Created by Mateusz Kuznik on 21/05/2022.
//

import SwiftUI

struct ItemRowView: View {

    @ObservedObject var item: Item

    var body: some View {
        NavigationLink(destination: EditItemView(item: item)) {
            Text(item.itemTitle)
        }
    }
}

struct ItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        ItemRowView(item: .example)
    }
}
