//
//  BotResponse.swift
//  DogEncyclopaedia
//
//  Created by Ryan Au on 7/5/2022.
//

import Foundation

func getBotResponse(message: String) -> String {
    let tempMessage = message.lowercased()
    
    if tempMessage.contains("hello") {
        return "Hey there!"
    }
    else if tempMessage.contains("hi") {
        return "Hey there!"
    }
    else if tempMessage.contains("goodbye") {
        return "Talk to you later!"
    }
    else if tempMessage.contains("how are you") {
        return "I'm fine, how about you?"
    }
    else if tempMessage.contains("pekingese") {
        return "The Pekingese, a compact toy companion of regal bearing and a distinctive rolling gait..."
    }
    else if tempMessage.contains("pointer") {
        return "The high-energy Pointer is an excellent runner's companion..."
    }
    else if tempMessage.contains("akita") {
        return "Akita is muscular, double-coated dogs of ancient Japanese lineage famous for her dignity, courage, and loyalty..."
    }
    else if tempMessage.contains("portuguese water dog") {
        return "The Portuguese Water Dog is super-smart and very 'biddable'..."
    }
    else if tempMessage.contains("saint bernard") {
        return "The Saint Bernard is the world's most famous and beloved breeds..."
    }
    else if tempMessage.contains("silky terrier") {
        return "The Silky, a native of Sydney, Australia, is larger than his close cousin, the Yorkshire Terrier..."
    }
    else if tempMessage.contains("chihuahua") {
        return "The Chihuahua is a balanced, graceful dog of terrier-like demeanor, weighing no more than 6 pounds..."
    }
    else if tempMessage.contains("dachshund") {
        return "The famously long, low silhouette, ever-alert expression, and bold, vivacious personality of the Dachshund have made him a superstar of the canine kingdom..."
    }
    else if tempMessage.contains("tibetan mastiff") {
        return "Watchful, aloof, imposing, and intimidating: The ancient Tibetan Mastiff is the guardian dog supreme..."
    }
    else if tempMessage.contains("german shepherd") {
        return "Generally considered dogkind's finest all-purpose worker, the German Shepherd Dog is a large, agile, muscular dog of noble character and high intelligence. Loyal, confident, courageous, and steady, the German Shepherd is truly a dog lover's delight..."
    }
    else {
        return "Enter the Breed to check the information."
    }
}
