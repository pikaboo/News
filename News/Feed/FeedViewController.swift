//
//  FeedViewController.swift
//  News
//
//  Created by Lena Brusilovski on 02/02/2019.
//  Copyright © 2019 Lena Brusilovski. All rights reserved.
//

import UIKit
extension FeedViewController {
    static let FeedItemCellNibName = "FeedItemTableViewCell"
    static let FeedDetailSegueName = "showArticle"
}
class FeedViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    var dataSource : DataSource!
    fileprivate var timer:Timer!

    /**
    * These are the data models for each segment
    * If in the future should more segments be added, just add the data models and
    * and add to the feed result order, and it should work the same way
    */
    fileprivate var newsResults = FeedResult()
    fileprivate var entertainmentResult = FeedResult()
    fileprivate var environmentResult = FeedResult()
    
    /**
    * The feedResultsSegmentModel should be initialized with the order
    * of the display data
    * If you want to change thee number of segments or what they display
    * changing this value is what does it
    */
    fileprivate var feedResultsSegmentModel:[FeedSegment]! {
        didSet {
            self.segmentedControl.removeAllSegments()
            for (index, segment) in self.feedResultsSegmentModel.enumerated() {
                self.segmentedControl.insertSegment(withTitle: segment.segmentTitle, at: index, animated: false)
            }
            self.segmentedControl.selectedSegmentIndex = 0
            self.selectedSegmentIndex = self.segmentedControl.selectedSegmentIndex
        }
    }
    fileprivate var currentFeedSegment:FeedSegment! {
        didSet{
            currentFeedSegment.segmentItems.forEach { (result) in
                result.reset()
            }
        }
    }
    
    var loading: Bool! {
        didSet{
            switch self.loading  {
            case true:
                self.activityIndicator.startAnimating()
                break
            default:
                self.activityIndicator.stopAnimating()
            }
        }
    }
    /**
    * When selected segment changes it invokes all the necessary updates
    */
    var selectedSegmentIndex:Int! {
        didSet{
            currentFeedSegment = feedResultsSegmentModel[selectedSegmentIndex]
            //update the view to the previously known result so that it would appear
            //quick while getting newest result from the server
            self.displayData(feedResults: currentFeedSegment.segmentItems)
            self.updateRSS()
        }
    }
    
    /**
     * check the RSS feed for new items
     */
    var updatingRSS : Bool! {
        didSet {
            if self.updatingRSS {
                self.timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: {[weak self] (timer) in
                    self?.updateRSS()
                })
            }else {
                self.timer.invalidate()
                self.timer = nil
            }
        }
    }
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = DataSource()
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self.dataSource
        self.tableView.rowHeight = 80
        self.activityIndicator.hidesWhenStopped = true
       
        self.tableView.register(UINib(nibName:FeedViewController.FeedItemCellNibName, bundle: nil), forCellReuseIdentifier: FeedItemTableViewCell.FeedItemTableViewCellReuseIdentifier)
        self.segmentedControl.addTarget(self, action: #selector(FeedViewController.segmentedControlChanged(_:)), for: .valueChanged)
        
        onMainThread(self, name: FeedEvents.FeedItemSelected) {[weak self] (note) in
            if let item = note?.userInfo?[FeedEvents.FeedItemKey] as? ItemModel {
                self?.performSegue(withIdentifier:FeedViewController.FeedDetailSegueName, sender: item)
            }
        }
        
        self.feedResultsSegmentModel = [FeedSegment("News", segmentItems:[newsResults], onUpdateItems:{
            [unowned self]  in
            self.rssService.getBusinessNews(completion: self.getResponseHandler(resultContainer: self.newsResults))
        }),FeedSegment("Other", segmentItems:[entertainmentResult,environmentResult], onUpdateItems:{
           [unowned self]  in
            self.rssService.getEnvironment(completion: self.getResponseHandler(resultContainer: self.environmentResult))
            self.rssService.getEntertainment(completion: self.getResponseHandler(resultContainer: self.entertainmentResult))
        })]
    }
    deinit {
        unregisterFromEvents(self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? FeedItemViewModel,
            let item = sender as? ItemModel {
            dest.setItem(item: item)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updatingRSS = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.updatingRSS = false
    }
    
    @objc func segmentedControlChanged(_ segmentedControl:UISegmentedControl) {
        self.selectedSegmentIndex = segmentedControl.selectedSegmentIndex
    }
    
    func updateRSS(){
        self.loading = true
        self.currentFeedSegment.onUpdateItems()
    }
    
    
    /*
    * Complete the feed update cycle
    */
    func finishUpdate(feedResults:[FeedResult]){
        var allowedToFinish = true
        feedResults.forEach { (result) in
            allowedToFinish = allowedToFinish && result.requestCompleted
        }
        
        guard allowedToFinish else {
            print("did not get all items yet")
            return
        }
        self.displayData(feedResults: feedResults)
        self.loading = false
    }
    
    func displayData(feedResults:[FeedResult]){
        self.dataSource.clear()
        feedResults.forEach { (result) in
            self.dataSource.addItems(items: result.items)
        }
        self.tableView.reloadData()
    }
    
    func getResponseHandler(resultContainer: FeedResult) -> ItemsReceived{
        let completionHandler:ItemsReceived = {
          [unowned self]  path, error, items in
            resultContainer.requestCompleted = true
            resultContainer.items = items
            guard error == nil else{
                print("encountered an error:\(String(describing: error?.localizedDescription))")
                return
            }
            
            self.finishUpdate(feedResults: self.currentFeedSegment.segmentItems)
        }
        return completionHandler
    }
    
    @IBAction func goBack(segue:UIStoryboardSegue){
        //this method does not need any implementation, it is only needed for the unwindSegue in the storyboard.
    }
}
