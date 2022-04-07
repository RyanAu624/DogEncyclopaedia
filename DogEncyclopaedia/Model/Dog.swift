//
//  Dog.swift
//  DogEncyclopaedia
//
//  Created by Long Hei Au on 6/4/2022.
//

import Foundation

struct Dog : Identifiable {
    var id = UUID()
    var dogVariety : String
    var dogVarietyDetail : String
    var dogImage: String
}

var dogs = [
    Dog(dogVariety: "Pekingese", dogVarietyDetail: "The Pekingese (also spelled Pekinese) is a breed of toy dog, originating in China. The breed was favored by royalty of the Chinese Imperial court as both a lap dog and companion dog, and its name refers to the city of Peking (Beijing) where the Forbidden City is located. The breed has several characteristics and health issues related to its unique appearance. Because of its desirable characteristics, the Pekingese has been part of the development of designer crossbreeds, such as the Peekapoo (crossed with a poodle) and Peke-a-tese (crossed with a Maltese).", dogImage: "dog_image1"),
    Dog(dogVariety: "Akita", dogVarietyDetail: "The Akita is a large breed of dog originating from the mountainous regions of northern Japan. The two separate varieties of Akita are a Japanese strain, commonly called Akita Inu (inu means dog in Japanese) or Japanese Akita, and an American strain, known as the Akita or American Akita. The Japanese strain occurs in a narrow palette of colors, with all other colors considered atypical of the breed, while the American strain comes in all dog colors. The Akita has a short double coat similar to that of many other northern spitz breeds such as the Siberian Husky, but long-coated dogs can also be found in many litters due to a recessive gene. The Akita is a powerful, independent, and dominant breed, commonly aloof with strangers, but affectionate with family members. As a breed, Akitas are generally hardy.", dogImage: "dog_image2"),
    Dog(dogVariety: "Husky", dogVarietyDetail: "Husky is a general term for a dog used in the polar regions, primarily and specifically for work as sled dogs. It refers to a traditional northern type, notable for its cold-weather tolerance and overall hardiness. Though dogs such as the AKC/CKC-registered Alaskan Malamute may not contain 'Husky' in their official name, the term still encompasses dogs of their type.[citation needed] Modern racing huskies that maintain arctic breed traits (also known as Alaskan huskies) represent an ever-changing crossbreed of the fastest dogs. Huskies have continued to be used in sled-dog racing, as well as expedition and trek style tour businesses, and as a means of essential transportation in rural communities. Huskies are also kept as pets, and groups work to find new pet homes for retired racing and adventure-trekking dogs.", dogImage: "dog_image3")
]
