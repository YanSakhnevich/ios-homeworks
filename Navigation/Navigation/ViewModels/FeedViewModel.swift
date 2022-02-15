import UIKit

protocol FeedViewModelDelegateProtocol {
    func textFieldDidChanged(password: String) -> Bool
}

class FeedViewModel: FeedViewModelDelegateProtocol {
    
    func textFieldDidChanged(password: String) -> Bool {
        MyModel.shared.check(gettingPassword: password)
    }
        
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
            let check = textFieldDidChanged(password: textFieldString)
            state = .passwordIsCompared(check)
            
        case .viewIsReady:
            state = .initial
        }
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
        case passwordIsCompared(Bool)
    }
}


