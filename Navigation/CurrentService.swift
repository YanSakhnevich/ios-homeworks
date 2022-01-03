import Foundation

class CurrentService: UserService {
    var user: User
    
    init(user: User) {
        self.user = user
    }

    func getUser(fullName: String) -> User? {
        guard user.fullName == fullName else { return nil }
        return user
    }
    
}
