fn owned_working(s: String):
  print(t"Inside owned: {s}")

fn main():
  var s1: String = "Hello"
  owned_working(s1^)
  # print(t"After owned: {s}")
