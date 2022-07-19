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
    
    var eggChoices: [String:[String]] = [
        
        "Boiled":recipes[0].type!,
            "Fried":recipes[2].type!
//        "Boiled":["Soft", "Medium", "Hard"],
//        "Fried":["Sunny Side Up", "Over Easy", "Over Hard"]
    ]
    
    var body: some View {
        VStack {
            Text("How do you like your \n\(optEgg) eggs?")
                .font(.system(size: 14))
                .multilineTextAlignment(.center)
                .frame(height: 40, alignment: .center)
                .padding(.top, 15)
            
            customNavLink(destination: AnyView(CountDownView(optEgg: optEgg)), text: eggChoices[optEgg]![0])
            customNavLink(destination: AnyView(EggOptView(optEgg: "Scrambled")), text: eggChoices[optEgg]![1])
            customNavLink(destination: AnyView(EggOptView(optEgg: "Fried")), text: eggChoices[optEgg]![2])
            

        }
    }

}


struct EggOptView_Previews: PreviewProvider {
    static var previews: some View {
        EggOptView(optEgg: "Boiled")
    }
}
