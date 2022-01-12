import Foundation

class LoginInspector {
    let sharedChecker = CheckerService.shared
}

extension LoginInspector: LogInViewControllerDelegate {
    func checkLoginPasswordAvailability(inputLogin: String, inputPassword: String) -> Bool {
        sharedChecker.checkLoginPasswordExists(loginText: inputLogin, passwordText: inputPassword)
    }
}
