protocol NutritionNetworkClientProtocol {

    func fetchNutrition(for query: String) async throws -> NutritionItems

}

struct NutritionNetworkClient: NutritionNetworkClientProtocol {

    let networkClient = NetworkClient()

    func fetchNutrition(for query: String) async throws -> NutritionItems {
        try await networkClient.get(path: query.replacingOccurrences(of: " ", with: "+"))
    }

}
