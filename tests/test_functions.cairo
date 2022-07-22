%lang starknet

from src.functions import add1_square

@external
func test_add1_square():
    # Call `add1_square` and save the result into `res`.
    let (res) = add1_square(x=12)

    # Verify the computation.
    assert res = (12 + 1) * (12 + 1)
    return ()
end
