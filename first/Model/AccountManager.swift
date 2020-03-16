

import Foundation

class AccountManager {
    static let shared = AccountManager()
    
    private init() {}
    
    
    func setCurrentToken(token: String) {
        UserDefaults.standard.set(token, forKey: "userToken")
    }
    
    func isUserLoggedIN() -> Bool {
        return ((UserDefaults.standard.object(forKey: "userToken") as? String) != nil)
    }
    
    func loggedUserToken() -> String {
        let str = UserDefaults.standard.object(forKey: "userToken") as? String
        return str == nil ? "" : str!
    }
    
    func logout() {
        UserDefaults.standard.set(nil, forKey: "userToken")
    }
}
