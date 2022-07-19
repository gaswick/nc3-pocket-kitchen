//
//  ToolsPreparationView.swift
//  PocketKitchen WatchKit Extension
//
//  Created by Aulia Rahmi on 15/07/22.
//

import SwiftUI

struct Recipe {
    var recipeName: String
    var type: [String]?
    var size: [String]?
    var tools: [String]
    var ingredients: [[String]]
    var instruction: [[String]]
    var timer: [[Int]]
    var timerShowed: [Int]
}

struct ToolsPreparationView: View {
    //private var tool: [String] = ["Stove", "Spatula", "Non-Stick Pan", "Small Bowl"]
    
    @State var recipes: [Recipe] = [
        Recipe(recipeName: "Boiled", type: ["Soft", "Medium", "Hard"], size: ["Medium","Large","X-Large"], tools: ["Stove","Saucepan"], ingredients: [["Egg","1 item"],["Cold Water"]], instruction: [["Place your eggs in a single layer on the bottom of your pot and cover with cold water","The water should be about an inch or so higher than the eggs"],["Cover and bring to a boil"],["Over high heat, bring your eggs to rolling boil"],["Remove from heat and let stand in water","Let the egg cook until white is set"],["Drain water and run cold water over eggs until cooled"]], timer: [[2,3,4],[5,6,7],[2,3,4]], timerShowed: [4]
        ),
        Recipe(recipeName: "Scrambled", type: [], tools: ["Stove","Spatula","Non-Stick Pan","Small Bowl","Whisk"], ingredients: [["Egg","1 item"],["Butter","2 tsp"],["Salt","1/4 tsp"],["Pepper","1/4 tsp"]], instruction: [["Crack the eggs into a bowl and add some salt and pepper"],["Gently whisk them until you have a nice frothy liquid"],["Melt butter in non-stick pan over medium heat"],["Pour in egg mixture"],["As the mixture is setting, gently move spatula across pan until there is no more liquid egg in the pan"]], timer: [[3]], timerShowed: [5]
        ),
        Recipe(recipeName: "Fried", type: ["Sunny Side Up", "Over Easy","Over Hard"], tools: ["Stove","Spatula","Non-Stick Pan","Small Bowl"], ingredients: [["Egg","1 item"],["Butter","2 tsp"]], instruction: [["Melt butter in non-stick pan over medium heat"],["Break egg into small bowl and slide into pan"],["Let the egg cook until white is set"],["Flip egg and wait until set"]], timer: [[4],[0,1,2]], timerShowed: [3,4]
        )
    ]
    
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
