# SwiftUIDiffing
Small Diffing test for a SwiftUI View and its ObservedObject

SwiftUI workings
- all view inits will always get called because structs will be recreated when @ObservedObject publishes any changes
- but the body of the view will not all be called necessarily because of the diffing in SwiftUI
- this diffing is based of id of all views and the data they depend on

Problem:
- Using an interface causes closures to be treated as new references
- Alternative ways tried: global closure, wrapper constant within Presenter

Steps to follow:
1. Assert init in InnocentView only fires once
2. Assert FooView's body gets called everytime you tap 'increment' (prints 'foo' and Text is updated with new count)
3. Assert BarView's body is called when you pass presenter.doThing() closure in directly
4. Assert BarView's body does not get called when you pass the TestPresenter in directly as a concrete Type (without generic protocol constraint TestPresenting)
5. Assert BarView's body does not get called when you replace presenter.doThing() with presenter.actions.doAction which internally calls doThing() 
