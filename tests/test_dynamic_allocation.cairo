%lang starknet

from starkware.cairo.common.alloc import alloc

from src.dynamic_allocation import sqr_array

@external
func test_sqr_array():
    alloc_locals
    # Allocate a new array
    let (local array) = alloc()
    # Fill the new array with field elements
    assert [array] = 1
    assert [array + 1] = 2
    assert [array + 2] = 3
    assert [array + 3] = 4

    let (new_array) = sqr_array(array=array, length=4)

    assert [new_array] = 1
    assert [new_array + 1] = 4
    assert [new_array + 2] = 9
    assert [new_array + 3] = 16

    return ()
end
