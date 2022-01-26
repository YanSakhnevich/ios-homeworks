import Foundation

class MyModel {

    static let shared = MyModel()

    let password: String = "Password"
    var gettingPassword: String = ""

    init() {}

    func check() {
        
        if gettingPassword == password {
            let myNotificationCenter = NotificationCenter.default
            myNotificationCenter.post(name: Notification.Name("passwordIsRight"), object: nil)
            print("passwordIsRight")
        } else {
            let myNotificationCenter = NotificationCenter.default
            myNotificationCenter.post(name: Notification.Name("passwordIsNotRight"), object: nil)
            print("passwordIsNotRight")
        }
    }
}
