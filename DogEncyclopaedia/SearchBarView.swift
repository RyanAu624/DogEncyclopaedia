//
//  SearchBarView.swift
//  DogEncyclopaedia
//
//  Created by Long Hei Au on 4/4/2022.
//

import SwiftUI

struct SearchBarView: View {
    
    @State var searchText = ""
    
    var body: some View {
        TextField("   Search Here", text: $searchText)
            .frame(height: 50)
            .background(.white)
            .cornerRadius(7)
            .shadow(color: .gray, radius: 4, x: 0, y: 0)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
