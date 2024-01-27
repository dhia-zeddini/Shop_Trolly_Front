import SwiftUI

enum BottomBarSelectedTab: Int {
    case home = 0
    case search = 1
    case plus = 2
    case chat = 3
    case profile = 4
}

struct BottomBar: View {
  //  @Environment(\.safeAreaInsets) var safeAreaInsets
    @Environment(\.colorScheme) var colorScheme
    @Binding var selectedTab: BottomBarSelectedTab

    var body: some View {
        HStack(spacing: 10) {
            // Home
            Button {
                selectedTab = .home
            } label: {
                BottomBarButtonView(image: "house.fill", text: "Home", isActive: selectedTab == .home)
            }

            // Search
            Button {
                selectedTab = .search
            } label: {
                BottomBarButtonView(image: "magnifyingglass", text: "Search", isActive: selectedTab == .search)
            }

            // Plus
            Button {
                selectedTab = .plus
            } label: {
                BottomBarButtonView(image: "heart", text: "add", isActive: selectedTab == .plus)
            }

            // Notification
            Button {
                selectedTab = .chat
            } label: {
                BottomBarButtonView(image: "message", text: "Messages", isActive: selectedTab == .chat)
            }

            // Profile
            Button {
                selectedTab = .profile
            } label: {
                BottomBarButtonView(image: "person", text: "Profile", isActive: selectedTab == .profile)
            }
        }
        .frame(height: 40)
       
    }
}

struct BottomBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomBar(selectedTab: .constant(.plus))
    }
}

struct BottomBarButtonView: View {
    var image: String
    var text: String
    var isActive: Bool

    var body: some View {
        HStack(spacing: 10){
            GeometryReader{
                geo in
                VStack{
                    ZStack{
                        VStack(spacing: 3){
                            RoundedRectangle(cornerRadius: 30)
                                .frame(width: 70,height: 80)
                                .foregroundColor(isActive ? Color(hex: "#152354") : .clear)
                            
                        }
                        VStack(spacing: 2){
                            Image(systemName: image)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                            Text(isActive ?"":text)
                                .font(.caption)
                                .foregroundColor(isActive ? Color(hex: "#152354") : .white)
                        }
                    }
                    .padding(.top,-5 )
                    .padding(EdgeInsets(top: (isActive ? -23 : 0), leading: 0, bottom: 0, trailing: 0))
                    Spacer()
                    
                }
            }
        }
    }
}
