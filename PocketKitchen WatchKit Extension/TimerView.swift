//
//  TimerView.swift
//  PocketKitchen WatchKit Extension
//
//  Created by Aulia Rahmi on 18/07/22.
//
import Foundation
import SwiftUI
import Combine
//masih belum sampai nol
struct TimerView: View {
    @State var timeRemaining = 180
    @State var progress : Float = 0.0

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    func convertSecondToTime(timeInSeconds : Int) ->
        String {
            
        let minutes = timeInSeconds / 60
        let seconds = timeInSeconds % 60
            
            return String(format: "%02i:%02i", minutes, seconds)
    }
    
    var body: some View {
        let maxTime = timeRemaining
        let fill : Float = Float(1)/Float(maxTime)
        let _ = print(fill)
        VStack {
            ZStack {
                
                Text(convertSecondToTime(timeInSeconds: timeRemaining)).bold().padding().font(.system(size: 20)).onReceive(timer){ _ in
                    if(timeRemaining>0){
//                        timeRemaining -= 1
                    }
                        
                }
                    .padding()
                    .onAppear{
                        Timer.scheduledTimer(withTimeInterval: 1.0,  repeats: true) { _ in
                            if timeRemaining > 0 {
                                timeRemaining -= 1
                                    
                                
                                if (progress) < 1.0 {
                                    progress += fill
                                }
                            }else{
                                WKInterfaceDevice.current().play(WKHapticType.)

                            }
                            
                        }
                }
                
                    
            
                Circle()
                    .stroke(lineWidth: 6.0)
                    .opacity(1)
                    .foregroundColor(Color.gray)
                    .frame(width: 87, height: 87)
        
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 6.0, lineCap: .round, lineJoin: .round))
                    .frame(width: 87, height: 87)
                    .rotationEffect(Angle(degrees: 270))
                    .animation(.easeInOut(duration: 0.5))
                    .foregroundColor(.orange)
            }

        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
