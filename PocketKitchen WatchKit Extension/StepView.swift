//
//  StepView.swift
//  PocketKitchen WatchKit Extension
//
//  Created by Bagas Setyo Wicaksono on 18/07/22.
//

import SwiftUI

struct StepView: View {
    var optEgg: String
    @State var stepCount: Int = 1
    @State var isDone = false
        
    var body: some View {
        let recipe = recipes[optEgg]!
        let allStepCount = recipe.instruction.count
        
        NavigationView {
            TabView(selection: $stepCount) {
                ForEach(1...allStepCount ,id: \.self) {index in
                    let sth = index
                    let chosen = recipe.instruction[sth-1]
                    ScrollView{
                        Text("**Step \(index)** of \(allStepCount)")
                            .frame(maxHeight: .infinity, alignment: .top)
                        if(optEgg == "Boiled"){
                            if(recipe.timerShowed[sth-1]){
                                TimerView(timeRemaining: recipe.timer[chosenOpt[0]][chosenOpt[1]] * 60)
                                    .padding(.top, 20)
                            }
                        }
                        else if(optEgg == "Scrambled"){
                            if(recipe.timerShowed[sth-1]) {
                                if(recipe.timer[0][0] * 60 > 0){
                                    TimerView(timeRemaining: recipe.timer[0][0] * 60)
                                        .padding(.top, 20)
                                }
                                
                            }
                        }
                        else { //Fried
                            if(sth == 3){
                                if(recipe.timerShowed[sth-1]){
                                    if(recipe.timer[0][0] * 60 > 0) {
                                        TimerView(timeRemaining: recipe.timer[0][0] * 60)
                                            .padding(.top, 20)
                                    }
                                }
                            }else{
                                if(recipe.timerShowed[sth-1]) {
                                    if(recipe.timer[1][chosenOpt[0]] * 60 > 0) {
                                        TimerView(timeRemaining: recipe.timer[1][chosenOpt[0]] * 60)
                                            .padding(.top, 20)
                                    }else{
                                        Text("").padding(.top, 25)
                                    }
                                }
                            }
                        }
                        
                        Text(chosen[0])
                            .bold()
                            .font(.system(size: 13))
                            .multilineTextAlignment(.center)
                            .padding(.top, recipe.timerShowed[sth-1] ? 10 : 35)
                        if(chosen.count == 2){
                            Text(chosen[1])
                                .font(.system(size: 10))
                                .multilineTextAlignment(.center)
                                .padding(.top, 10)
                        }
                        
    //                    if(tips[index-1].count != 0){
    //
    //                    }
                        
                        Button(action: {
                            if stepCount != allStepCount{
                                stepCount += 1
                            }else{
                                isDone = true
                            }
                            
                        }, label: {
                            
                            Text("Next")
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .bottom)
                            
                            .padding(.vertical,10)
                            .padding(.horizontal)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.init(UIColor(rgb: 0xEF921D)))
                                )
                        })
                        .padding(.top, (chosen.count == 2 ? 10 : 40))
                        .padding(.horizontal)
                        .buttonStyle(.plain)
                        

//                        NavigationLink(destination: CelebrationView(), isActive: $isDone){
//                            EmptyView()
//                        }.buttonStyle(.plain)
                        
                    }

                    .tag(index)
                }
                
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
        }.navigationBarBackButtonHidden(true)
            .navigate(to: CelebrationView(optEgg: optEgg), when: $isDone).buttonStyle(.plain)
            

    }
}

struct StepView_Previews: PreviewProvider {
    static var previews: some View {
        StepView(optEgg: "Boiled")
    }
}
