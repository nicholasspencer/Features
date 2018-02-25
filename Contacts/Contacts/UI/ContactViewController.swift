// (ↄ) COPYLEFT ALL WRONGS RESERVED

import UIKit

public class ContactViewController: UIViewController {

  @IBOutlet public weak var detailDescriptionLabel: UILabel!

  func configureView() {
    // Update the user interface for the detail item.
    if let detail = detailItem {
        if let label = detailDescriptionLabel {
            label.text = detail.description
        }
    }
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

  public var detailItem: NSDate? {
    didSet {
        // Update the view.
        configureView()
    }
  }


}

