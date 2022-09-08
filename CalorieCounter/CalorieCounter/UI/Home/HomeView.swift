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
    }

}

struct GraphView: View {

    var body: some View {
        Rectangle()
            .foregroundColor(.black.opacity(0.8))
            .cornerRadius(10)
    }

}

struct HomeView_Previews: PreviewProvider {

    static var previews: some View {
        HomeView()
    }

}
