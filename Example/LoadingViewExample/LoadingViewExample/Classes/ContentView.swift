//
//  ContentView.swift
//  LoadingViewExample
//
//  Created by Carlos Alcala on 12/3/20.
//

import SwiftUI

struct ContentView: View {
    @State private var showTasks = false

    var body: some View {
        VStack {
            Button(action: {
                self.showTasks.toggle()
            }) {
                Text("Show Tasks")
            }

            if showTasks {
                TasksView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
