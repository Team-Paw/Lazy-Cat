import SwiftUI
struct HamburgerMenuView: View {
    @Binding var isShowing: Bool
    @Binding var selectedTab: Int
    @State private var selectedOption: HamburgerMenuOptionModel?
    var body: some View {
        ZStack {
            if isShowing {
                Rectangle()
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing.toggle()
                    }
                HStack {
                    Spacer()
                    VStack(spacing: 32){
                        HamburgerMenuHeaderView()
                        VStack {
                            ForEach(HamburgerMenuOptionModel.allCases) {
                                option in Button(action: {
                                    onOptionTapped(option)
                                }, label: {
                                    HamburgerMenuRowView(option: option, selectedOption: $selectedOption)
                                })
                            }
                        }
                        Spacer()
                    }
                    .padding()
                    .frame(width: 200, alignment: .center)
                    .background(.white)
                }
                .transition(.move(edge: .trailing))
            }
        }
        .transition(.move(edge: .leading))
        .animation(.easeInOut, value: isShowing)
    }
    private func onOptionTapped(_ option: HamburgerMenuOptionModel) {
        selectedOption = option
        selectedTab = option.rawValue
        isShowing = false
    }
}
#Preview {
    HamburgerMenuView(isShowing: .constant(true), selectedTab: .constant(0))
}
