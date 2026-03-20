fn row_major_index(i: Int, j: Int, cols: Int) -> Int:
  return i * cols + j

fn col_major_index(i: Int, j: Int, rows: Int) -> Int:
  return j * rows + i

fn main():
  # 4x4 matrix
  var rows = 4
  var cols = 4
  var total = rows * cols

  # Allocate flat buffer and fill it row‑major
  var data = [0] * total
  var val = 0
  for i in range(rows):
    for j in range(cols):
      var idx = row_major_index(i, j, cols)
      data[idx] = val
      val += 1
    print("flat buffer (row‑major filled):", data)

    # Read it column‑major and print access order
    print("\nReading in column‑major order:")
    for j in range(cols):
      for i in range(rows):
        var idx = col_major_index(i, j, rows)
        print("  [i][j] = [", i, "][", j, "] -> idx", idx, "=", data[idx])

    # Optional: also print row‑major read order
    print("\nReading in row‑major order:")
    for i in range(rows):
      for j in range(cols):
        var idx = row_major_index(i, j, cols)
        print("  [", i, "][", j, "] -> idx", idx, "=", data[idx])
