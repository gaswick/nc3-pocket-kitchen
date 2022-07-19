//
//  CelebrationView.swift
//  PocketKitchen WatchKit Extension
//
//  Created by Vanessa Ladiocha on 19/07/22.
//



import SwiftUI

struct CelebrationView: View {
    var body: some View {
        ZStack {
            Image("Confetti")
                .ignoresSafeArea()
                .padding(.bottom, 50)
            VStack {
                Text("Well Done!")
                    .bold()
                .font(.system(size: 20))
            
                
            Text("You’ve learned the cooking \n skill of boiling")
                .multilineTextAlignment(.center)
                .frame(height: 40, alignment: .center)
                .font(.system(size: 13))
            }
            .padding(.top, 90)
        }
        
    }
}

struct CelebrationView_Previews: PreviewProvider {
    static var previews: some View {
        CelebrationView()
    }
}