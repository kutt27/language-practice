fn main():
    # Stack-allocated: fixed size, fast, automatic cleanup
    var x: Int = 42


    # Ownership transfer with 'owned'
    var s1 = String("hello")
    take_ownership(s1^)
    # s1 is no longer valid here


fn take_ownership(s: String):
    print(s)
    # s is destroyed when this function returns
