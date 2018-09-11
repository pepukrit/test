//
//  MainViewController.swift
//  Stardust
//
//  Created by Ukrit Wattanakulchart on 15/8/2561 BE.
//  Copyright © 2561 Ukrit Wattanakulchart. All rights reserved.
//

//TODO : retrive the data from the database in another class. To elaborate, we have around 20-30 variables for containing each time period, so it would consume this class for many lines. So, creating the new class to set up these variables would be a better choice.


import UIKit
import Firebase;

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dbRef : DatabaseReference?;
    
    var pitches = [Pitch]();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self;
        tableView.dataSource = self;
        dbRef = Database.database().reference();
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Access the next scene to set the pitch information
        let destinationVC = segue.destination as! DetailViewController;
        if let selectedPath = tableView.indexPathForSelectedRow {
            destinationVC.pitch = pitches[selectedPath.row];
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Fetch the Data
        getData();
    }
    
    func getData(){
        dbRef?.child("pitches").observeSingleEvent(of: .value, with: { (snapshot : DataSnapshot) in
            let snapshots = snapshot.children.allObjects as! [DataSnapshot];
            for snap in snapshots{
                let pitchID = snap.key as! String;
                let pitchDict = snap.value as! [String : Any];
                let name = pitchDict["name"] as! String;
                let detail = pitchDict["detail"] as! String;
                let comment = pitchDict["comment"] as! String;
                
                let pitch = Pitch(pitchName: name, pitchComment: comment, pitchDetail: detail, pitchID: pitchID);
                self.pitches.append(pitch);
            }
            self.tableView.reloadData();
        })
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pitches.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath);
        let pitchName = cell.viewWithTag(1) as! UILabel;
        pitchName.text = pitches[indexPath.row].pitchName;
        
        return cell;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //link in that pitch -> perform a segue
        performSegue(withIdentifier: "goToDetail", sender: self);
    }
    
}
