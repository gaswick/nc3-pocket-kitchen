import SwiftUI

struct ContentView: View {
    
//    public var recipes: [String: Recipe] = [

//        "Boiled":Recipe(type: ["Soft", "Medium", "Hard"], size: ["Medium","Large","X-Large"], tools: ["Stove","Saucepan"], ingredients: [["Egg","1 item"],["Cold Water",""]], instruction: [["Place your eggs in a single layer on the bottom of your pot and cover with cold water","The water should be about an inch or so higher than the eggs"],["Cover and bring to a boil"],["Over high heat, bring your eggs to rolling boil"],["Remove from heat and let stand in water"],["Drain water and run cold water over eggs until cooled"]], timer: [[2,3,4],[5,6,7],[10,12,14]], timerShowed: [false,false,false,true,false], skill: "boiling"
//        ),
//        "Scrambled":Recipe(tools: ["Stove","Spatula","Non-Stick Pan","Small Bowl","Whisk"], ingredients: [["Egg","1 item"],["Butter","2 tsp"],["Salt","1/4 tsp"],["Pepper","1/4 tsp"]], instruction: [["Crack the eggs into a bowl and add some salt and pepper"],["Gently whisk them until you have a nice frothy liquid"],["Melt butter in non-stick pan over medium heat"],["Pour in egg mixture"],["As the mixture is setting, gently move spatula across pan until there is no more liquid egg in the pan"]], timer: [[3]], timerShowed: [false,false,false,false,true], skill: "scrambling"
//        ),
//        "Fried":Recipe(type: ["Sunny Side Up", "Over Easy","Over Hard"], tools: ["Stove","Spatula","Non-Stick Pan","Small Bowl"], ingredients: [["Egg","1 item"],["Butter","2 tsp"]], instruction: [["Melt butter in non-stick pan over medium heat"],["Break egg into small bowl and slide into pan"],["Let the egg cook until white is set"],["Flip egg and wait until set"]], timer: [[4],[0,1,2]], timerShowed: [false,false,true,true], skill: "frying"
//        ),
//    ]
    
    public var chosenOpt: [Int] = []

    var body: some View {
        EggListView()
    }
    
}




// Egg List View
// Tools Prep View
// Ingredients Prep View
// Egg Opt View
// CountDown View
// StepView && TimerView && TODO: Action View
// Celebration View

