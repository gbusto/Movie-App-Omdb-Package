import Alamofire

public class Omdb {
    
    var apiKey: String
    public var movieToSearch: String = ""
    public var reachedLastPage: Bool = false
    private var page: Int = 0
    static private var MAX_RESULTS_PER_SEARCH: Int = 10
    
    public init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    public func reset() {
        movieToSearch = ""
        reachedLastPage = false
        page = 0
    }
    
    public func getNextSearchResults(completion: @escaping (Result<[MovieSearchResult], Error>) -> Void) {
        if reachedLastPage {
            // Don't attempt to pull anymore movies if it appears we've reached the last page
            return
        }
        
        page += 1

        AF.request("https://www.omdbapi.com/?apikey=\(apiKey)&s=\(movieToSearch)&page=\(page)") { urlRequest in
            urlRequest.timeoutInterval = 3
        }
        .responseDecodable(of: MovieSearchRoot.self) { response in
            switch response.result {
            case .success(let searchResults):
                if let results = searchResults.Search {
                    if results.count < Omdb.MAX_RESULTS_PER_SEARCH {
                        self.reachedLastPage = true
                    }
                    completion(.success(results as [MovieSearchResult]))
                }
                else {
                    self.reachedLastPage = true
                    completion(.success([]))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func getMovieDetails(imdbID: String, completion: @escaping (Result<MovieDetailsResult, Error>) -> Void) {
        AF.request("https://www.omdbapi.com/?apikey=\(apiKey)&i=\(imdbID)") { urlRequest in
            urlRequest.timeoutInterval = 3
        }
        .responseDecodable(of: MovieDetailsResult.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result as MovieDetailsResult))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}
