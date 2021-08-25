//
//  ContactViewModel.swift
//  Spaceship Clone
//
//  Created by Joseph Chung on 1/8/21.
//


import Foundation
import FirebaseFirestore
import Firebase
import FirebaseDatabase



struct UniverseData: Codable, Identifiable {
    var id: String
    var price: CGFloat
    var date: Date
}

struct ProfileData: Codable, Identifiable {
    var id: String
    var firstname: String
    var surname: String
    var balance: String
}



class UniverseViewModel: ObservableObject {
    @Published var unidata = [UniverseData]()
    
   
    
    private let db = Firestore.firestore()
    private let user = Auth.auth().currentUser
    private var listenerRegistration: ListenerRegistration?
    
    func fetchData() {
        db.collection("unidata").addSnapshotListener { (QuerySnapshot, error) in
            guard let documents = QuerySnapshot?.documents else {
                print("No documents")
                return
            }
            
            
            self.unidata = documents.map({docSnapshot -> UniverseData in
                let data = docSnapshot.data()
                let docId = docSnapshot.documentID
                
                let date = data["date"] as? Date ?? Date()
                let price = data["price"] as? CGFloat ?? CGFloat()
                return UniverseData(id: docId, price: price, date: date)
            })
    
        }
            
        
    }
}

class AppViewModel: ObservableObject {
    
    let auth = Auth.auth()
    let userID = Auth.auth().currentUser?.uid
    private let database = Database.database().reference()
    private let db = Firestore.firestore()
    
    
    @Published var prodata = [ProfileData]()
    @Published var signedIn = false
    
    var isSSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    func signUp(email: String, password: String, firstname: String, surname: String, balance: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.signedIn = true
                self?.addNewEntry(id: self!.auth.currentUser!.uid, firstname: firstname, surname: surname, balance: balance)
                
            }
            
            
            
            //ref.child("users").child(result!.user.uid).setValue(userData)
            
            
        }
       
    }
    
    
    func fetchData() {
        database.child(userID!).observeSingleEvent(of: .value, with: { snapshot in
            
            let value = snapshot.value as? [String: Any]
            
            let id = value?["id"] as? String ?? ""
            let firstname = value?["firstname"] as? String ?? ""
            let surname = value?["surname"] as? String ?? ""
            let balance = value?["balance"] as? String ?? ""
            
            
                
            self.prodata = [ ProfileData(id: id, firstname: firstname, surname: surname, balance: balance) ]
            print(self.prodata.count)

        })
        
    }
 
    

    
    func addNewEntry(id: String, firstname: String, surname: String, balance: String) {
        let userData: [String: Any] = [
            "firstname": firstname as NSObject,
            "id": id,
            "surname": surname,
            "balance": balance
        ]
        database.child(id).setValue(userData)
    }
    
    
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
    }

    
}






/*
class ContactViewModel: ObservableObject {
    
    @Published var unidata = [UniversePortfolioData]()
    
    private var database = Firestore.firestore()
    
    func fetchData() {
        db.collection("unidata").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.unidata = documents.map { (queryDocumentSnapshot) -> UniversePortfolioData in
                let data = queryDocumentSnapshot.data()
                let price = data["price"] as? CGFloat ?? CGFloat()
                return UniversePortfolioData(price: price)
            }
        }
    }
 
    /*
    func addData(name: String) {
           do {
               _ = try db.collection("unidata").addDocument(data: ["price": price])
           }
           catch {
               print(error.localizedDescription)
           }
       }
    */
    
}

*/
