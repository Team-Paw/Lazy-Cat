import SwiftUI


// MARK: - TopBarView
struct TopBarView: View {
    @State private var showMenu = false
    
    init() {
        // NavigationBarAppearance 설정
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground() // 불투명 배경 설정
        appearance.backgroundColor = UIColor(red: 241/255, green: 241/255, blue: 241/255, alpha: 1) // 배경색
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor(red: 80/255, green: 80/255, blue: 80/255, alpha: 1) // 제목 색상 설정
        ]
        
        // UINavigationBar에 Appearance 적용
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        NavigationView { // 화면 상단에 탐색 바(Navigation Bar)를 추가하고, 뷰 간의 탐색 계층 관리 & 계층적 화면 전환 등의 역할
            GeometryReader { geometry in // 뷰의 크기와 위치를 동적으로 계산
                ZStack(alignment: .trailing) {
                    HamburgerMenuView(isShowing: $showMenu) // 햄버거 메뉴
                }
                .navigationTitle("Lazy Cat")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(showMenu ? .hidden : .visible, for: .navigationBar)
                .toolbar { // 햄버거 메뉴 버튼 우측 상단
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            showMenu.toggle()
                        }, label: {
                            Image(systemName: "line.3.horizontal")
                                .tint(.dark)
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    TopBarView()
}

//public struct TopBarView: View {
//    public var body: some View {
//        HStack {
//            Text("Lazy Cat")
//                .font(.system(size: 24, weight: .bold))
//                .foregroundColor(Color(red: 80/255, green: 80/255, blue: 80/255))
//                .padding(.leading, 30)
//                .padding(.top, 30)
//            
//            Spacer()
//            
//            // Hamburger
//            VStack(spacing: 4) {
//                Rectangle()
//                    .frame(width: 24, height: 2)
//                    .foregroundColor(.black)
//                Rectangle()
//                    .frame(width: 24, height: 2)
//                    .foregroundColor(.black)
//                Rectangle()
//                    .frame(width: 24, height: 2)
//                    .foregroundColor(.black)
//            }
//        }
//        .frame(width: 393, height: 96)
//        .background(Color(red: 241/255, green: 241/255, blue: 241/255))
//    }
//}

 //MARK: - Preview
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .previewDevice("iPhone 14")
//    }
//}
