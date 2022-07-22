%lang starknet

from src.recursion import compute_sum

@external
func test_compute_sum():
    let (sum) = compute_sum(10)
    assert sum = 55
    return ()
end
