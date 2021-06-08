//
//  dashboardViewController.swift
//  PuntoBlanco_v_0.0.1
//
//  Created by Andrea Ramirez on 10/18/20.
//

import UIKit
import FirebaseFirestore
import Firebase




class dashboardViewController: UIViewController, protocoloModificarPerfil, UIPopoverPresentationControllerDelegate, UICollectionViewDataSource,UICollectionViewDelegate{
    
    //conexciones con storyboard para dar aspecto redondo a pantalla
    @IBOutlet weak var btMeditacion: UIButton!
    @IBOutlet weak var btHistorial: UIButton!
    @IBOutlet weak var btEstadisticas: UIButton!
    
    @IBOutlet weak var btRetos: UIButton!
    
    var userReference : DatabaseReference!
    var user : Usuario = Usuario(idUsuario: 1, nombre: "Sebastian Diaz", correo: "sebastian@gmail.com", contrasena: "sebastian1234", imagenPerfil: UIImage(named: "foto"))
    @IBOutlet weak var logOut: UIButton!
    @IBOutlet weak var lbNombreUsuario: UILabel!
    @IBOutlet weak var imagenPerfilUsuario: UIImageView!
    @IBOutlet weak var lbSaludoNombre: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var index:Int = 0
    var listaEventos : [Evento] = []
    var listaNotificaciones : [Notificacion] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btMeditacion.layer.borderWidth = 1
        btMeditacion.layer.cornerRadius = 10
        
        btHistorial.layer.borderWidth = 1
        btHistorial.layer.cornerRadius = 10
        
        btEstadisticas.layer.borderWidth = 1
        btEstadisticas.layer.cornerRadius = 10
        
        btRetos.layer.borderWidth = 1
        btRetos.layer.cornerRadius = 10
        
        imagenPerfilUsuario.layer.cornerRadius = 15
        imagenPerfilUsuario.clipsToBounds = true
        
