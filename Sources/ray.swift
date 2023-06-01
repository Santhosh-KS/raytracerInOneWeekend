public struct Ray<A: BinaryFloatingPoint> {
  var origin: Vector3<A>
  var direction: Vector3<A>
}

public extension Ray {
  init(_ origin: Vector3<A>, _ direction: Vector3<A>) {
    self.origin = origin
    self.direction = direction
  }
}

public extension Ray {
  func point(at parameter: A) -> Vector3<A> {
    origin + (parameter * direction)
  }
}
