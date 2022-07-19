//
//  ToolsPreparationView.swift
//  PocketKitchen WatchKit Extension
//
//  Created by Aulia Rahmi on 15/07/22.
//

import SwiftUI

struct ToolsPreparationView: View {
    //private var tool: [String] = ["Stove", "Spatula", "Non-Stick Pan", "Small Bowl"]
    var recipes = ContentView().recipes
    
    var body: some View {
        
        NavigationView {
            VStack{
                Text("Tools you need to prepare")
                    .font(.system(size: 15))
                        .multilineTextAlignment(.center)
                List{
                    ForEach(self.recipes[1].tools, id: \.self) { i in
                        Text(i).font(.system(size: 13))
                    }
                }
               
                NavigationLink("Next", destination: IngredientsPreparationView())
                    .frame(height: 40)
                    //.padding(min(.infinity, 20))
                    //.foregroundColor(.white)
                    .background(.orange)
                    .cornerRadius(9)
            }
        }.navigationBarHidden(true)
    }
}

struct ToolsPreparationView_Previews: PreviewProvider {
    static var previews: some View {
        ToolsPreparationView()
    }
}
