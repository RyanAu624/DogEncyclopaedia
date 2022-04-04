//
//  ContentView.swift
//  DogEncyclopaedia
//
//  Created by Long Hei Au on 2/4/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        List {
            HStack {
                Image("HomeIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 80, alignment: .leading)
                Button(action: {
                    
                }) {
                    Image(systemName: "camera")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .listRowSeparator(.hidden)
            .padding(.bottom, 10)
            SearchBarView()
                .padding(.bottom)
                .listRowSeparator(.hidden)
            Text("Variety List")
                .fontWeight(.bold)
                .font(.title)
            ForEach  (0..<5){ item in
                CardView(dogImage: "blankImage", dogVariety: "dog")
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(PlainListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
