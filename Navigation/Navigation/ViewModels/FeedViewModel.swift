import UIKit

class FeedViewModel {
    
    var onStateChanged: ((State) -> Void)?
    weak var feedCoordinator: FeedCoordinator?

    private(set) var state: State = .initial {
        didSet {
            onStateChanged?(state) // сюда модель сообщает о изменении своего состояния
        }
    }
    
    func send(_ action: Action) {//сюда вью посылает сообщения о своих действиях
        switch action {
            
        case .centralButtonTapped:
            feedCoordinator?.pushToPost()
            
        case let .sendTextButtonTapped(textFieldString):
            MyModel.shared.check(gettingPassword: textFieldString)
            
        case .viewIsReady:
            createNotificationCenter()
            state = .initial
        }
    }
}

extension FeedViewModel {
    
    func createNotificationCenter() {
        let myNotificationCenter = NotificationCenter.default
        myNotificationCenter.addObserver(self, selector: #selector(passwordIsRight), name: Notification.Name("checkingPassword"), object: nil)
    }
    
    @objc
    private func passwordIsRight(notification: Notification) {
        guard let check = notification.object as? Bool else { return }
        state = .notificationCenterCreated(check)
    }
}

extension FeedViewModel {
    
    enum Action {
        case centralButtonTapped
        case sendTextButtonTapped(String)
        case viewIsReady
    }
    
    enum State {
        case initial
        case notificationCenterCreated(Bool)
    }
}


