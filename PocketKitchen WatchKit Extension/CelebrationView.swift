//
//  CelebrationView.swift
//  PocketKitchen WatchKit Extension
//
//  Created by Vanessa Ladiocha on 19/07/22.
//



import SwiftUI

struct CelebrationView: View {
    //var skill: String = ""
    //var optEgg: String
    var recipe: Recipe
    @State var timeVal = 4
    @State var showLinkTarget = false
   
    var body: some View {
        ZStack {
            Image("Confetti")
                .ignoresSafeArea()
                .padding(.bottom, 50)
            VStack {
                Text("Well Done!")
                    .bold()
                .font(.system(size: 20))
                
                NavigationLink(destination: ContentView(), isActive: $showLinkTarget){
                    EmptyView()
                }.buttonStyle(.plain)
                
                Text("")
                    .padding(.all, 0)
                    .onAppear{
                        Timer.scheduledTimer(withTimeInterval: 1.0,  repeats: true) { _ in
                            if timeVal > 0 {
                                timeVal -= 1
                                WKInterfaceDevice.current().play(WKHapticType.success)
                            } else {
                                chosenOpt = []
                                showLinkTarget = true
                            }
            
                        }
                }
                
              
                Text("You’ve learned the cooking \n skill of \(recipe.skill)")
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
        CelebrationView(recipe: RecipeData.recipes["Boiled"]!)
    }
}
