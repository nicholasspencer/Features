// (ↄ) COPYLEFT ALL WRONGS RESERVED

import UIKit

@IBDesignable
public class FavoriteButton: UIButton {

  @IBInspectable
  public var favorite: Bool = false {
    didSet {
      self.titleLabel?.text = favorite ? "😍" : "🙂"
    }
  }
  
}
