// (ↄ) COPYLEFT ALL WRONGS RESERVED

import Foundation

public protocol Persistable {
  associatedtype Storage
  
  static func findAll(in store: Storage, completion: ([Self]) -> Void) throws
  func save(in store: Storage, completion: ((Self) -> Void)?) throws
}
