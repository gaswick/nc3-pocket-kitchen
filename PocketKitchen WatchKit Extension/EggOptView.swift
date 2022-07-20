//
//  EggOptView.swift
//  PocketKitchen WatchKit Extension
//
//  Created by Bagas Setyo Wicaksono on 15/07/22.
//

import SwiftUI

var recipes = ContentView().recipes

struct EggOptView: View {
    var optEgg: String
    
//    var eggChoices: [String:[String]] = [
//        
//        "Boiled":recipes[optEgg]!.type!,
//        "Fried":recipes[optEgg]!.type!
//    ]
    
    var body: some View {
        VStack {
            Text("How do you like your \n\(optEgg) eggs?")
                .font(.system(size: 14))
                .multilineTextAlignment(.center)
                .frame(height: 40)
                .padding(.top, 15)
              //  .frame(height: 40, alignment: .center)
              //8  .padding(.top, 15)
            
            customNavLink(destination: AnyView(CountDownView(optEgg: optEgg)), text: recipes[optEgg]!.type![0])
            customNavLink(destination: AnyView(CountDownView(optEgg: optEgg)), text: recipes[optEgg]!.type![1])
            customNavLink(destination: AnyView(CountDownView(optEgg: optEgg)), text: recipes[optEgg]!.type![2])
//            customNavLink(destination: AnyView(EggOptView(optEgg: "Scrambled")), text: recipes[optEgg]!.type![1])
//            customNavLink(destination: AnyView(EggOptView(optEgg: "Fried")), text: recipes[optEgg]!.type![2])
            

        }
    }

}


struct EggOptView_Previews: PreviewProvider {
    static var previews: some View {
        EggOptView(optEgg: "Boiled")
    }
}
