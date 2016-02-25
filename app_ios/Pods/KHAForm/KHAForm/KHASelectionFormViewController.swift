//
//  KHASelectionFormViewController.swift
//  KHAForm
//
//  Created by Kohei Hayakawa on 5/1/15.
//
//

import UIKit

protocol KHASelectionFormViewDelegate: class {
    func selectionFormDidChangeSelectedIndex(selectionForm: KHASelectionFormViewController)
}

public protocol KHASelectionFormViewDataSource {
    func selectionsForSelectionForm(selectionForm: KHASelectionFormViewController) -> [String]
    func selectedIndexForSelectionForm(selectionForm: KHASelectionFormViewController) -> Int
}

public class KHASelectionFormViewController: UITableViewController, KHASelectionFormViewDataSource {

    private let cellID = "cell"
    public var selections: [String] = []
    public var selectedIndex: Int = 0
    weak var delegate: KHASelectionFormViewDelegate?

    
    // MARK: View lifecycle
    
    // Form is always grouped tableview
    convenience init() {
        self.init(style: .Grouped)
        selections = selectionsForSelectionForm(self)
        selectedIndex = selectedIndexForSelectionForm(self)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.reloadData()
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: self.selectedIndex, inSection: 0), atScrollPosition: .Top, animated: false)
        })
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public func selectionsForSelectionForm(selectionForm: KHASelectionFormViewController) -> [String] {
        return selections
    }
    
    public func selectedIndexForSelectionForm(selectionForm: KHASelectionFormViewController) -> Int {
        return selectedIndex
    }

    
    // MARK: - Table view data source
    
    override public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selections.count
    }

    override public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) 
        
        cell.textLabel?.text = selections[indexPath.row]
        
        if selectedIndex == indexPath.row {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        
        return cell
    }

    override public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Remove checkmark from old selected cell
        let oldSelectedCell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: selectedIndex, inSection: 0))
        oldSelectedCell?.accessoryType = .None
        
        // Add checkmark to new selected cell
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.accessoryType = .Checkmark
        selectedIndex = indexPath.row
        delegate?.selectionFormDidChangeSelectedIndex(self)
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
}
