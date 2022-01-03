import Foundation

class TestUserService: UserService {
    var user: User = User(fullName: "Test", avatar: "avatar_cat", status: "Test Test")
    
    func getUser(fullName: String) -> User? {
        return user
    }
}
