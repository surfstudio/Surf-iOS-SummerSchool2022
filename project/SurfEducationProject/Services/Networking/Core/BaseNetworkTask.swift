//
//  BaseNetworkTask.swift
//  SurfEducationProject
//
//  Created by Князьков Илья on 08.08.2022.
//

import Foundation


struct BaseNetworkTask<AbstractInput: Encodable, AbstractOutput: Decodable>: NetworkTask {

    // MARK: - NetworkTask

    typealias Input = AbstractInput
    typealias Output = AbstractOutput

    var baseURL: URL? {
        URL(string: "https://pictures.chronicker.fun/api")
    }

    let path: String
    let method: NetworkMethod
    let session: URLSession = URLSession(configuration: .default)
    let isNeedInjectToken: Bool

    var tokenStorage: TokenStorage {
        BaseTokenStorage()
    }

    // MARK: - Initializtion

    init(inNeedInjectToken: Bool, method: NetworkMethod, path: String) {
        self.isNeedInjectToken = inNeedInjectToken
        self.path = path
        self.method = method
    }

    // MARK: - NetworkTask

    func performRequest(
        input: AbstractInput,
        _ onResponseWasReceived: @escaping (_ result: Result<AbstractOutput, Error>) -> Void
    ) {
        do {
            let request = try getRequest(with: input)
            session.dataTask(with: request) { data, response, error in
                if let error = error {
                    onResponseWasReceived(.failure(error))
                } else if let data = data {
                    do {
                        let mappedModel = try JSONDecoder().decode(AbstractOutput.self, from: data)
                        onResponseWasReceived(.success(mappedModel))
                    } catch {
                        onResponseWasReceived(.failure(error))
                    }
                } else {
                    onResponseWasReceived(.failure(NetworkTaskError.unknownError))
                }
            }
            .resume()
        } catch {
            onResponseWasReceived(.failure(error))
        }
    }

}

// MARK: - EmptyModel

extension BaseNetworkTask where Input == EmptyModel {

    func performRequest(_ onResponseWasReceived: @escaping (_ result: Result<AbstractOutput, Error>) -> Void) {
        performRequest(input: EmptyModel(), onResponseWasReceived)
    }

}

// MARK: - Private Methods

private extension BaseNetworkTask {

    enum NetworkTaskError: Error {
        case unknownError
        case urlWasNotFound
        case urlComponentWasNotCreated
        case parametersIsNotValidJsonObject
    }

    func getRequest(with parameters: AbstractInput) throws -> URLRequest {
        guard let url = completedURL else {
            throw NetworkTaskError.urlWasNotFound
        }

        var request: URLRequest
        switch method {
        case .get:
            let newUrl = try getUrlWithQueryParameters(for: url, parameters: parameters)
            request = URLRequest(url: newUrl)
        case .post:
            request = URLRequest(url: url)
            request.httpBody = try getParametersForBody(from: parameters)
        }
        request.httpMethod = method.method

        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        if isNeedInjectToken {
            request.addValue("Token \(try tokenStorage.getToken().token)", forHTTPHeaderField: "Authorization")
        }

        return request
    }

    func getParametersForBody(from encodableParameters: AbstractInput) throws -> Data {
        return try JSONEncoder().encode(encodableParameters)
    }

    func getUrlWithQueryParameters(for url: URL, parameters: AbstractInput) throws -> URL {
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            throw NetworkTaskError.urlComponentWasNotCreated
        }

        let parametersInDataRepresentation = try JSONEncoder().encode(parameters)
        let parametersInDictionaryRepresentation = try JSONSerialization.jsonObject(with: parametersInDataRepresentation)

        guard let parametersInDictionaryRepresentation = parametersInDictionaryRepresentation as? [String: Any] else {
            throw NetworkTaskError.parametersIsNotValidJsonObject
        }

        let queryItems = parametersInDictionaryRepresentation.map { key, value in
            return URLQueryItem(name: key, value: "\(value)")
        }

        if !queryItems.isEmpty {
            urlComponents.queryItems = queryItems
        }

        guard let newUrlWithQuery = urlComponents.url else {
            throw NetworkTaskError.urlWasNotFound
        }

        return newUrlWithQuery
    }

}
