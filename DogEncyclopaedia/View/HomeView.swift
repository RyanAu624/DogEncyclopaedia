//
//  ContentView.swift
//  DogEncyclopaedia
//
//  Created by Long Hei Au on 2/4/2022.
//

import SwiftUI

import CoreML
import Vision
import CoreImage

struct HomeView: View {
    @ObservedObject var datas = ReadData()
    
    @State var changeImage = false
    @State var openCameraRoll = false
    @State var imageSelected = UIImage()
    
    @State private var searchText = ""
    @State var isEditing = false
    @FocusState private var isFocused: Bool

    @State var showView = false
    @State var res: Int
    
    @State var showChatBot = false
    
    let model = DogEncyclopaediaClassifierModel()
        
    var body: some View {
        NavigationView{
            ZStack {
                VStack {
                    NavigationLink(isActive: $showView) {
                        ForEach (datas.dogs) { dog in
                            if res == dog.id {
                                DogDetailView(dogImage: "\(dog.id)",
                                              dogVariety: "\(dog.dog_name_en)",
                                              dogVarietyDetail: "\(dog.description)",
                                              dogPlayFulness: dog.dogPlayFulness,
                                              dogEnergy: dog.dogEnergy)
                            }
                        }
                    } label: {
                        EmptyView()
                    }
                }
                VStack {
                    List {
                        Image("HomeIcon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 80, alignment: .topLeading)
                            .padding(.top, -40)
                            .padding(.bottom, 20)
                        HStack {
                            TextField("Search Here", text: $searchText)
                                .padding()
                                .frame(height: 50)
                                .background(.white)
                                .cornerRadius(7)
                                .shadow(color: .gray, radius: 4, x: 0, y: 0)
                                .padding(.bottom, 20)
                                .listRowSeparator(.hidden)
                                .focused($isFocused)
                                .onSubmit {
                                    isEditing = true
                                }
                            if isEditing {
                                Button(action: {
                                    self.isEditing = false
                                    self.searchText = ""
                                    self.isFocused = false
                                }) {
                                    Text("Cancel")
                                }
                                .padding(.leading, 6)
                                .padding(.bottom, 20)
                            }
                        }
                        .listRowSeparator(.hidden)
                        Text("Variety List")
                            .fontWeight(.bold)
                            .font(.title)
                        if isEditing == false {
                            ForEach (datas.dogs) { dog in
                                ZStack(alignment: .leading) {
                                    NavigationLink(destination: {
                                        DogDetailView(dogImage: "\(dog.id)",
                                                      dogVariety: "\(dog.dog_name_en)",
                                                      dogVarietyDetail: "\(dog.description)",
                                                      dogPlayFulness: dog.dogPlayFulness,
                                                      dogEnergy: dog.dogEnergy)
                                    }, label: {
                                        EmptyView()
                                    }).opacity(0)
                                    CardView(dogImage: "\(dog.id)", dogVariety: "\(dog.dog_name_en)")
                                }
                            }
                            .listRowSeparator(.hidden)
                        } else {
                            ForEach (datas.dogs.filter { $0.dog_name_en.contains(searchText)}) { dog in
                                ZStack(alignment: .leading) {
                                    NavigationLink(destination: {
                                        DogDetailView(dogImage: "\(dog.id)",
                                                      dogVariety: "\(dog.dog_name_en)",
                                                      dogVarietyDetail: "\(dog.description)",
                                                      dogPlayFulness: dog.dogPlayFulness,
                                                      dogEnergy: dog.dogEnergy)
                                    }, label: {
                                        EmptyView()
                                    }).opacity(0)
                                    CardView(dogImage: "\(dog.id)", dogVariety: "\(dog.dog_name_en)")
                                }
                            }
                            .listRowSeparator(.hidden)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showChatBot = true
                        
                    }) {
                        Image(systemName: "text.bubble")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        openCameraRoll = true
                        
                    }) {
                        Image(systemName: "camera")
                    }
                }
            }
        }
        .sheet(isPresented: $openCameraRoll) {
            ImagePicker(selectedImage: $imageSelected, sourceType: .photoLibrary)
            .onDisappear{
                if $imageSelected != nil {
                    classifyImage(image: imageSelected)
                }
            }
        }
        .fullScreenCover(isPresented: $showChatBot) {
            ChatBotView(isPresented: $showChatBot)
        }
    }
    
    private func classifyImage(image:UIImage) {
        let image = image
        let resizedImage = image.resizeImageTo(size: CGSize(width: 299, height: 299))
        let buffer = resizedImage!.convertToBuffer()
        let output = try! model.prediction(image: buffer!)
        let results = output.classLabelProbs.sorted { $0.1 > $1.1 }
        let result = results[0].key
        for dog in datas.dogs where dog.dog_name_en.lowercased() == result.lowercased(){
            print(dog.id)
            print(dog.dog_name_en)
            res = dog.id
        }
        showView = true
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(res: 0)
    }
}


