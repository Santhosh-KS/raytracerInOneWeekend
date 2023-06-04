import Foundation

public struct Vector3<A: BinaryFloatingPoint> {
  var x: A
  var y: A
  var z: A
}

extension Vector3 {
  public init(_ x: A, _ y: A, _ z: A) {
    self.init(x: x, y: y, z: z)
  }
}

extension Vector3 {
  var r: A { x }
  var g: A { y }
  var b: A { z }
}

extension Vector3 {
  func map<B>(_ f: @escaping (A) -> B) -> Vector3<B> {
    Vector3<B>(f(self.x), f(self.y), f(self.z))
  }
}

extension Vector3: CustomStringConvertible {
  public var description: String {
    "\(x) \(y) \(z)"
  }
}

/// Dot product
infix operator .*
/// Cross product
infix operator **

extension Vector3: Equatable {
  public static prefix func ~ (_ val: Self) -> Self {
    Vector3(x: (val.x * -1), y: (val.y * -1), z: (val.z * -1))
  }

  public static func + (_ lhs: Self, _ rhs: Self) -> Self {
    Vector3(x: (lhs.x + rhs.x), y: (lhs.y + rhs.y), z: (lhs.z + rhs.z))
  }

  public static func - (_ lhs: Self, _ rhs: Self) -> Self {
    Vector3(x: (lhs.x - rhs.x), y: (lhs.y - rhs.y), z: (lhs.z - rhs.z))
  }

  public static func * (_ lhs: Self, _ val: A) -> Self {
    Vector3(x: (lhs.x * val), y: (lhs.y * val), z: (lhs.z * val))
  }

  public static func * (_ val: A, _ rhs: Self) -> Self {
    Vector3(x: (rhs.x * val), y: (rhs.y * val), z: (rhs.z * val))
  }

  public static func / (_ lhs: Self, _ val: A) -> Self {
    if val == 0 { fatalError("Divided by Zero error!") }
    return Vector3(x: (lhs.x * val), y: (lhs.y * val), z: (lhs.z * val))
  }

  public static func / (_ val: A, _ rhs: Self) -> Self {
    if val == 0 { fatalError("Divided by Zero error!") }
    return Vector3(x: (rhs.x * val), y: (rhs.y * val), z: (rhs.z * val))
  }

  public static func += (_ lhs: Self, _ rhs: Self) -> Self {
    Vector3(x: (lhs.x + rhs.x), y: (lhs.y + rhs.y), z: (lhs.z + rhs.z))
  }

  public static func -= (_ lhs: Self, _ rhs: Self) -> Self {
    Vector3(x: (lhs.x - rhs.x), y: (lhs.y - rhs.y), z: (lhs.z - rhs.z))
  }

  public static func *= (_ lhs: Self, _ rhs: Self) -> Self {
    Vector3(x: (lhs.x * rhs.x), y: (lhs.y * rhs.y), z: (lhs.z * rhs.z))
  }

  public static func /= (_ lhs: Self, _ rhs: Self) -> Self {
    Vector3(x: (lhs.x / rhs.x), y: (lhs.y / rhs.y), z: (lhs.z / rhs.z))
  }

  public static func == (_ lhs: Self, _ rhs: Self) -> Bool {
    lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z
  }

  public static func > (_ lhs: Self, _ rhs: Self) -> Bool {
    lhs.x > rhs.x && lhs.y > rhs.y && lhs.z > rhs.z
  }

  public static func .* (_ lhs: Self, _ rhs: Self) -> A {
    (lhs.x * rhs.x) + (lhs.y * rhs.y) + (lhs.z * rhs.z)
  }

  public static func ** (_ lhs: Self, _ rhs: Self) -> Self {
    let x = (lhs.y * rhs.z) - (lhs.z * rhs.y)
    let y = (lhs.z * rhs.x) - (lhs.x * rhs.z)
    let z = (lhs.x * rhs.y) - (lhs.y * rhs.x)
    return Vector3(x: x, y: y, z: z)
  }

  public static func *= (_ lhs: Self, _ val: A) -> Self {
    lhs * val
  }

  public static func *= (_ val: A, _ rhs: Self) -> Self {
    val * rhs
  }

  public static func /= (_ lhs: Self, _ val: A) -> Self {
    lhs / val
  }

  public static func /= (_ val: A, _ rhs: Self) -> Self {
    val / rhs
  }
}

extension Vector3 {
  public func length() -> A {
    sqrt((self.x * self.x) + (self.y * self.y) + (self.z * self.z))
  }

  public func squaredLength() -> A {
    (self.x * self.x) + (self.y * self.y) + (self.z * self.z)
  }
}
