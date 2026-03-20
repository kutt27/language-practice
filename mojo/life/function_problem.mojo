fn argument_sum(x: Int, y: Int, mut z: Int):
	z = x + y + z

fn main():
	var x: Int = 10
	var y: Int = 20
	var z: Int = 0
	print(t"Before passing z, its value {z}")
	argument_sum(x, y, z)
	print(t"After passing z, its value {z}")
