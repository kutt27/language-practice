fn multiple(a: i32, b: i32, c: i32) -> i32 {
    return a * b * c;
}

fn takes_u32(x: u32) {
    println!("u32: {x}");
}

fn takes_i8(y: i8) {
    println!("i8: {y}");
}

fn fib(n: u32) -> u32 {
    if n == 0 {
        return 0;
    }
    if n == 1{
        return 1;
    }
    return fib(n - 1) + fib(n - 2);
}

fn main() {
    // println!("Hello, world!");

    let x: i32 = 5;
    let y: i32 = 10;
    println!("x + y = {}", x + y);

    println!("result: {}", multiple(120, 100, 248));

    let x = 10;
    let y = 127; // try let y = 128;

    takes_u32(x);
    takes_i8(y);
    // takes_u32(y);

    let n = 28;
    println!("fib({n}) = {}", fib(n));

}
