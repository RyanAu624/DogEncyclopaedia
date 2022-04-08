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

struct ContentView: View {
    @ObservedObject var datas = ReadData()
    
    @State var changeImage = false
    @State var openCameraRoll = false
    @State var imageSelected = UIImage()
    
    let model = DogEncyclopaediaClassifierModel()
    
    private func classifyImage(image:UIImage) {
        let image = image
        let resizedImage = image.resizeImageTo(size: CGSize(width: 299, height: 299))
        let buffer = resizedImage!.convertToBuffer()
        let output = try! model.prediction(image: buffer!)
        let results = output.classLabelProbs.sorted { $0.1 > $1.1 }
        let result = results[0].key
        for dog in datas.dogs where dog.dog_name_en.lowercased() == result.lowercased(){
            print(dog.id)
            //                DogDetailView(dogImage: "\(dog.id)", dogVariety: "\(dog.dog_name_en)", dogVarietyDetail: "\(dog.description)")
        }
    }
    
    var body: some View {
        NavigationView{
            List {
                Image("HomeIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 80, alignment: .topLeading)
                SearchBarView()
                    .padding(.top, 20)
                    .padding(.bottom)
                    .listRowSeparator(.hidden)
                Text("Variety List")
                    .fontWeight(.bold)
                    .font(.title)
                ForEach (datas.dogs) { dog in
                    ZStack(alignment: .leading) {
                        NavigationLink(destination: {
                            DogDetailView(dogImage: "\(dog.id)", dogVariety: "\(dog.dog_name_en)", dogVarietyDetail: "\(dog.description)")
                        }, label: {
                            EmptyView()
                        }).opacity(0)
                        CardView(dogImage: "\(dog.id)", dogVariety: "\(dog.dog_name_en)")
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
            .navigationTitle("\(Image("HomeIcon"))")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        openCameraRoll = true
                        
                    }) {
                        Image(systemName: "camera")
                    }
                }
            }
        }.sheet(isPresented: $openCameraRoll){
            ImagePicker(selectedImage: $imageSelected, sourceType: .photoLibrary)
                .onDisappear{
                    if $imageSelected != nil {
                        classifyImage(image: imageSelected)
                    }
                }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
