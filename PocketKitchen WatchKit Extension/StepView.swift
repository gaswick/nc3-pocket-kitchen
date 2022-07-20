//
//  StepView.swift
//  PocketKitchen WatchKit Extension
//
//  Created by Bagas Setyo Wicaksono on 18/07/22.
//

import SwiftUI

struct StepView: View {
    var optEgg: String
    @State var stepCount: Int
//    @State var isSearching = false
    var allStepCount: Int 
    var steps: [String] = [
    "Place your eggs in a single layer on the bottom of your pot and cover with cold water",
    "Cover and bring to a boil",
    "Over high heat, bring your eggs to rolling boil",
    "Remove from heat and let stand in water",
    "Drain water and run cold water over eggs until cooled"
    ]
    
    var tips: [String] = [
        "The water should be about an inch or so higher than the eggs",
        "",
        "The water should be about an inch or so higher than the eggs",
        "",
        "The water should be about an inch or so higher than the eggs",
    ]
    
    var body: some View {
        NavigationView {
            TabView(selection: $stepCount) {
                ForEach(1...allStepCount ,id: \.self) {index in
                    let sth = index
                    ScrollView{
                        Text("**Step \(index)** of \(allStepCount)")
                            .frame(maxHeight: .infinity, alignment: .top)
                        Text(steps[index-1])
                            .bold()
                            .font(.system(size: 13))
                            .multilineTextAlignment(.center)
                            .padding(.top, 35)
                        Text(tips[index-1])
                            .font(.system(size: 10))
                            .multilineTextAlignment(.center)
                            .padding(.top, (tips[index-1].count != 0 ? 10 : 0))
    //                    if(tips[index-1].count != 0){
    //
    //                    }
                                        
                        Button(action: {
                            if stepCount != allStepCount{
                                stepCount += 1
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
                        .padding(.top, (tips[sth-1].count != 0 ? 10 : 40))
                        .padding(.horizontal)
                        .buttonStyle(.plain)
    //                    .frame(height: .infinity, alignment: .bottom)
                            
                    }
    //                .gesture(nil)
                    .tag(index)
                }
                
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never
                                       ))
        }.navigationBarBackButtonHidden(true)
    }
}

struct StepView_Previews: PreviewProvider {
    static var previews: some View {
        StepView(optEgg: "Boiled", stepCount: 1, allStepCount: 5)
    }
}
