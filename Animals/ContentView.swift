import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            WebView(url: URL(string: "https://animals.bio")!)
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
