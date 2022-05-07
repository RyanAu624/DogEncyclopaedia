//
//  DogDetailView.swift
//  DogEncyclopaedia
//
//  Created by Long Hei Au on 6/4/2022.
//

import SwiftUI

struct DogDetailView: View {
    
    var dogImage : String
    var dogVariety : String
    var dogVarietyDetail : String
    var dogPlayFulness : Int
    var dogEnergy : Int
    
    var body: some View {
        VStack (alignment: .leading) {
            Image(dogImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(15)
            Text(dogVariety)
                .font(.title)
                .foregroundColor(.primary)
                .fontWeight(.medium)
                .padding(.bottom, 5)
            HStack {
                Text("Playfulness: ")
                    .font(.title3)
                    .foregroundColor(.primary)
                    .padding(.top, 5)
                    .padding(.bottom, 5)
                ForEach(0 ..< dogPlayFulness) { item in
                    Image(systemName: "pawprint")
                }
            }
            HStack {
                Text("Energy: ")
                    .font(.title3)
                    .foregroundColor(.primary)
                    .padding(.bottom, 5)
                    .padding(.top, 5)
                ForEach(0 ..< dogEnergy) { item in
                    Image(systemName: "pawprint")
                }
            }
            Text(dogVarietyDetail)
            Spacer()
        }
        .padding()
    }
}

struct DogDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DogDetailView(dogImage: "blankImage", dogVariety: "Testing Data", dogVarietyDetail: "Testing Data", dogPlayFulness: 3, dogEnergy: 5)
    }
}
