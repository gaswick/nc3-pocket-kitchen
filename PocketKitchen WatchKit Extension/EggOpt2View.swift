//
//  EggOpt2View.swift
//  PocketKitchen WatchKit Extension
//
//  Created by Bagas Setyo Wicaksono on 20/07/22.
//

import SwiftUI

struct EggOpt2View: View {
    var optEgg: String
    
    var body: some View {
        VStack {
            Text("How do you like your \n\(optEgg) eggs?")
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
                .frame(height: 40)
                .padding(.top, 15)
              
            customNavLink(destination: AnyView(CountDownView(optEgg: optEgg)), text: recipes[optEgg]!.size![0])
                .simultaneousGesture(TapGesture().onEnded{
                    chosenOpt.append(0)
                })
            customNavLink(destination: AnyView(CountDownView(optEgg: optEgg)), text: recipes[optEgg]!.size![1])
                .simultaneousGesture(TapGesture().onEnded{
                    chosenOpt.append(1)
                })
            customNavLink(destination: AnyView(CountDownView(optEgg: optEgg)), text: recipes[optEgg]!.size![2])
                .simultaneousGesture(TapGesture().onEnded{
                    chosenOpt.append(2)
                })


        }
    }

}

struct EggOpt2View_Previews: PreviewProvider {
    static var previews: some View {
        EggOpt2View(optEgg: "Boiled")
    }
}
