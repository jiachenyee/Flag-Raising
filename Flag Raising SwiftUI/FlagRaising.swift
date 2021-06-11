//
//  FlagRaising.swift
//  Flag Raising SwiftUI
//
//  Created by JiaChen(: on 19/5/21.
//

import SwiftUI

struct FlagRaising: View {
    
    @State var flag: CGFloat = 0
    @State var flagSize: CGFloat = 1
    @State var flagRotation: Angle = Angle(degrees: 0)
    
    @State var singapore: Bool = false
    
    var body: some View {
        ZStack {
            if singapore {
                LinearGradient(gradient: Gradient(colors: [Color(red: 183/255, green: 48/255, blue: 66/255, opacity: 1), Color(red: 211/255, green: 94/255, blue: 90/255)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            } else {
                Color.white
            }
            
            VStack {
                HStack(alignment: .bottom, spacing: 0) {
                    Rectangle().frame(width: 10)
                    Text("🇸🇬")
                        .font(.system(size: 100))
                        .padding()
                        .rotationEffect(flagRotation)
                        .scaleEffect(flagSize)
                        .offset(x: -30, y: flag)
                }
                Button("Majulah! 🦁") {
                    withAnimation {
                        flag -= 5
                        
                        switch flag {
                        case -75:
                            withAnimation(Animation.easeInOut(duration: 0.1).repeatForever(autoreverses: true)) {
                                flagSize = 2
                            }
                        case -150:
                            withAnimation(Animation.easeInOut(duration: 1).repeatForever()) {
                                flagRotation = Angle(degrees: 360)
                            }
                        case -225:
                            withAnimation {
                                singapore = true
                            }
                        default: break
                        }
                    }
                    
                }
            }
            .frame(maxHeight: .infinity,
                   alignment: .bottom)
            .padding()
        }
        .ignoresSafeArea(.container, edges: .top)
    }
}

struct FlagRaising_Previews: PreviewProvider {
    static var previews: some View {
        FlagRaising()
    }
}
