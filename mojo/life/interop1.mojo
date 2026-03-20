from std.python import Python, PythonObject

fn main() raises:
    var py = Python.import_module("builtins")

    # Create a Mojo list first, then convert to PythonObject
    var mojo_list = [1, 2, 3]
    var py_list: PythonObject = PythonObject(mojo_list)

    # or equivalently, if your Mojo allows:
    // var py_list: PythonObject = [1, 2, 3]  # some versions auto‑convert

    var arr = py.array(py_list)
    # Each access goes through Python's C API
    var first = arr[0]  # dynamic lookup, not a pointer offset
    print(first)
