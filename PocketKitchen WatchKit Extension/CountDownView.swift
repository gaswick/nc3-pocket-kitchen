//
//  CountDownView.swift
//  PocketKitchen WatchKit Extension
//
//  Created by Vanessa Ladiocha on 15/07/22.
//

import SwiftUI

struct CountDownView: View {
    var optEgg: String
    @State var showLinkTarget = false
    @State var timeVal = 3
    @State var progress : Float = 0.0
    var fill : Float = 0.33
    
    var body: some View {
        NavigationView {
            VStack {
                Text("\(optEgg) Egg")
                    .font(.system(size: 16))
                    .bold()
                    .padding(.bottom, 20)
                let _ = print(chosenOpt)
                ZStack {
                    
                    NavigationLink(destination: StepView(optEgg: optEgg), isActive: $showLinkTarget){
                        EmptyView()
                    }.buttonStyle(.plain)
                
                    Text(progress == 0.0
                         ? "Ready"
                         : "\(timeVal)")
                        .bold()
                        .font(progress == 0.0
                              ? .system(size: 15)
                              : .system(size: 60))
                        .padding()
                        .onAppear{
                            Timer.scheduledTimer(withTimeInterval: 1.0,  repeats: true) { _ in
                                if timeVal > 1 {
                                    if (progress != 0) {
                                        timeVal -= 1
                                    }
                                    if (progress) < 1.0 {
                                        progress += fill
                                    }
                                } else {
                                    // pindah screen
    //                                let _ = print("test")
                                    showLinkTarget = true
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
        }.navigationBarBackButtonHidden(true)
    }

}

struct CountDownView_Previews: PreviewProvider {
    static var previews: some View {
        CountDownView(optEgg: "Boiled")
    }
}
