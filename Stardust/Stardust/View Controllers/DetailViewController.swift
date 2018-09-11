//
//  DetailViewController.swift
//  Stardust
//
//  Created by Ukrit Wattanakulchart on 16/8/2561 BE.
//  Copyright © 2561 Ukrit Wattanakulchart. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var pitch : Pitch?;
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = pitch?.pitchName;
        detailLabel.text = pitch?.pitchDetail;
        commentLabel.text = pitch?.pitchComment;
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //This prepare the data for the next View Controller "by accessing variables in that class".
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? BookViewController{
            vc.timetable.pitchName = pitch?.pitchName;
            vc.timetable.pitchID = pitch?.pitchID;
        }
    }
    
    @IBAction func bookTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: Constants.Segue.goToBookViewController, sender: self);
    }
    
}
