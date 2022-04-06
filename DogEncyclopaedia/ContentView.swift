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
        NavigationView {
            List {
                Image("HomeIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 80, alignment: .leading)
                SearchBarView()
                    .padding(.top, 20)
                    .padding(.bottom)
                    .listRowSeparator(.hidden)
                Text("Variety List")
                    .fontWeight(.bold)
                    .font(.title)
                ForEach  (0..<5){ item in
                    NavigationLink {
                        DogDetailView(dogImage: "blankImage", dogVariety: "Dog Variety", dogVarietyDetail: "The Pekingese (also spelled Pekinese) is a breed of toy dog, originating in China. The breed was favored by royalty of the Chinese Imperial court as both a lap dog and companion dog, and its name refers to the city of Peking (Beijing) where the Forbidden City is located. The breed has several characteristics and health issues related to its unique appearance. Because of its desirable characteristics, the Pekingese has been part of the development of designer crossbreeds, such as the Peekapoo (crossed with a poodle) and Peke-a-tese (crossed with a Maltese).")
                    } label: {
                        CardView(dogImage: "blankImage", dogVariety: "Dog Variety")
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "camera")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
