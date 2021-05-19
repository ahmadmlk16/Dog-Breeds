//
//  Dog.swift
//  DogBreeds
//
//  Created by cs3714 on 2/18/20.
//  Copyright © 2020 AhmadMalik. All rights reserved.
//

import Foundation
import SwiftUI

struct Dog: Hashable,Codable,Identifiable{

    var id: Int
    var name: String
    var description: String
    var facePhotoFilename: String
    var fullPhotoFilename: String
    var websiteUrl: String
    var lifeExpectancy: String
    var origin: String
    var weight: String
    var height: String
    var colors: String
    var temperament: String
}



