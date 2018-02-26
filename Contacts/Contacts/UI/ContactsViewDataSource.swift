// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation
import DayPlannerKit

public class ContactsViewDataSource: NSObject, UITableViewDataSource {
  public var database: SQLiteDatabase? {
    didSet {
      if let database = database {
        try? Contact.findAll(in: database) { (contacts) in
          self.contacts = contacts
        }
      } else {
        contacts.removeAll()
      }
    }
  }

  private var contacts = [Contact]()

  public func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return contacts.count
  }

  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    let contact = contacts[indexPath.row]
    cell.textLabel!.text = contact.name
    return cell
  }

  public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
  }

  public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      //      objects.remove(at: indexPath.row)
      //      tableView.deleteRows(at: [indexPath], with: .fade)
    } else if editingStyle == .insert {
      // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
  }
}
