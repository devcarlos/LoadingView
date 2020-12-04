//
//  Task.swift
//  LoadingViewExample
//
//  Created by Carlos Alcala on 12/3/20.
//

import Foundation

class Task {

    var parentTask: Task?
    let id: Int

    init(_ id: Int) {
        self.id = id
    }

    func then(_ childTask: Task) -> Task {
        childTask.parentTask = self
        return childTask
    }

    func run() -> Int {
        if let parentTask = parentTask {
            return parentTask.run()
        }

        return id
    }
}

struct TaskManager {
    static func run(tasks: [Task]) -> [Int] {
        var result: [Int] = []
        tasks.forEach {
            result.append($0.run())
        }

        return result
    }
}

//let values = TaskManager.run(tasks: [
//    Task(0),
//    Task(1).then(Task(2)).then(Task(3)),
//    Task(4).then(Task(5))
//])
//
//print(values)
