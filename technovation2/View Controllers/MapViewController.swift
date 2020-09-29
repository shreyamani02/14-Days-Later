//
//  MapViewController.swift
//  technovation2
//
//  Created by Shreya Mani on 4/28/20.
//  Copyright © 2020 Shreya Mani. All rights reserved.
//

import UIKit
import UIKit
import GoogleMaps
import GooglePlaces
import Firebase
import FirebaseDatabase

class MapViewController: UIViewController {

    var mapView:GMSMapView?
        /* @IBAction func goUpdate(_ sender: Any) {
            performSegue(withIdentifier: "goUpdate", sender: self)
        }
        */
        var long = ""
        var lang = ""
        var value1 = ""
        let value2 = ""
        let zoom = 5
        


        var ref: DatabaseReference!
        var postData = [String]()
        var databaseHandle: DatabaseHandle?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            GMSServices.provideAPIKey("AIzaSyCVYq8dFBxKrFwRVa_POO76FLOhIpcX0eQ")
             let camera = GMSCameraPosition.camera(withLatitude: 37.369701, longitude: -122.086256, zoom: 10)
             let rect = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 430, height: 600))
             let mapView = GMSMapView.map(withFrame: rect, camera:camera)
             //view = mapView
            mapView.center = self.view.center
            self.view.addSubview(mapView)
             
             let currentLocation = CLLocationCoordinate2DMake(37.369701, -122.086256)
             let marker = GMSMarker(position: currentLocation)
            marker.title = "Saint Francis High School"
             
          /*  let newLocation = CLLocationCoordinate2DMake((long as NSString).doubleValue, (lang as NSString).doubleValue)
            let newmarker = GMSMarker(position: newLocation)
            newmarker.title = "Gunn High School"
            newmarker.map = mapView
             marker.map = mapView
            */
            
            ref = Database.database().reference()
            databaseHandle = ref?.child("someid/lang").observe(.value) { (snapshot) in
                //Take the value from the snapshot and add it to the post data array
                if let actualPost = snapshot.value as? String {
                    //self.postData.append(actualPost)
                    self.lang = actualPost
                }
                
            }
            databaseHandle = ref?.child("someid/long").observe(.value) { (snapshot) in
            //Take the value from the snapshot and add it to the post data array
            if let actualPost = snapshot.value as? String {
                //self.postData.append(actualPost)
                self.long = actualPost
            }

            let newLocation = CLLocationCoordinate2DMake((self.lang as NSString).doubleValue, (self.long as NSString).doubleValue)
            let newmarker = GMSMarker(position: newLocation)
                
            newmarker.title = "someid"
            newmarker.map = mapView
            marker.map = mapView
                let databaseRef = Database.database().reference().child("Locations")
            let databaseHandle = databaseRef.observe(.value, with: { (snapshot) in
                for child in snapshot.children.allObjects as! [DataSnapshot] {
                    let user = child.value as! [String: Any]
                    if let dbLang = user["Lang"] as? String, let dbLong = user["Long"] as? String {
                        if user["COVID?"] != nil{
                                   let currentLocation = CLLocationCoordinate2DMake((dbLang as NSString).doubleValue, (dbLong as NSString).doubleValue)
                                    let currentmarker = GMSMarker(position: currentLocation)
                                    currentmarker.map = mapView
                            }
                           }

                       }
                })
            }
            


            
            
        
        func setUpNavbar(){
            let searchController = UISearchController(searchResultsController: nil)
            navigationItem.searchController = searchController
            
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
