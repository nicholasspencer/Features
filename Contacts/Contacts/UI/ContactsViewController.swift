// (ↄ) COPYLEFT ALL WRONGS RESERVED

import UIKit
import FeaturesKit
import DayPlannerKit

public protocol ContactsViewControllerDelegate: class {
  func contactsViewControllerRequestingNewContact(_ viewController: ContactsViewController)
  func contactsViewController(_ viewController: ContactsViewController, didSelect contact:Contact)
}

public class ContactsViewController: UIViewController {
  public weak var delegate: ContactsViewControllerDelegate?
  public weak var dataSource: ContactsViewDataSource? {
    didSet {
      tableView?.dataSource = dataSource
    }
  }

  @IBOutlet var tableView: UITableView?

  public override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.leftBarButtonItem = editButtonItem
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))

    tableView?.dataSource = dataSource
  }

  public override func viewWillAppear(_ animated: Bool) {
    if splitViewController!.isCollapsed,
      let selectedIndexPath = tableView?.indexPathForSelectedRow {
      tableView?.deselectRow(at: selectedIndexPath, animated: animated)
    }

    self.dataSource?.reloadData()
    self.tableView?.reloadData()

    super.viewWillAppear(animated)
  }

  public override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @objc
  public func insertNewObject(_ sender: Any) {
    self.delegate?.contactsViewControllerRequestingNewContact(self)
  }

  // MARK: - Segues

  public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showDetail" {
      if
        let indexPath = tableView?.indexPathForSelectedRow,
        let contact = self.dataSource?.contact(at: indexPath),
        let controller = (segue.destination as? UINavigationController)?.topViewController as? ContactViewController {
        self.delegate?.contactsViewController(self, didSelect: contact)
        controller.contact = contact
        controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        controller.navigationItem.leftItemsSupplementBackButton = true
      }
    }
  }
}



