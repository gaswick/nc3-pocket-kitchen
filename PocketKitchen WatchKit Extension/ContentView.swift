//
//  ContentView.swift
//  PocketKitchen WatchKit Extension
//
//  Created by Bagas Setyo Wicaksono on 13/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        StepView(stepCount: 1, allStepCount: 5)
        //EggListView()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
