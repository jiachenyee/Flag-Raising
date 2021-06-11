//
//  HeightenedAlert.swift
//  Flag Raising SwiftUI
//
//  Created by JiaChen(: on 19/5/21.
//

import SwiftUI

struct HeightenedAlert: View {
    
    @State var alert: CGFloat = 0
    
    @State var leaveHouse = false
    
    var body: some View {
        VStack {
                Text("Alert!")
                    .padding()
                    .offset(y: alert)
            HStack {
                Button("Leave House") {
                    leaveHouse = true
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding()
                Button("more covid") {
                    withAnimation {
                        alert -= 10
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
        .alert(isPresented: $leaveHouse) {
            Alert(title: Text("EH WHY YOU LEAVE HOUSE"),
                  message: Text("i report"),
                  primaryButton: .default(Text("okok i go home")){
                    withAnimation {
                        alert += 10
                    }
                  },
                  secondaryButton: .default(Text("report then report. i dont care.")){
                    withAnimation {
                        alert -= 50
                    }
                  })
        }
    }
}

struct HeightenedAlert_Previews: PreviewProvider {
    static var previews: some View {
        HeightenedAlert()
    }
}
