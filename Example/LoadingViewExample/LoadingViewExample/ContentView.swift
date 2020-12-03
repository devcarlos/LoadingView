//
//  ContentView.swift
//  LoadingViewExample
//
//  Created by Carlos Alcala on 12/3/20.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        LoadingView(isShowing: .constant(true)) {
            NavigationView {
                List(["1", "2", "3", "4", "5"], id: \.self) { row in
                    Text(row)
                }.navigationBarTitle(Text("Task List"), displayMode: .large)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
