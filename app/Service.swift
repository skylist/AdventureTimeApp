import Foundation
import Alamofire

class Service{
    //Singleton com os dados do serviço
    static let instance = Service()
    
    var url = "https://api.myjson.com/bins/jeu7w"
    
    //Dados do serviço se já tiverem sido reuperados
    var data: [Item] = []
    
    //Metodo usado para recuperar os dados do serviço
    func get(){
        Alamofire.request(self.url).responseJSON { response in
            if let json = response.result.value as? [String:Any]{
                if let results = json["characters"] as? [[String:Any]]{
                    for item in results {
                        self.data.append(Item(fromDictionary: item))
                    }
                }
            }
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "service"), object: true)
        }
    }
}

class Item{
    let name: String
    let fullname: String
    let gender: String
    let species: String
    let image: String
    
    init(fromDictionary dados: [String:Any]){
        name = (dados["name"] as? String) ?? "Erro"
        fullname = (dados["fullname"] as? String) ?? "Erro"
        gender = (dados["gender"] as? String) ?? "Erro"
        species = (dados["species"] as? String) ?? "Erro"
        image = (dados["url"] as? String) ?? "Erro"
    }
}
