//
//  CloudFunctionsView.swift
//  CloudFunctionsSwiftUI
//
//  Created by Kevinho Morales on 6/9/25.
//

import SwiftUI

struct CloudFunctionsView: View {
    @StateObject private var viewModel = CloudFunctionsViewModel()
    @State private var name: String = ""

    var body: some View {
        VStack(spacing: 20) {
            TextField("Escribe tu nombre", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Llamar Cloud Function") {
                viewModel.callHelloWorld(name: name)
            }
            .buttonStyle(.borderedProminent)

            Text(viewModel.response)
                .padding()
        }
        .padding()
    }
}

#Preview {
    CloudFunctionsView()
}
