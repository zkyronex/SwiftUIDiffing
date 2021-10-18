//
//  ContentView.swift
//  Shared
//
//  Created by Jason Chan on 18/10/21.
//

import SwiftUI

//func doGlobalThing() {
//    print("Global")
//}

struct ContentView<Presenter: TestPresenting>: View {

    @ObservedObject var presenter: Presenter

    var body: some View {
        VStack(spacing: 20) {
            FooView(text: presenter.text)
            BarView(text: presenter.randomString, doThing: presenter.actions.doAction)
            Button("Increment") {
                presenter.increment()
            }
            InnocentView()
        }
    }
}

struct FooView: View {
    let text: String

    var body: some View {
        print("foo")
        return Text("Counter is \(text)")
    }
}

struct InnocentView: View {

//    init() {
//        print("This view should be created only once")
//    }

    var body: some View {
        print("innocent")
        return Text("Im innocent")
    }
}

struct BarView: View {
    let text: String
    let doThing: () -> Void

    var body: some View {
        print("barrr")
        return VStack {
            Text("Hello, Bar \(text)")
            Button("Thing Button", action: doThing)
        }
    }
}

protocol TestPresenting: ObservableObject {
    var text: String { get }
    var randomString: String { get }
    func increment()
    func doThing()
    var actions: TestPresenter.Actions { get }
}

class TestPresenter: TestPresenting {

    struct Actions {
        let doAction: () -> Void
    }

    @Published var count: Int = 0
    @Published var randomString = "Random"

    lazy var actions = Actions(doAction: self.doThing)

    var text: String {
        "Foo \(count)"
    }

    func increment() {
        count += 1
    }

    func doThing() {
        print("thing")
    }
}

