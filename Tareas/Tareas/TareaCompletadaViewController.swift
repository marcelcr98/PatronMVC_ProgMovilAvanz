
import UIKit

class TareaCompletadaViewController: UIViewController {
    
    
    @IBOutlet weak var tareaLabel: UILabel!
    
    var tarea : Tarea? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if tarea!.importante{
            tareaLabel.text = " \(tarea!.nombre!) ❗"
            
        }else {
            tareaLabel.text = tarea!.nombre!
        }
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func completarTarea(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(tarea!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
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
