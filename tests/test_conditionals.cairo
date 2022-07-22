%lang starknet

from src.conditionals import abs_eq

@external
func test_abs_eq():
    let (bit) = abs_eq(2, -2)
    assert bit = 1

    let (bit) = abs_eq(2, 3)
    assert bit = 0

    let (bit) = abs_eq(2, 2)
    assert bit = 1

    return ()
end
