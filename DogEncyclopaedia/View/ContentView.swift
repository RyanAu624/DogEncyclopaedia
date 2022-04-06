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
                ForEach  (dogs){ dog in
                    NavigationLink {
                        DogDetailView(dogImage: "\(dog.dogImage)", dogVariety: "\(dog.dogVariety)", dogVarietyDetail: "\(dog.dogVarietyDetail)")
                    } label: {
                        CardView(dogImage: "\(dog.dogImage)", dogVariety: "\(dog.dogVariety)")
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
