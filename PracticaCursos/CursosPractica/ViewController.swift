

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    var cursos:[Cursos] = []
    
    var promedio = 0.0

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cursos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    
        let cell = UITableViewCell()
        
        let curso = cursos[indexPath.row]
        
        promedio = round(((Double(curso.promedioLab)) + (Double(curso.promedioPrac)) + (Double(curso.examenFinal)))/3)
        
        let aprobado = "\(curso.nombre) fue aprobado con: \(promedio) ✔ "
        let desaprobado = "\(curso.nombre) fue desaprobado con: \(promedio) ❌ "
        
        if promedio >= 13 {
            cell.backgroundColor = UIColor.green
            cell.textLabel?.text = "\(aprobado)"
        }else if promedio < 13 {
            cell.backgroundColor = UIColor.red
            cell.textLabel?.text = "\(desaprobado)"
        }else {
            cell.textLabel?.text = "ERROR"
        }
        return cell
    }
    
    

    func crearNotas() -> [Cursos]{
        let curso1 = Cursos()
        curso1.nombre = "Desarrollo de Soluciones en la Nube"
        curso1.promedioPrac = 18.3
        curso1.promedioLab = 20.0
        curso1.examenFinal = 14.0
        
        let curso2 = Cursos()
        curso2.nombre = "Aplicaciones Móviles Multiplataformas"
        curso2.promedioPrac = 16.0
        curso2.promedioLab = 10.5
        curso2.examenFinal = 18.0
        
        let curso3 = Cursos()
        curso3.nombre = "Desarrollo de Aplicaciones Web Avanzadas"
        curso3.promedioPrac = 19.0
        curso3.promedioLab = 11.0
        curso3.examenFinal = 10.5
        
        let curso4 = Cursos()
        curso4.nombre = "Diseño de Proyectos de Innovación"
        curso4.promedioPrac = 18.0
        curso4.promedioLab = 19.0
        curso4.examenFinal = 20.0
        
        let curso5 = Cursos()
        curso5.nombre = "Integración de Sistemas Empresariales"
        curso5.promedioPrac = 20.0
        curso5.promedioLab = 11.0
        curso5.examenFinal = 5.0
        
        let curso6 = Cursos()
        curso6.nombre = "Programación en Móviles Avanzadas"
        curso6.promedioPrac = 18.0
        curso6.promedioLab = 19.0
        curso6.examenFinal = 20.0
        
        return [curso1, curso2, curso3, curso4, curso5, curso6]
    }
    
    @IBAction func agregarTarea(_ sender: Any) {
        performSegue(withIdentifier: "agregarSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let siguienteVC = segue.destination as! CrearNotaViewController
        siguienteVC.anteriorVC = self
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cursos = crearNotas()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.cursos.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
   
    
    
}

