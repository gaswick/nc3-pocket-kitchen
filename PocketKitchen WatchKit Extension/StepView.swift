//
//  StepView.swift
//  PocketKitchen WatchKit Extension
//
//  Created by Bagas Setyo Wicaksono on 18/07/22.
//

import SwiftUI
import AVFoundation

struct StepView: View {
    var recipe: Recipe
    var optEgg: String

    @State var stepCount: Int = 1
    @State var isDone = false
    
    //var allStepCount = 0
    @State var utterance = AVSpeechUtterance(string: "")
    
    init(recipe: Recipe, optEgg: String){
        self.optEgg = optEgg
        self.recipe = recipe
    }
    
    var body: some View {

        NavigationView {
            TabView(selection: $stepCount) {
                ForEach(1...recipe.instruction.count ,id: \.self) {index in
                    let sth = index
                    let chosen = recipe.instruction[sth-1]
                    ScrollView{
                        Text("**Step \(index)** of \(recipe.instruction.count)")
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
                            if stepCount != recipe.instruction.count{
                                stepCount += 1
                                print("next \(stepCount)")

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
                        
                    }.tag(index)
                     .onAppear(){
                        print(stepCount)
                        utterance = AVSpeechUtterance(string: recipe.instruction[stepCount-1][0])
                        
                        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                        utterance.rate = 0.4
                        let synthesizer = AVSpeechSynthesizer()
                        synthesizer.speak(utterance)
                     }
                }
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }.navigationBarBackButtonHidden(true)
         .navigate(to: CelebrationView(recipe: recipe), when: $isDone).buttonStyle(.plain)
    }
}

struct StepView_Previews: PreviewProvider {
    static var previews: some View {
        StepView(recipe: RecipeData.recipes["Boiled"]!, optEgg: "Boiled")
    }
}
