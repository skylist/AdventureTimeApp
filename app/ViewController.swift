
import UIKit
import Kingfisher

class ViewController: UIViewController {

    var item: Item?
    
    @IBOutlet weak var fullname: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var species: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let unwrapedItem = item {
            fullname.text = unwrapedItem.fullname
            gender.text = unwrapedItem.gender
            species.text = unwrapedItem.species
            
            if let url = URL(string: unwrapedItem.image){
                image.kf.indicatorType = .activity
                image.kf.setImage(with: url)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
