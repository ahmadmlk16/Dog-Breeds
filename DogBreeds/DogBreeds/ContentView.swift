//
//  ContentView.swift
//  DogBreeds
//
//  Created by cs3714 on 2/18/20.
//  Copyright © 2020 AhmadMalik. All rights reserved.
//

import SwiftUI
import WebKit

struct ContentView : View {
    
    @State private var selectedDog = listOfDogs[0]
    
    var body: some View {
        
        NavigationView{
            
            ZStack {
                
                VStack {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(listOfDogs, id: \.id) { aDog in
                                
                                Button(action: {
                                    self.selectedDog = aDog
                                }) {
                                    VStack {
                                        Image(aDog.facePhotoFilename)
                                            .resizable()
                                            .renderingMode(.original)
                                            .frame(height: 100)
                                            .aspectRatio((3/2), contentMode: .fit)
                                        
                                        
                                        
                                        Text(aDog.name.replacingOccurrences(of: " ", with: "\n"))
                                            .fixedSize()
                                            .foregroundColor(aDog.name == self.selectedDog.name ? .red : .blue)
                                            .multilineTextAlignment(.center)
                                        
                                        
                                    }
                                    
                                }   // End of Button
                                
                            }   // End of ForEach
                            
                        }   // End of HStack
                            // Set font and size for the whole HStack content
                            .font(.system(size: 14))
                        
                    }   // End of ScrollView
                        // ScrollView must know its width to be able to scroll horizontally
                        .frame(width: UIScreen.main.bounds.width - 20)
                        // Fixes ScrollView at its ideal size. Button names do not truncate.
                        .fixedSize()
                    
        
                    List{
                        
                        GeometryReader{ geometry in
                        VStack(alignment: .center){
                        Text(self.selectedDog.name)
                            .font(.title)//Title size
                        }.frame(width: geometry.size.width)
                        }//Centers the text within the list
                        
                        
                        //Main dog image
                        Image(self.selectedDog.fullPhotoFilename)
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width-20, height: 200.0)
                          
                        //Caption of dog
                        Text(self.selectedDog.description)
                            .font(.caption)
                           
                        //Gives a navigation link to the dogs website
                        NavigationLink(destination: WebView(showURL: self.selectedDog.websiteUrl)){
                            //Calls a list item
                            ListItem(image: "globe", text1: "Website: ", text2: "For more information: ")
                       
                        }//End Nav Link
                        
                        //Calling all the list Items
                        ListItem(image: "l.circle", text1: "Life Expectency: ", text2: self.selectedDog.lifeExpectancy)
                        ListItem(image: "o.circle", text1: "Origin: ", text2: self.selectedDog.origin)
                        ListItem(image: "w.circle", text1: "Weight: ", text2: self.selectedDog.weight)
                        ListItem(image: "h.circle", text1: "Height: ", text2: self.selectedDog.height)
                        ListItem(image: "c.circle", text1: "Color: ", text2: self.selectedDog.colors)
                        ListItem(image: "t.circle", text1: "Temperament: ", text2: self.selectedDog.temperament)
                        
                        
                    }//End Of list
                        .font(.system(size: 14)) //Makes text in List of size 14
                  
                    
                }// End Main VStack

            }  // End of ZStack
                .navigationBarTitle("Dog Breeds", displayMode: .inline)
                .font(.headline)
      
            
        }//End of Navigation View
        
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
