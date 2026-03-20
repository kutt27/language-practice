from std.sys.info import simd_width_of
from std.memory import UnsafePointer

fn main():
  # SIMD vector of 4 Float32 values
  var a = SIMD[DType.float32, 4](1.0, 2.0, 3.0, 4.0)
  var b = SIMD[DType.float32, 4](10.0, 20.0, 30.0, 40.0)

  # One instruction: adds all 4 pairs simultaneously
  var c = a + b
  print(c)  # [11.0, 22.0, 33.0, 44.0]

  # Query hardware SIMD width
  var width = simd_width_of[DType.float32]()
  print("SIMD width for float32:", width)


  # Aligned allocation for SIMD operations
  # var ptr = UnsafePointer[Float32].alloc(256)
  var ptr = alloc[Float32](256)
  # Load SIMD-width chunk from aligned pointer
  var vec = ptr.load[width=4](0)
