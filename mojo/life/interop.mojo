from std.python import Python, PythonObject

fn main() raises:
  var np = Python.import_module("numpy")
  var plt = Python.import_module("matplotlib.pyplot")

  var py_list: PythonObject = [1, 2, 3, 4, 5]
  var arr = np.array(py_list)
  print(arr)
  print(np.sum(arr))  # 15

  var x: PythonObject = [1, 2, 3]
  var y: PythonObject = [1, 4, 9]
  plt.plot(x, y)
  plt.show()