        lbNombreUsuario.layer.cornerRadius = 5
        lbNombreUsuario.clipsToBounds = true
        let db = Firestore.firestore()
        db.collection("Notificaciones").getDocuments(){
            (QuerySnapshot,err) in
            if let err = err{
                print("error obteniendo documentos")
            }else{
                for document in QuerySnapshot!.documents{
                    let title = document.data()["title"] as! String
                    let fecha = document.data()["fecha"] as! Timestamp
                    let desc = document.data()["descripcion"] as! String
                    let TTL = document.data()["lifetime"] as! Int
                    
                    var deleteDate = fecha.dateValue()
                    deleteDate += (86400 * Double(TTL))
                    
                    var aDate = fecha.dateValue()
                    if (deleteDate > aDate && Date() >= aDate){
                        let formatter = DateFormatter()
                        formatter.dateFormat = "MMM d, h:mm a"
                        
                        let formattedTimeZoneStr = formatter.string(from: aDate)
                        let newDate = Notificacion(fecha: formattedTimeZoneStr, title: title, desc: desc, sortDate: aDate)
                        
                        self.listaNotificaciones.append(newDate)
                    }
                }
            }
        }
        db.collection("Eventos").getDocuments(){
            (QuerySnapshot,err) in
            if let err = err{
                print("error obteniendo documentos")
            }else{
                var count = 0
                for document in QuerySnapshot!.documents{
                    let date = NSDate()
                    let unixtime = date.timeIntervalSince1970
                    
                    
                    let nombre = document.data()["nombre"]! as! String
                    let desc = document.data()["descripcion"]! as! String
                    let fecha = document.data()["fecha"]! as! Timestamp
                    var lugar = document.data()["place"]! as? String
                    let imgUrl = document.data()["imgFile"] as? String
                    let fechaDelete = document.data()["fecha_delete"] as! Timestamp
                    let deleteDate = fechaDelete.dateValue()
                    let aDate = fecha.dateValue()
                    let formatter = DateFormatter()
                    formatter.dateFormat = "MMM d, h:mm a"
                    let formattedTimeZoneStr = formatter.string(from: aDate)
                    
                    let dateNow = Date()
                    if dateNow <= deleteDate{
                        var urlToUiImage = (UIImage(named: "meditacion_4"))
                        
                        if let imgVerification = imgUrl{
                            print("img",imgUrl)
                            let url = URL(string: imgUrl!)
                            if let data = try? Data(contentsOf: url!){
                                let newImage: UIImage = UIImage(data: data)!
                                urlToUiImage = newImage
                            }
                    }
                        
                        //print(formattedTimeZoneStr)
                        let newEvento = Evento(nombreEvento: nombre, idEvento: count,imagen: urlToUiImage!, fecha: formattedTimeZoneStr, descripcion: desc, lugar: lugar ?? "No Especificado",isRegistered: false, sortingDate: aDate)
                        self.listaEventos.append(newEvento)
                    }
                }
            }
            self.listaEventos.sort{
                $0.sortingDate < $1.sortingDate
            }
            self.collectionView.reloadData()
        }
        
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        // Do any additional setup after loading the view.
        lbNombreUsuario.text = user.nombre
        imagenPerfilUsuario.image = user.imagenPerfil
        lbSaludoNombre.text = user.nombre
        self.navigationController?.navigationBar.layer.cornerRadius = 20
        self.navigationController?.navigationBar.clipsToBounds = true
        self.navigationController?.navigationBar.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.258241415, green: 0.7050990462, blue: 0.6889674664, alpha: 1)
        
        self.navigationController?.navigationBar.tintColor = .white
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
        
    }
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    @IBAction func logOut(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    // MARK: - Table view data source
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if listaEventos.count > 5{
            return 5
        }
        return listaEventos.count
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventCell", for: indexPath) as! EventCollectionViewCell
        cell.eventImage?.image = listaEventos[indexPath.row].imagen
        cell.NombreEvento.text = listaEventos[indexPath.row].nombreEvento
        cell.NombreEvento.numberOfLines = 0
        cell.NombreEvento.lineBreakMode = .byWordWrapping
        cell.NombreEvento.font = cell.NombreEvento.font.withSize(15)
        cell.NombreEvento.sizeToFit()
        cell.eventImage?.layer.cornerRadius = cell.eventImage.frame.size.width / 5
        cell.eventImage?.clipsToBounds = true
        cell.eventImage.alpha = 0.5
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("clicked")
        print(indexPath.row)
        index = indexPath.row
        self.performSegue(withIdentifier: "eventoProx", sender: self)
//        let vc = storyboard?.instantiateViewController(identifier: "ViewControllerEventosInfo") as! ViewControllerEventosInfo
//
//        print(vc.unEvento)
//        vc.unEvento = listaEventos[indexPath.row]
//        vc.userReference = userReference
        //self.navigationController?.pushViewController(vc, animated: true)
        
    }

    
    // MARK: - Navigation
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "eventoProx"{
            
        }
        return true
    }
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "configurar"{
            let vistaConf = segue.destination as! ConfiguracionViewController
            vistaConf.unUsuario = user
            vistaConf.userReference = userReference
        }
        else if segue.identifier == "notificacion"{
            let vistaNotificacion = segue.destination as! ViewControllerNotificacion
            vistaNotificacion.popoverPresentationController!.delegate = self
            vistaNotificacion.listaNotificaciones = listaNotificaciones
            
            vistaNotificacion.userReference = userReference
        } else if segue.identifier == "meditar"{
            let vis = segue.destination as! UINavigationController
            let vista = vis.topViewController as! ViewController2
            print(userReference)
            vista.userReference = userReference
        }  else if segue.identifier == "segEventos"{
            let vis = segue.destination as! TableViewControllerEventos
            print(userReference)
            vis.userReference = userReference
            vis.listaEventos = listaEventos
        }  else if segue.identifier == "segRetos"{
            let vista = segue.destination as! TableViewControllerRetos
            print(userReference)
            vista.userReference = userReference
        } else if segue.identifier == "estadisticas"{
            let vistaNotificacion = segue.destination as! Estadisticas
            vistaNotificacion.userReference = userReference
        }
         else if segue.identifier == "eventoProx"{
             let vistaDetalle = segue.destination as! ViewControllerEventosInfo
             vistaDetalle.unEvento = listaEventos[index]
             vistaDetalle.userReference = userReference
         }
         else if segue.identifier == "historial"{
            let vistaHistorial = segue.destination as! historialViewController

         }
    }
    
    // MARK: - Modificar perfil
    func modificar(us: Usuario) {
        user = us
        viewDidLoad()
    }

}


