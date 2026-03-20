fn matmul_naive(mut A: List[Float64], mut B: List[Float64], mut C: List[Float64], N: Int):
    for i in range(N):
        for j in range(N):
            for k in range(N):
                var c_elem = C[i * N + j]
                c_elem += A[i * N + k] * B[k * N + j]
                C[i * N + j] = c_elem


fn matmul_tiled(mut A: List[Float64], mut B: List[Float64], mut C: List[Float64], N: Int, TILE: Int):
    for ii in range(0, N, TILE):
        for jj in range(0, N, TILE):
            for kk in range(0, N, TILE):
                for i in range(ii, min(ii + TILE, N)):
                    for j in range(jj, min(jj + TILE, N)):
                        for k in range(kk, min(kk + TILE, N)):
                            var c_elem = C[i * N + j]
                            c_elem += A[i * N + k] * B[k * N + j]
                            C[i * N + j] = c_elem

fn main():
    var N = 4
    var A = List[Float64](length=N*N, fill=0.0)
    var B = List[Float64](length=N*N, fill=0.0)
    var C = List[Float64](length=N*N, fill=0.0)

    # Fill A and B with some values...
    matmul_naive(A, B, C, N)
