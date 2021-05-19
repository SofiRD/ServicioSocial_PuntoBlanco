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
    
    var userReference : DatabaseReference!
    var user : Usuario = Usuario(idUsuario: 1, nombre: "Sebastian Diaz", correo: "sebastian@gmail.com", contrasena: "sebastian1234", imagenPerfil: UIImage(named: "foto"))
    
    
    @IBOutlet weak var logOut: UIButton!
    @IBOutlet weak var lbNombreUsuario: UILabel!
    @IBOutlet weak var imagenPerfilUsuario: UIImageView!
    @IBOutlet weak var lbSaludoNombre: UILabel!
    
    var index:Int = 0
    var listaEventos = [Evento(nombreEvento: "Música para el alma: Chello", idEvento: 1, imagen: (UIImage(named: "meditacion_1") ?? UIImage(named: "meditacion_1"))!, fecha: "1/12/2020 19:00", descripcion: "Disfruta de una experiencia sensible y relajante. Conecta con tu interior a través de la música emotiva del chello.",isRegistered: false),
                        Evento(nombreEvento: "Música para el alma: Arpa", idEvento: 2,imagen: (UIImage(named: "meditacion_2") ?? UIImage(named: "meditacion_1"))!, fecha: "11/02/2021 19:00", descripcion: "Enamórate de la magia del arpa y regálate un momento de relajación.",isRegistered: false),
                        Evento(nombreEvento: "Día de la Felicidad: Danza Africana", idEvento: 3,imagen: (UIImage(named: "meditacion_3") ?? UIImage(named: "meditacion_1"))!, fecha: "25/03/2021 11:00", descripcion: "Con esto en mente, la danza africana es una meditación en movimiento que mueve el alma a través de la activación del cuerpo y la consciencia de cada movimiento, de     las vibraciones sentidas por el ritmo del tambor y los pasos de quienes nos acompañan en esta celebración del corazón.",isRegistered: false),
                        Evento(nombreEvento: "Día de la Tierra: Cartas a la Tierra", idEvento: 4,imagen: (UIImage(named: "meditacion_4") ?? UIImage(named: "meditacion_1"))!, fecha: "22/04/2021 11:00", descripcion: "Meditación guiada y reflexión a través de los poemas del maestro zen vietnamita Thich Nath Hanh" ,isRegistered: false)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            let vistaNotificacion = segue.destination as! ViewController2
            vistaNotificacion.popoverPresentationController!.delegate = self
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


