# Row‑major: element [i][j] is at index i * cols + j
# Column‑major: element [i][j] is at index j * rows + i

fn row_major_index(i: Int, j: Int, cols: Int) -> Int:
  return i * cols + j

fn col_major_index(i: Int, j: Int, rows: Int) -> Int:
  return j * rows + i

fn main():
  # 3x4 matrix (3 rows, 4 columns)
  var rows = 3
  var cols = 4

    # Flat data: 0  1  2  3
    #            4  5  6  7
    #            8  9 10 11
  var data = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
  print(t"flat data = {data}")

  # Row‑major lookup
  var i = 1
  var j = 2
  var idx_rm = row_major_index(i, j, cols)
  print("\nRow‑major:")
  print("  [i][j] = [1][2] -> index", idx_rm, "->", data[idx_rm])

  # Column‑major lookup on the same flat array
  var idx_cm = col_major_index(i, j, rows)
  print("\nColumn‑major (same flat data):")
  print("  [i][j] = [1][2] -> index", idx_cm, "->", data[idx_cm])

  # Optional: print entire layout
  print("\nRow‑major layout by index:")
  for i in range(rows):
    for j in range(cols):
      var idx = row_major_index(i, j, cols)
      print("  [", i, "][", j, "] -> idx", idx, "=", data[idx])
