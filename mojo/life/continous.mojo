from std.memory import UnsafePointer

fn swap():
  var ptr = alloc[Float64](10)
  for i in range(10):
    ptr[i] = Float64(i) * 2.0

  for i in range(10):
    print(ptr[i])

  ptr.free()
