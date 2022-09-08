import Foundation

struct NetworkClient {

    let baseUrl = "https://api.calorieninjas.com/v1/nutrition?query="
    let apiKeyHeader = "X-Api-Key"
    let apiKey = "rB4pVqCmFuAIPKYUunQSmA==qgG9oVfsqrPHsshE"

    func get<Response: Decodable>(path: String) async throws -> Response {
        guard let url = URL(string: "\(baseUrl)\(path)") else {
            throw RequestError.invalidURLError
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(apiKey, forHTTPHeaderField: apiKeyHeader)

        let (data, _) = try await handle(request)

        guard let value = try? JSONDecoder().decode(Response.self, from: data) else {
            throw RequestError.dataCodingError
        }

        return value
    }

    private func handle(_ urlRequest: URLRequest) async throws -> (Data, URLResponse) {
        guard let (data, response) = try? await URLSession.shared.data(for: urlRequest) else {
            throw RequestError.serverError
        }

        if
            let httpResponse = response as? HTTPURLResponse,
            (300...503).contains(httpResponse.statusCode)
        {
            switch httpResponse.statusCode {
            case 401:
                throw RequestError.unauthorisedError
            case 403:
                throw RequestError.forbiddenError
            case 404:
                throw RequestError.notFoundError
            default:
                throw RequestError.serverError
            }
        }

        return (data, response)
    }

}

struct NutritionItems: Codable {

    let items: [NutritionItem]

}

extension NutritionItems {

    static let empty = NutritionItems(items: [])
}

struct NutritionItem: Codable {

    let name: String
    let calories: Float
    let sugar_g: Float
    let fiber_g: Float
    let serving_size_g: Float
    let fat_saturated_g: Float
    let protein_g: Float
    let carbohydrates_total_g: Float
    let fat_total_g: Float
    let sodium_mg: Float
    let potassium_mg: Float
    let cholesterol_mg: Float

}
