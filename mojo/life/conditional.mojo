fn main():
	var n: Int = 1000
	print(t"Sum from 1 to {n} is {sum(n)}")
	print(t"Sum from 1 to {n} is {sum_while(n)}")


fn sum(n: Int) -> Int:
	var sum = 0
	for i in range(n):
		sum += i
	sum += n
	return sum

fn sum_while(n: Int) -> Int:
	var sum_while = 0
	var count = 0
	while count <= n:
		sum_while += count
		count += 1
	return sum_while
