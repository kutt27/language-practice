struct Vec3(ImplicitlyCopyable):
    var x: Float64
    var y: Float64
    var z: Float64

    fn __init__(out self, x: Float64, y: Float64, z: Float64):
        self.x = x
        self.y = y
        self.z = z

    fn dot(self, other: Vec3) -> Float64:
        return self.x * other.x + self.y * other.y + self.z * other.z


fn main():
    var v1 = Vec3(1.0, 2.0, 3.0)
    var v2 = Vec3(4.0, 5.0, 6.0)

    print("v1 · v2 =", v1.dot(v2))   # 32.0

    # Show that assignment makes an independent copy
    var v3 = v1
    print("v3.x before change =", v3.x)

    v3.x = 99.9
    print("v3.x after change  =", v3.x)
    print("v1.x after change  =", v1.x)
