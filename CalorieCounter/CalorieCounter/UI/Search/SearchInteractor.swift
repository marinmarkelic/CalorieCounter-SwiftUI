import Combine
import SwiftUI

protocol SearchInteractorProtocol {

    func search(for text: String, at binding: Binding<NutritionItems>)

}

struct SearchInteractor: SearchInteractorProtocol {

    let repository: NutritionRepositoryProtocol = NutritionRepository()

    func search(for text: String, at binding: Binding<NutritionItems>) {
        Task {
            do {
                let res = try await repository.fetchNutrition(for: text)
                binding.projectedValue.wrappedValue = res
            } catch _ {
                throw RequestError.serverError
            }
        }
    }

}
