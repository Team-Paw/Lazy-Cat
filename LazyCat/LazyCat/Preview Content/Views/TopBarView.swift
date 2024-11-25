import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            // TopBarView를 상단에 고정
            TopBarView()
                .frame(height: 110)
                .edgesIgnoringSafeArea(.top) // 상단에 딱 맞도록 설정
            Spacer()
            
        }
    }
}

// MARK: - TopBarView
struct TopBarView: View {
    var body: some View {
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
            .padding(.trailing, 25)
            .padding(.top, 30)
        }
        .frame(width: 393, height: 96)
        .background(Color(red: 241/255, green: 241/255, blue: 241/255))
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 14")
    }
}
