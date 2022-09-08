import SwiftUI

struct TabBarView: View {

    var body: some View {
        TabView {
            HomeView()
                .tabItem({ Text("Home")} )

            FavoritesView()
                .tabItem({ Text("Favorites")} )
        }
        .onAppear {
            UITabBar.appearance().backgroundColor = .white
        }
    }

}

struct TabBarView_Previews: PreviewProvider {

    static var previews: some View {
        TabBarView()
    }

}
