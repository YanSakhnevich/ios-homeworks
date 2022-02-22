import Foundation

class MyModel {
    var receiveFromFeedViewModel: FeedViewModelDelegateProtocol?
    

    static let shared = MyModel()

    let password: String = "Password"

    init() {}
    
    func check(gettingPassword: String) -> Bool {
        guard gettingPassword == password else { return false }
      
        return true
    }
}
