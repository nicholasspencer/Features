// (ↄ) COPYLEFT ALL WRONGS RESERVED

import UIKit
import DayPlannerKit

public class ContactViewController: UIViewController {

  @IBOutlet public weak var nameLabel: UILabel?
  @IBOutlet public weak var addressLabel: UILabel?
  @IBOutlet public weak var phoneLabel: UILabel?
  @IBOutlet public weak var favoriteButton: FavoriteButton?

  public var contact: Contact? {
    didSet {
      configureView()
    }
  }

  func configureView() {
    guard let contact = contact else { return }

    self.nameLabel?.text = contact.name
    self.addressLabel?.text = contact.address
    self.phoneLabel?.text = contact.phone
    self.favoriteButton?.favorite = contact.favorite
  }

  public override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    configureView()
  }

  public override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func toggleFavorite(_ sender: FavoriteButton) {
    guard let contact = contact else { return }

    let favorite = !contact.favorite

    self.contact?.favorite = favorite

    do {
      self.contact = try self.contact?.save()
    } catch {
      print(error)
      self.contact = contact
    }
  }

}

