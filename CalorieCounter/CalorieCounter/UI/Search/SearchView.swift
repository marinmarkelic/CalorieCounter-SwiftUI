import SwiftUI

struct SearchView: View {

    @State var text: String = ""

    var body: some View {
        VStack {
            SearchBar(text: $text)
        }
        .padding()
        .background(Color.init("BackgroundColor").ignoresSafeArea())
    }

}

struct SearchBar: View {

    @Binding var text: String

    var body: some View {
        HStack {
            TextField("Search", text: $text)

            Spacer()

            Image(systemName: "magnifyingglass")
        }
        .padding()
        .background(.gray)
        .cornerRadius(10)
    }

}

struct SearchView_Previews: PreviewProvider {

    static var previews: some View {
        SearchView()
    }

}
