//
//  WWDCView.swift
//  Flag Raising SwiftUI
//
//  Created by JiaChen(: on 2/6/21.
//

import SwiftUI

struct WWDCView: View {
    
    var wwdcDate: Date {
        Calendar.current.date(from: DateComponents(timeZone: TimeZone(abbreviation: "PDT")!, year: 2021, month: 6, day: 7, hour: 10, minute: 0, second: 0))!
    }
    
    let timer = Timer.publish(every: 0.0001, on: .main, in: .common).autoconnect()
    
    @State var timeComponents = [0,0,0,0,0]
    @State var timeLabels = ["Day", "Hour", "Minute", "Second", "Millisecond"]
    
    @State var scaleSize: CGFloat = 1
    
    var body: some View {
        
        ZStack {
            Color
                .black
                .ignoresSafeArea(.container, edges: .top)
            
            VStack {
                
                Text("WWDC21 Countdown")
                    .font(.system(size: 50)).bold()
                    .foregroundColor(.white)
                    .scaleEffect(scaleSize)
                    .padding()
                
                HStack {
                    ForEach(0..<3) { i in
                        TimePresentationView(timeValue: timeComponents[i], timeLabel: timeLabels[i])
                        .padding()
                    }
                }
                HStack {
                    ForEach(3..<5) { i in
                        TimePresentationView(timeValue: timeComponents[i], timeLabel: timeLabels[i])
                        .padding()
                    }
                }
            }
        }
        .onReceive(timer, perform: { _ in
            getTime()
        })
        .onAppear {
            withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                scaleSize = 0.5
            }
        }
    }
    
    func getTime() {
        
        let secondsToWWDC = wwdcDate.timeIntervalSince(Date())
        
        let milliseconds = Int(round(secondsToWWDC.truncatingRemainder(dividingBy: 1) * 1000))
        
        var seconds = Int(round(secondsToWWDC))
        
        var minutes = seconds / 60
        
        var hours = minutes / 60
        
        let days = hours / 24
        
        minutes %= 60
        
        hours %= 60
        
        seconds %= 60
        
        timeComponents = [days, hours, minutes, seconds, milliseconds]
        
    }
}

struct TimePresentationView: View {
    
    var timeValue: Int
    var timeLabel: String
    
    var body: some View {
        VStack {
            Text(String(timeValue))
                .foregroundColor(.white)
                .font(.system(size: 30, weight: .heavy))
            Text(timeLabel)
                .foregroundColor(.white)
        }
    }
}

struct WWDCView_Previews: PreviewProvider {
    static var previews: some View {
        WWDCView()
    }
}
