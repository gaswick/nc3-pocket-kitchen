//
//  IngredientsPreparationView.swift
//  PocketKitchen WatchKit Extension
//
//  Created by Aulia Rahmi on 15/07/22.
//

import SwiftUI



struct IngredientsPreparationView: View {
//    private var tool: [[String]] = [["Egg","1","item"],["Cold Water","","tsp"]]
    //@Binding var recipes: Recipe

    
    var body: some View {
        NavigationView {
            VStack{
                Text("Ingredients you need to prepare")
                    .font(.system(size: 15))
                        .multilineTextAlignment(.center)
                
                List{
//                    ForEach(self.recipes[1].ingredients, id: \.self) { i in
//                        Text(i).font(.system(size: 13))
//                    }
                }
                
                NavigationLink("Next", destination: ContentView())
                    .frame(height: 40)
                    //.padding(min(.infinity, 20))
                    //.foregroundColor(.white)
                    .background(.orange)
                    .cornerRadius(9)
            }
        }.navigationBarHidden(true)
    }
}

struct IngredientsPreparationView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsPreparationView()
    }
}
