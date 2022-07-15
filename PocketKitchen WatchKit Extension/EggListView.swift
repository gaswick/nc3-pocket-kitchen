//
//  EggListView.swift
//  PocketKitchen WatchKit Extension
//
//  Created by Bagas Setyo Wicaksono on 15/07/22.
//

import SwiftUI

struct EggListView: View {
    var body: some View {
        VStack {
            Text("How do you like your \n eggs?")
                .font(.system(size: 14))
                .multilineTextAlignment(.center)
                .frame(height: 40, alignment: .center)
                .padding(.top, 15)

            optionButton(buttonName: "Boiled", buttonAction: {})
            optionButton(buttonName: "Scrambled", buttonAction: {})
            optionButton(buttonName: "Fried", buttonAction: {})
        }
    }
}

struct optionButton: View{
    var buttonName:String
    var buttonAction: () -> Void
    
    var body: some View{
        Button(action: buttonAction , label: {
            HStack{
            Text(buttonName)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.vertical, 11)
            .padding(.horizontal)
            .background(
                RoundedRectangle(cornerRadius: 22)
                    .fill(.orange)

            )
        }).frame(height: 40.0).buttonStyle(.plain)
            .padding(.vertical, 3)
    }
}

//---------------------------------

struct EggOptView: View {
    var optEgg: String = ""
    var eggChoices: [String:[String]] = [
        "Boiled":["Soft", "Medium", "Hard"],
        "Fried":["Sunny Side Up", "Over Easy", "Over Hard"]
    ]
    
    var body: some View {
        VStack {
            Text("How do you like your \n\(optEgg) eggs?")
                .font(.system(size: 14))
                .multilineTextAlignment(.center)
                .frame(height: 40, alignment: .center)
                .padding(.top, 15)

            optionButton(buttonName: "\(eggChoices[optEgg] ?? nil)"  , buttonAction: {})
            optionButton(buttonName: "Scrambled", buttonAction: {})
            optionButton(buttonName: "Fried", buttonAction: {})
        }
    }
}



struct EggListView_Previews: PreviewProvider {
    static var previews: some View {
        EggListView()
    }
}
