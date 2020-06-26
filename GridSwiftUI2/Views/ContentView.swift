//
//  ContentView.swift
//  GridSwiftUI2
//
//  Created by Wanhar on 26/06/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sliderValue: CGFloat = 2
    
    let clubs = Club.all()
    
    var body: some View {
        
        let columns: [GridItem] = Array(repeating: .init(.flexible()), count: Int((self.sliderValue)))
        var rows: [GridItem]    = Array(repeating: .init(.flexible()), count: Int((self.sliderValue)))
        
        return NavigationView {
            VStack {
                Slider(value: $sliderValue, in: 2...5, step: 1)
                Text(String(format: "%.0f", self.sliderValue))
                
                ScrollView(.horizontal) {
                    LazyHGrid(rows: rows){
                        ForEach(self.clubs, id: \.id) { item in
                            Text(item.name)
                                .bold()
                                .font(.title)
                        }
                    }
                }
                
                ScrollView {
                    LazyVGrid(columns: columns){
                        ForEach(self.clubs, id: \.name) { item in
                            Image(item.imageURL)
                                .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                                .frame(width: 100, height: 100, alignment: .center)
                        }
                    }
                }
            }
            .navigationBarTitle("Football")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
