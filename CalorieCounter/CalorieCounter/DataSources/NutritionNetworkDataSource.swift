protocol NutritionNetworkDataSourceProtocol {

    func fetchNutrition(for query: String) async throws -> NutritionItems

}

struct NutritionNetworkDataSource: NutritionNetworkDataSourceProtocol {

    let networkClient: NutritionNetworkClientProtocol = NutritionNetworkClient()

    func fetchNutrition(for query: String) async throws -> NutritionItems {
        try await networkClient.fetchNutrition(for: query.replacingOccurrences(of: " ", with: "+"))
    }

}
