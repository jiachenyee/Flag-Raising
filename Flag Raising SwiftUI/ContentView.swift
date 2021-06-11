//
//  ContentView.swift
//  Flag Raising SwiftUI
//
//  Created by JiaChen(: on 19/5/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var alert: CGFloat = 0
    
    var body: some View {
        TabView {
            HeightenedAlert().tabItem {
                Image(systemName: "figure.stand.line.dotted.figure.stand")
                Text("Heightened Alert")
            }
            FlagRaising().tabItem {
                Image(systemName: "flag")
                Text("Flag Raising")
            }
            
            WWDCView().tabItem {
                Image(systemName: "pc")
                Text("WWDC")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
