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
                    .padding(.bottom, 20)
                Text(dogVarietyDetail)
            }
            .padding()
    }
}

struct DogDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DogDetailView(dogImage: "blankImage", dogVariety: "Dog Variety", dogVarietyDetail: "The Pekingese (also spelled Pekinese) is a breed of toy dog, originating in China. The breed was favored by royalty of the Chinese Imperial court as both a lap dog and companion dog, and its name refers to the city of Peking (Beijing) where the Forbidden City is located. The breed has several characteristics and health issues related to its unique appearance. Because of its desirable characteristics, the Pekingese has been part of the development of designer crossbreeds, such as the Peekapoo (crossed with a poodle) and Peke-a-tese (crossed with a Maltese).")
    }
}
