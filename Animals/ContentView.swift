import SwiftUI 

struct ContentView: View {
 
    @StateObject var network = Network()
    
    struct GrowingButton: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(.largeTitle)
                .padding()
                .padding()
                .background(Color.accentColor)
                .foregroundColor(.white)
                .clipShape(Capsule())
                .scaleEffect(configuration.isPressed ? 1.2 : 1)
                .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
        }
    }
    
    func reload() {
       _ = network.checkConnection() 
    } 
    
    let defaults = UserDefaults.standard;
 
    var body: some View {
        ZStack {
             
            if (network.checkConnection()) {
                WebView(url: URL(string: "https://animals.bio?v=\(defaults.integer(forKey:"counter"))")!).onAppear {
                    defaults.set(defaults.integer(forKey:"counter") + 1 , forKey: "counter")
                }
            }
            else {
                VStack {
                    Text("You need internet to play Animals.bio")
                        .font(.largeTitle)
                        .padding()
                        .padding()
                        .multilineTextAlignment(.center)
                    Button("Reload") {
                        reload()
                    }
                    .buttonStyle(GrowingButton())
                    .padding() 
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
