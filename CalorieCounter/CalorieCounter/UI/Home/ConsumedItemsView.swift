import SwiftUI

struct ConsumedItemsView: View {

    var body: some View {
        VStack {
            HStack {
                Text("Consumed items")

                Spacer()
            }

            ForEach(1...5, id: \.self) { _ in
                ConsumedItem()
                    .padding()
                    .background(Color.init("ElementColor"))
                    .cornerRadius(10)
            }
        }
        .padding()
    }

}

struct ConsumedItem: View {

    var body: some View {
        VStack {
            HStack {
                Text("Chocolate")

                Text("21:55")

                Spacer()
            }

            HStack {
                Text("0.0 kcal")

                Spacer()

                Text("-")
            }
        }
    }

}
