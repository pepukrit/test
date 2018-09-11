//
//  BookViewController.swift
//  Stardust
//
//  Created by Ukrit Wattanakulchart on 9/9/2561 BE.
//  Copyright © 2561 Ukrit Wattanakulchart. All rights reserved.
//

import UIKit
import Firebase;


class BookViewController: UIViewController {

    @IBOutlet weak var pitchLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var periods = Period();
    
    var timetable = Timetable();
    
    var dbRef : DatabaseReference?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pitchLabel.text = timetable.pitchName;
        
        tableView.delegate = self;
        tableView.dataSource = self;
        
        dbRef?.database.reference();
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData();
    }
    
    func getData() {
        guard timetable.pitchName != nil else{
            print("timetable.pitchName is nil!!!!!");
            return;
        }
        dbRef?.child("timetable").child(timetable.pitchName!).observeSingleEvent(of: .value, with: { (snapshot : DataSnapshot) in
            let snapshots = snapshot.children.allObjects as! [DataSnapshot];
            for snap in snapshots{
                
                let date = Date(snap: snap);
                self.timetable.dateSlots?.append(date!);
                
            }
        })
    }
    @IBAction func changeASetOfDate(_ sender: Any) {
        
    }
    
}

extension BookViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 32;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Storyboard.dateTableCellIdentifier, for: indexPath) as! PeriodCell;
        
        cell.period.text = periods.allPeriods[indexPath.row];
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 32;
    }
    
}
