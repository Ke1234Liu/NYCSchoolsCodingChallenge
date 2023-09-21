//
//  NYCSchoolViewModel.swift
//  NYCSchoolCodeChallenge
//
//  Created by Ke Liu on 9/21/23.
//

import Foundation
protocol NYCSchoolViewModelActions{
    func fetchSchoolInfo(_ urlString: String) async
    func fetchSAT(_ urlString: String) async
}

@MainActor
class NYCSchoolViewModel: ObservableObject {
    @Published var nycSchoolResponse: [NYCSchool] = []
    @Published var satInfoResponse: [SATInfo] = []
    @Published var error: APIError?
    
    var manager: APIProtocol
    init(manager: APIProtocol) {
        self.manager = manager
    }
    
    private func handleErros(error:Error){
        print(error.localizedDescription)
        switch error {
        case is DecodingError:
            self.error = APIError.dataProcessingFailed(details: error.localizedDescription)
        case is URLError:
            self.error = APIError.invalidRequest
        case APIError.networkError(_):
            self.error = APIError.networkError("Some Network Error")
        case APIError.serverError(let value):
            self.error = APIError.serverError(value)
        default:
            self.error = APIError.networkError("We failed to get data from API")
        }
    }
    
}
extension NYCSchoolViewModel:NYCSchoolViewModelActions{
    func fetchSchoolInfo(_ urlString: String) async {
        guard let url = URL(string: urlString) else {
            self.error = APIError.invalidRequest
            return
        }
        do {
            let schoolInfoData = try await manager.get(apiURL: url, type: [NYCSchool].self)
            self.nycSchoolResponse = schoolInfoData
            print(self.nycSchoolResponse )
        } catch let error {
            handleErros(error: error)
        }
        
    }
    
    func fetchSAT(_ urlString: String) async {
        guard let url = URL(string: urlString) else {
            self.error = APIError.invalidRequest
            return
        }
        do {
            let satData = try await manager.get(apiURL: url, type: [SATInfo].self)
            self.satInfoResponse = satData
            print(self.satInfoResponse )
        } catch let error {
            handleErros(error: error)
        }
        
    }
    
}
