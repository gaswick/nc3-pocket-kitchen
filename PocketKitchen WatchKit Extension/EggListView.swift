//
//  EggListView.swift
//  PocketKitchen WatchKit Extension
//
//  Created by Bagas Setyo Wicaksono on 15/07/22.
//

import SwiftUI

struct EggListView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Text("How do you like your \n eggs?")
                    .font(.system(size: 14))
                    .multilineTextAlignment(.center)
                    .frame(height: 40, alignment: .center)
                    .padding(.top)

                customNavLink(destination: AnyView(EggOptView(optEgg: "Boiled")), text: "Boiled")
                customNavLink(destination: AnyView(EggOptView(optEgg: "Scrambled")), text: "Scrambled")
                customNavLink(destination: AnyView(EggOptView(optEgg: "Fried")), text: "Fried")
                    
                    
                
            }
        }
    }
}

struct customNavLink: View{
    var destination: AnyView
    var text: String
    
    var body: some View{
        NavigationLink(destination: destination){
            Text(text).bold()
            
        }
        .frame(width: 183.0, height: 40.0)
        .background(RoundedRectangle(cornerRadius: 22)
        .fill(Color.init(UIColor(rgb: 0xEE921D)))
        )
        .foregroundColor(.black)
        .buttonStyle(.plain)
        .padding(.vertical, 1)
        .buttonStyle(ThemeAnimationStyle())
    }
}

//---------------------------------


struct EggListView_Previews: PreviewProvider {
    static var previews: some View {
        EggListView()
    }
}

