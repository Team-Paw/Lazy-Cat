import SwiftUI


// MARK: - TopBarView
public struct TopBarView: View {
    public var body: some View {
        HStack {
            Text("Lazy Cat")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color(red: 80/255, green: 80/255, blue: 80/255))
                .padding(.leading, 30)
                .padding(.top, 30)
            
            Spacer()
            
            // Hamburger
            VStack(spacing: 4) {
                Rectangle()
                    .frame(width: 24, height: 2)
                    .foregroundColor(.black)
                Rectangle()
                    .frame(width: 24, height: 2)
                    .foregroundColor(.black)
                Rectangle()
                    .frame(width: 24, height: 2)
                    .foregroundColor(.black)
            }
        }
        .frame(width: 393, height: 96)
        .background(Color(red: 241/255, green: 241/255, blue: 241/255))
    }
}

 //MARK: - Preview
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .previewDevice("iPhone 14")
//    }
//}
