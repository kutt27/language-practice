from std.memory import UnsafePointer

# High-level: Pythonic, readable
fn sum_pythonic(data: List[Int]) -> Int:
    var total = 0
    for val in data:
        total += val
    return total

# Low-level: explicit memory access
fn sum_lowlevel(ptr: UnsafePointer[Int, _], n: Int) -> Int:
    var total: Int = 0
    for i in range(n):
        total += ptr[i]
    return total

fn main():
  var data = [1, 2, 3, 4, 5]
  var n = len(data)

  # High-level call
  var sum1 = sum_pythonic(data)
  print("sum_pythonic:", sum1)

  # Low-level call: get a raw pointer to the data
  # var ptr = UnsafePointer[Int, _].alloc(n)
  var ptr = alloc[Int](n)
  for i in range(n):
      ptr[i] = data[i]
  var sum2 = sum_lowlevel(ptr, n)

  print("sum_lowlevel:", sum2)

  ptr.free()
