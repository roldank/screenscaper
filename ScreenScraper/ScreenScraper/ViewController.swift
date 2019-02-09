//
//  ViewController.swift
//  ScreenScraper
//
//  Created by Roldan Kramer (student LM) on 2/8/19.
//  Copyright © 2019 Roldan Kramer (student LM). All rights reserved.
//

import UIKit
import Alamofire
import Kanna
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
var html: String? = nil
let textCellIdentifier = "GradeCell"
    var grades: [Grade] = []
    @IBOutlet weak var TableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func loginScrape() -> Void {
        AF.request( "https://powerschool.lmsd.org/public/", interceptor: "https://powerschool.lmsd.org/public/" as? RequestInterceptor).responseString { response in
            print("Success: \(response.result.isSuccess)")
            self.html = response.result.value
            self.getGradePagesParse(html: response.result.value!)
        }
    }
    func login2Scrape() -> Void {
        AF.request( "https://powerschool.lmsd.org/guardian/home.html", interceptor: "https://powerschool.lmsd.org/guardian/home.html" as? RequestInterceptor).responseString { response in
            print("Success: \(response.result.isSuccess)")
            self.html = response.result.value
            self.getGradePagesParse(html: response.result.value!)
        }
    }
    
    func getGradePagesParse(html: String) -> Void {
        if let doc = Kanna.HTML(html: html, encoding: String.Encoding.utf8) {
            grades = []
             for grades in doc.css("td[id^='Text']") {
                let showString = grade.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
            }
            
            }
    }
    func getGradesParse(html: String) -> Void {
        if let doc = Kanna.HTML(html: html, encoding: String.Encoding.utf8) {
            for show in doc.css("td[id^='Text']") {
                let showString = show.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
            }
        }
    }
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if  segue.identifier == showConcertInfoSegueIdentifier,
//            let destination = segue.destinationViewController as? ShowWebViewController,
//            let showIndex = metalShowTableView.indexPathForSelectedRow?.row {
//
//            destination.url = grades[showIndex].link
//        }
//    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Pass any object as parameter, i.e. the tapped row.
//        performSegueWithIdentifier(showConcertInfoSegueIdentifier, sender: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return grades.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath as IndexPath)
//
//        let row = indexPath.row
//        let grade = Grade[row]
        
//        cell.detailTextLabel?.text = show.date + "\n" + show.venue
//        cell.textLabel?.text = show.description
        
        return cell
    }
}

