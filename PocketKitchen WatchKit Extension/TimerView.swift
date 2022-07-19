//
//  TimerView.swift
//  PocketKitchen WatchKit Extension
//
//  Created by Aulia Rahmi on 18/07/22.
//

import SwiftUI
//masih belum sampai nol
struct TimerView: View {
    @State var timeRemaining = 62
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    func convertSecondToTime(timeInSeconds : Int) ->
        String {
            
        let minutes = timeInSeconds / 60
        let seconds = timeInSeconds % 60
            
            return String(format: "%02i:%02i", minutes, seconds)
    }
    
    var body: some View {
        
        VStack {
            Text(convertSecondToTime(timeInSeconds: timeRemaining)).padding().font(.system(size: 60)).onReceive(timer){ _ in
                    timeRemaining -= 1
            }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
