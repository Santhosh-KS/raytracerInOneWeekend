public func fractionize<A, B>(_ input: A, _ max: A) -> B
where
  A: SignedNumeric & BinaryInteger,
  B: BinaryFloatingPoint
{
  B(input) / B(max)
}

public func colorConversion<A>(_ val: Float) -> A
where
  A: SignedNumeric & BinaryInteger
{
  A(255.99 * val)
}

public func backgroundColor<A:BinaryFloatingPoint>(_ ray: Ray<A>) -> Vector3<A> {
    let unitDirection = createUnitVector(ray.direction) 
    let t =  (unitDirection.y +  1) / 2
    let a = Vector3<A>(x:1, y: 1, z: 1)
    let b = Vector3<A>(x:0.5, y: 0.7, z: 1)
    /// lerp 
    return ((1-t) * a) + (t * b)
}

public func createUnitVector<A>(_ vec:Vector3<A>) -> Vector3<A> {
    let k = 1 / vec.length()
    return k * vec 
}
