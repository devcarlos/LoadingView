//
//  TasksView.swift
//  LoadingViewExample
//
//  Created by Carlos Alcala on 12/3/20.
//

import SwiftUI

struct TasksView: View {
    @State private var showing = false
    @ObservedObject var taskData: TaskData = TaskData()

    var body: some View {
        VStack {
            LoadingView(isShowing: $showing, tasks: taskData.tasks) {
                NavigationView {
                    List {
                        ForEach(self.taskData.values(), id: \.self) { task in
                            Text(task)
                        }
                    }
                    .onAppear(perform: { self.taskData.load() })
                    .navigationBarTitle(Text("Task List"), displayMode: .large)
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
