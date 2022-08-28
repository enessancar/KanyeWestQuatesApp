import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var quoteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func randomQuoteButton(_ sender: UIButton) {
        
        let url = URL(string: "https://api.kanye.rest")!
        
        let task = URLSession.shared.dataTask(with: url) { (data: Data?, response : URLResponse?, error : Error?)  in
            
            if let error = error {
                print("Error : \(error)")
                return
            }
            
            let json = try! JSONSerialization.jsonObject(with: data!, options: []) as? [String : String]
            DispatchQueue.main.async {
                self.quoteLabel.text = json?["quote"]
            }
        }
        task.resume()
    }
}
