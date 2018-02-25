// (ↄ) COPYLEFT ALL WRONGS RESERVED

import UIKit
import FeaturesKit
import DayPlannerKit

public protocol ContactsViewControllerDelegate: class {
  func contactsViewControllerRequestingNewContact(_ viewController: ContactsViewController)
  func contactsViewController(_ viewController: ContactsViewController, didSelect contact:Contact)
}

public class ContactsViewController: UITableViewController {
  public weak var delegate: ContactsViewControllerDelegate?

  public var objects = [Any]()

  public override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.leftBarButtonItem = editButtonItem
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
  }

  public override func viewWillAppear(_ animated: Bool) {
    if splitViewController!.isCollapsed,
      let selectedIndexPath = tableView?.indexPathForSelectedRow {
      tableView?.deselectRow(at: selectedIndexPath, animated: animated)
    }

    super.viewWillAppear(animated)
  }

  public override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @objc
  public func insertNewObject(_ sender: Any) {
    objects.insert(NSDate(), at: 0)
    let indexPath = IndexPath(row: 0, section: 0)
    tableView?.insertRows(at: [indexPath], with: .automatic)
  }

  // MARK: - Segues

  public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showDetail" {
      if
        let indexPath = tableView?.indexPathForSelectedRow,
        let object = objects[indexPath.row] as? NSDate,
        let controller = (segue.destination as? UINavigationController)?.topViewController as? ContactViewController {
        controller.detailItem = object
        controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        controller.navigationItem.leftItemsSupplementBackButton = true
      }
    }
  }
}

extension ContactsViewController {
  public override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return objects.count
  }

  public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

    let object = objects[indexPath.row] as! NSDate
    cell.textLabel!.text = object.description
    return cell
  }

  public override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
  }

  public override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      objects.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .fade)
    } else if editingStyle == .insert {
      // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
  }
}



