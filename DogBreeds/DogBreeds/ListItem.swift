//
//  ListItem.swift
//  DogBreeds
//
//  Created by cs3714 on 2/19/20.
//  Copyright © 2020 AhmadMalik. All rights reserved.
//

import SwiftUI

// Creates a general view for each list item
// Inputs 3 paramates

struct ListItem: View {
    
   let image : String
   let text1 : String
   let text2 : String
    
    
    var body: some View {
            HStack(){
                //Display Image
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.blue)
                    .frame(width: 25.0, height: 25.0)
                //Display Text
                Text(text1).font(.footnote)
                    .italic().foregroundColor(.blue)
                //Display Text
                Text(text2)
                    .fixedSize(horizontal: false, vertical: true)
        }// End HStack
    }//End View
}//End Struct


