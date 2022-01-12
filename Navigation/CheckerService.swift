import Foundation

protocol CheckerServiceProtocol {
    func checkLoginPasswordExists(loginText: String, passwordText: String) -> Bool
}

class CheckerService: CheckerServiceProtocol {
    static let shared = CheckerService()
    
    private let login = "Yan"
    private let password = "Kazan"
    
    private init() {}
    
    func checkLoginPasswordExists(loginText: String, passwordText: String) -> Bool {
        guard login.hash == loginText.hash, password.hash == passwordText.hash else { return false }
        
        return true
    }
}

