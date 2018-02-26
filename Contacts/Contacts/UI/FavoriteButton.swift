// (ↄ) COPYLEFT ALL WRONGS RESERVED

import UIKit

@IBDesignable
public class FavoriteButton: UIButton {

  @IBInspectable
  public var favorite: Bool = false {
    didSet {
      self.setTitle(favorite ? "😍" : "🙂", for: .normal)
      self.setTitle(favorite ? "😍" : "🙂", for: .highlighted)
      self.setTitle(favorite ? "😍" : "🙂", for: .disabled)
      self.setTitle(favorite ? "😍" : "🙂", for: .selected)
    }
  }
  
}
