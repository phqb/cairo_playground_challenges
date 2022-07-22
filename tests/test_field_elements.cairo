%lang starknet

from starkware.cairo.common.math import unsigned_div_rem
from starkware.cairo.common.serialize import serialize_word

from src.field_elements import pow

@external
func test_field_elements():
    alloc_locals
    let x = 1 + 100
    %{ print(ids.x) %}
    let x = 1 - 100
    %{ print(ids.x) %}
    let x = 9 * 9
    %{ print(ids.x) %}
    let (x) = pow(10, 74)
    %{ print(ids.x) %}
    let (x) = pow(10, 75)
    %{ print(ids.x) %}
    let (x) = pow(10, 76)
    %{ print(ids.x) %}
    let x = 12 / 3
    %{ print(ids.x) %}
    let x = (-12) / 3
    %{ print(ids.x) %}
    let x = 13 / 3
    %{ print(ids.x) %}

    return ()
end

# As you saw in the previous challenge, the operator '/' does not denote
# truncated (i.e., rounding down) integer division as in other programming
# languages. Instead, one can use library functions such as
# unsigned_div_rem().
#
# Note that unsigned_div_rem() does not work for negative numbers.
@external
func test_field_elements_2{range_check_ptr}():
    let (q, r) = unsigned_div_rem(value=12, div=3)
    # Output the quotient (12 // 3).
    %{ print(ids.q) %}
    # Output the remainder (12 % 3).
    %{ print(ids.r) %}

    let (q, r) = unsigned_div_rem(value=13, div=3)
    %{ print(ids.q) %}
    %{ print(ids.r) %}

    return ()
end
