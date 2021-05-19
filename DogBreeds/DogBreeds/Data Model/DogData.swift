//
//  DogData.swift
//  DogBreeds
//
//  Created by cs3714 on 2/18/20.
//  Copyright © 2020 AhmadMalik. All rights reserved.
//

import Foundation
 


// Global array of Car structs
var listOfDogs = [Dog]()
 
/*
 **************************
 MARK: - Read Car Data File
 **************************
 */

public func readDogDataFile() {
 
    listOfDogs = loadFromMainBundle("DogBreedsData.json")
}
 

/*
*******************************************
MARK: - Load Car Data File from Main Bundle
*******************************************
*/

func loadFromMainBundle<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Unable to find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Unable to load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename) as \(T.self):\n\(error)")
    }
}
