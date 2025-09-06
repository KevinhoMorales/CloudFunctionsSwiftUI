//
//  CloudFunctionsViewModel.swift
//  CloudFunctionsSwiftUI
//
//  Created by Kevinho Morales on 6/9/25.
//

import SwiftUI
import FirebaseFunctions

@MainActor
class CloudFunctionsViewModel: ObservableObject {
    @Published var response: String = ""
    private lazy var functions = Functions.functions()

    func callHelloWorld(name: String) {
        let callable = functions.httpsCallable("helloWorld")
        callable.call(["name": name]) { result, error in
            if let error = error {
                self.response = "Error: \(error.localizedDescription)"
                return
            }
            if let data = result?.data as? [String: Any],
               let message = data["message"] as? String {
                self.response = message
            } else {
                self.response = "Respuesta inválida"
            }
        }
    }
}
