import Foundation

protocol UserService {
    func getUser(fullName: String) -> User?
}
