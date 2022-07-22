# When Cairo needs to retrieve the *address* of a local variable,
# it needs to be told the value of the frame pointer register, fp
# (see [here](https://cairo-lang.org/docs/how_cairo_works/functions.html#fp-register)).
#
# This can be done by setting a reference named __fp__ to the value, which
# can be obtained using the library function get_fp_and_pc().
#
# 1. Try to run the code as-is, and make sure you understand the error.
# 2. Uncomment the line setting __fp__, and run again.
#    The code should now work and you should be able to see that x was set
#    to 1234.
# 3. Uncomment the line calling foo() and try to run the code.
#    Fix the code by adding exactly one word to it.
#    Hint: Revisit the "Revoked references" challenge.

%lang starknet

from starkware.cairo.common.registers import get_fp_and_pc

from src.address_of_locals import foo

@external
func test_step2():
    alloc_locals

    let (__fp__, _) = get_fp_and_pc()
    local x : felt
    # let (res) = foo(a=10)
    local y : felt* = &x
    assert [y] = 1234
    return ()
end

@external
func test_step3():
    alloc_locals

    let (__fp__, _) = get_fp_and_pc()
    local x : felt
    let (local res) = foo(a=10)
    local y : felt* = &x
    assert [y] = 1234
    return ()
end
