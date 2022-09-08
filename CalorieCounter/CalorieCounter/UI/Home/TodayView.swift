import SwiftUI

struct TodayView: View {

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Today")

                Spacer()
            }


            ConsumedView()
                .background(.black.opacity(0.8))
                .cornerRadius(10)

            NutrientsView()
        }
        .padding()
    }

}

struct ConsumedView: View {

    var body: some View {
        HStack {
            VStack {
                Text("Consumed")

                Text("0/0 kcal")
            }

            Spacer()

            Circle()
                .trim(from: 0, to: 0.5)
                .stroke(lineWidth: 5)
                .frame(width: 80, height: 80)
        }
        .padding()
    }

}

struct NutrientsView: View {

    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(0...5, id: \.self) { _ in
                    NutrientsCell()
                        .padding()
                        .background(.black.opacity(0.8))
                        .cornerRadius(10)
                }
            }
        }
    }

}

struct NutrientsCell: View {

    var body: some View {
        VStack {
            Text("Sugar")

            Circle()
                .trim(from: 0, to: 1)
                .stroke(lineWidth: 5)
                .frame(width: 60, height: 60)
        }
    }

}
