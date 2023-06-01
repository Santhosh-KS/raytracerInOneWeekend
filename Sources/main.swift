import Foundation

let nx = 200
let ny = 100

print("P3")
print("\(nx) \(ny)")
print("255")

let pixels = pixelsGenerator(rows: nx, cols: ny)

print(
  pixels.map { pixel in
    "\(pixel.0) \(pixel.1) \(pixel.2)"
  }.joined(separator: "\n")
)

let v = Vector3<Float>(x: 1, y: 1, z: 1)
print(v)
print(createUnitVector(v))

func pixelsGenerator(rows nx: Int, cols ny: Int) -> [(Int, Int, Int)] {
  let lowerLeftCorner = Vector3<Float>(-2, -1, -1)
  let horizontal = Vector3<Float>(4, 0, 0)
  let vertical = Vector3<Float>(0, 2, 0)
  let origin = Vector3<Float>(0, 0, 0)
  return (0..<ny).reversed().flatMap { j in
    (0..<nx).map { i in
      let u:Float = fractionize(i, nx)
      let v:Float = fractionize(j, ny)
      let ray = Ray<Float>(origin: origin, 
      direction: ( lowerLeftCorner + (u * horizontal) + (v * vertical) ))
      let color = backgroundColor(ray)
      let ir: Int = colorConversion(color.r)
      let ig: Int = colorConversion(color.g)
      let ib: Int = colorConversion(color.b)
      return (ir, ig, ib)
    }
  }
}

func helloWorld_pixelsGenerator(rows nx: Int, cols ny: Int) -> [(Int, Int, Int)] {
  return (0..<ny).reversed().flatMap { j in
    (0..<nx).map { i in
      let v = Vector3<Float>(
        x: fractionize(i, nx),
        y: fractionize(j, ny), z: 0.2)
      let ir: Int = colorConversion(v.r)
      let ig: Int = colorConversion(v.g)
      let ib: Int = colorConversion(v.b)
      return (ir, ig, ib)
    }
  }
}

/// V1
/* for j in (0..<ny).reversed() {
  for i in 0..<nx {
    let r = Float(i) / Float(nx)
    let g = Float(j) / Float(ny)
    let b = 0.2
    let ir = Int(255.99 * r)
    let ig = Int(255.99 * g)
    let ib = Int(255.99 * b)
    print("\(ir) \(ig) \(ib)")
  }
} */

/// V2
/* let pixels = (0..<ny).reversed().flatMap {
  j in
  (0..<nx).map {
    i in
    let r: Float = fractionize(i, nx)
    let g: Float = fractionize(j, ny)
    let b: Float = 0.2
    let ir: Int = colorConversion(r)
    let ig: Int = colorConversion(g)
    let ib: Int = colorConversion(b)
    return (ir, ig, ib)
  }
} */

/* print(
  pixels.map { pixel in
    Vector3<Float>(
      x: Float(pixel.0),
      y: Float(pixel.1),
      z: Float(pixel.2)
    ).description
    // "\(pixel.0) \(pixel.1) \(pixel.2)"
  }.joined(separator: "\n")
) */
//
