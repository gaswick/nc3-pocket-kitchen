//
//  EggOptView.swift
//  PocketKitchen WatchKit Extension
//
//  Created by Bagas Setyo Wicaksono on 15/07/22.
//

import SwiftUI

struct EggOptView: View {
    var optEgg: String
    
    var body: some View {
        VStack {
            Text("How do you like your \n\(optEgg) eggs?")
                .font(.system(size: 14))
                .multilineTextAlignment(.center)
                .frame(height: 40)
                .padding(.top, 15)
              //  .frame(height: 40, alignment: .center)
              //8  .padding(.top, 15)
            if(optEgg == "Fried"){
                customNavLink(destination: AnyView(CountDownView(optEgg: optEgg)), text: recipes[optEgg]!.type![0])
                    .simultaneousGesture(TapGesture().onEnded{
                        chosenOpt.append(0)
                    })
                customNavLink(destination: AnyView(CountDownView(optEgg: optEgg)), text: recipes[optEgg]!.type![1])
                    .simultaneousGesture(TapGesture().onEnded{
                        chosenOpt.append(1)
                    })
                customNavLink(destination: AnyView(CountDownView(optEgg: optEgg)), text: recipes[optEgg]!.type![2])
                    .simultaneousGesture(TapGesture().onEnded{
                        chosenOpt.append(2)
                    })

            }else{
                customNavLink(destination: AnyView(EggOpt2View(optEgg: optEgg)), text: recipes[optEgg]!.type![0])
                    .simultaneousGesture(TapGesture().onEnded{
                        chosenOpt.append(0)
                    })
                customNavLink(destination: AnyView(EggOpt2View(optEgg: optEgg)), text: recipes[optEgg]!.type![1])
                    .simultaneousGesture(TapGesture().onEnded{
                        chosenOpt.append(1)
                    })
                customNavLink(destination: AnyView(EggOpt2View(optEgg: optEgg)), text: recipes[optEgg]!.type![2])
                    .simultaneousGesture(TapGesture().onEnded{
                        chosenOpt.append(2)
                    })
            }

        }
    }

}


struct EggOptView_Previews: PreviewProvider {
    static var previews: some View {
        EggOptView(optEgg: "Boiled")
    }
}
