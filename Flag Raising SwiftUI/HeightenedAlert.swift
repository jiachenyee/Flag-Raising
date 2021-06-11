//
//  HeightenedAlert.swift
//  Flag Raising SwiftUI
//
//  Created by JiaChen(: on 19/5/21.
//

import SwiftUI

struct HeightenedAlert: View {
    
    @State var alert: CGFloat = 0
    
    @State var value: CGFloat = 0
    
    @State var leaveHouse = false
    
    @Environment(\.openURL) var openURL
    
    var body: some View {
        VStack {
            CircularProgressView(progress: value.truncatingRemainder(dividingBy: 1))
                .frame(width: 200, height: 200)
            
            if value >= 1 {
                Text("Phase 3! 🎉")
                    .bold()
                    .padding()
            }
            
            Text("Heightened Alert!")
                .padding()
                .offset(y: alert)
            
            HStack {
                Button("more covid") {
                    withAnimation {
                        alert -= 10
                        value += 0.1
                        
                        if value >= 2 {
                            openURL(URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ")!)
                        }
                    }
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding()
            }
        }
        .frame(maxHeight: .infinity,
               alignment: .bottom)
        .padding()
    }
}

struct HeightenedAlert_Previews: PreviewProvider {
    static var previews: some View {
        HeightenedAlert()
    }
}

struct CircularProgressView: View {
    
    var progress: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.3)
                .foregroundColor(.red)
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(style: .init(lineWidth: 20.0,
                                     lineCap: .round,
                                     lineJoin: .round))
                .foregroundColor(.red)
        }
    }
}
