protocol NutritionRepositoryProtocol {

    func fetchNutrition(for query: String) async throws -> NutritionItems

}

struct NutritionRepository: NutritionRepositoryProtocol {

    let networkDataSource: NutritionNetworkDataSourceProtocol = NutritionNetworkDataSource()

    func fetchNutrition(for query: String) async throws -> NutritionItems {
        try await networkDataSource.fetchNutrition(for: query)
    }
}
