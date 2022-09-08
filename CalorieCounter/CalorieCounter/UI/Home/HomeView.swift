import SwiftUI

struct HomeView: View {

    var body: some View {
        ScrollView {
            VStack {
                GraphView()
                    .frame(width: nil, height: 400)
                    .padding()

                TodayView()

                ConsumedItemsView()
            }
        }
        .background(Color.init("BackgroundColor").ignoresSafeArea(.all, edges: .top))
    }

}

struct GraphView: View {

    var body: some View {
        Rectangle()
            .foregroundColor(Color.init("ElementColor"))
            .cornerRadius(10)
    }

}

struct HomeView_Previews: PreviewProvider {

    static var previews: some View {
        HomeView()
    }

}
