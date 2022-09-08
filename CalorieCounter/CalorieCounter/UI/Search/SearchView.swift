import SwiftUI

struct SearchView: View {

    let interactor: SearchInteractorProtocol = SearchInteractor()

    @State var itemInfo: NutritionItems = .empty

    var body: some View {
        VStack {
            SearchBar()
                .onTap {
                    interactor.search(for: $0, at: $itemInfo)
                }

            ForEach(itemInfo.items, id: \.name) { item in
                SearchResult(item: item)
            }
        }
        .padding()
        .background(Color.init("BackgroundColor").ignoresSafeArea())
    }

}

struct SearchResult: View {

    let item: NutritionItem

    var body: some View {
        Text(item.name)
    }

}

struct SearchBar: View {

    let onTap: (String) -> Void

    @State var text: String = ""

    init(_ onTap: @escaping (String) -> Void = { _ in }) {
        self.onTap = onTap
    }

    var body: some View {
        HStack {
            TextField("Search", text: $text)

            Spacer()

            Image(systemName: "magnifyingglass")
                .onTapGesture {
                    onTap(text)
                }
        }
        .padding()
        .background(.gray)
        .cornerRadius(10)
    }

    func onTap(_ onTap: @escaping (String) -> Void) -> SearchBar {
        SearchBar(onTap)
    }

}

struct SearchView_Previews: PreviewProvider {

    static var previews: some View {
        SearchView()
    }

}
