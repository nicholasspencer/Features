// (ↄ) COPYLEFT ALL WRONGS RESERVED

import UIKit

import FeaturesKit
import DayPlannerKit

protocol EditContactViewControllerDelegate: class {

}

class EditContactViewController: UIViewController {
  weak var delegate: EditContactViewControllerDelegate?

  @IBOutlet public weak var nameTextField: UITextField?
  @IBOutlet public weak var addressTextField: UITextField?
  @IBOutlet public weak var phoneTextField: UITextField?
  @IBOutlet public weak var favoriteButton: FavoriteButton?
  @IBOutlet public weak var persistenceButton: UIButton?
  
  public var contact: Contact? {
    didSet {
      configureView()
    }
  }

  func configureView() {
    guard let contact = contact else { return }

    nameTextField?.text = contact.name
    addressTextField?.text = contact.address
    phoneTextField?.text = contact.phone
    favoriteButton?.favorite = contact.favorite

    self.addressTextField?.isEnabled = contact.name != nil
    self.phoneTextField?.isEnabled = contact.name != nil
    self.favoriteButton?.isEnabled = contact.name != nil
    self.persistenceButton?.isEnabled = contact.name != nil
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  @IBAction func textFieldDidChange(_ sender: UITextField) {
    guard let contact = contact else { return }

    switch sender {
    case let sender where sender == nameTextField:
      self.contact?.name = sender.text
    case let sender where sender == addressTextField:
      self.contact?.address = sender.text
    case let sender where sender == phoneTextField:
      self.contact?.phone = sender.text
    default:
      let _ = false
    }

    do {
      self.contact = try self.contact?.save()
    } catch {
      print(error)
      self.contact = contact
    }
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

extension EditContactViewController: IBRepresentableNibViewController {}
