//
//  TasksView.swift
//  LoadingViewExample
//
//  Created by Carlos Alcala on 12/3/20.
//

import SwiftUI

struct TasksView: View {
    let tasks = [
        Task(0),
        Task(1).then(Task(2)).then(Task(3)),
        Task(4).then(Task(5))
    ]

    @State private var showing = false

    var body: some View {
        VStack {
            LoadingView(isShowing: $showing) {
                NavigationView {
                    List(["1", "2", "3", "4", "5"], id: \.self) { row in
                        Text(row)
                    }.navigationBarTitle(Text("Task List"), displayMode: .large)
                }
            }

            Button(action: {
                self.showing.toggle()
            }) {
                Text("Load Tasks")
                    .fontWeight(.bold)
                    .font(.title2)
                    .padding(EdgeInsets(top: 20, leading: 30, bottom: 20, trailing: 30))
                    .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(40)
                    .foregroundColor(.white)
                    .padding(10)
            }
        }
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
