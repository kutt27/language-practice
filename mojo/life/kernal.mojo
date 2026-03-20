from std.sys.info import simd_width_of
from std.memory import UnsafePointer

comptime width = simd_width_of[DType.float32]()

fn dot_product(a: UnsafePointer[Float32, _],
               b: UnsafePointer[Float32, _],
               n: Int) -> Float32:
  var sum = SIMD[DType.float32, width](0.0)

  # Vectorized main loop
  for i in range(0, n - n % width, width):
    var va = a.load[width](i)
    var vb = b.load[width](i)
    sum += va * vb

  # Reduce SIMD vector to scalar
  var result: Float32 = 0.0
  for i in range(width):
    result += sum[i]

  # Handle remainder (n % width elements at the tail)
  for i in range(n - n % width, n):
    result += a[i] * b[i]

  return result

fn main():
  from std.memory import UnsafePointer
  
  var a = alloc[Float32](8)
  var b = alloc[Float32](8)
  
  for i in range(8):
    a.store(i, Float32(i + 1))
    b.store(i, Float32(10 * (i + 1)))
  
  var result = dot_product(a, b, 8)
  print("Dot product:", result)
  print("Expected:", 1*10 + 2*20 + 3*30 + 4*40 + 5*50 + 6*60 + 7*70 + 8*80)
  
  a.free()
  b.free()
