struct Point:
    var x: Float64
    var y: Float64

    fn __init__(out self, x: Float64, y: Float64):
        self.x = x
        self.y = y

    fn distance(self) -> Float64:
        return (self.x ** 2 + self.y ** 2) ** 0.5

fn main():
    var p = Point(3.0, 4.0)
    print(p.distance())  # 5.000000000651334
