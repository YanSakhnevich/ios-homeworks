import Foundation

class MyModel {

    static let shared = MyModel()

    let password: String = "Password"

    init() {}
    
    func check(gettingPassword: String) {
        let myNotificationCenter = NotificationCenter.default
        myNotificationCenter.post(name: Notification.Name("checkingPassword"), object: gettingPassword == password)
    }
}
