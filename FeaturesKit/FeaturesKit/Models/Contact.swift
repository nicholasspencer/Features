// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation

public struct Contact: Codable {
  public var uuid = UUID()
  
  public var name: String?
  public var address: String?
  public var company: String?

  public var favorite: Bool = false
}
