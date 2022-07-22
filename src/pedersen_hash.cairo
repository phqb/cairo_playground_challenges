# The following code implements a Pedersen hash chain.
# Given the [Pedersen hash](https://docs.starkware.co/starkex-docs/crypto/pedersen-hash-function) function `H`, which
# takes two field elements and returns one representing their hash,
# a hash chain on inputs x_0, x_1, ..., x_n is the result of
# H(H(...H(H(x_0, x_1), x_2), ...,x_{n-1}), x_n)
# For example, the hash chain of (1, 2, 3, 4) is H(H(H(1, 2), 3), 4).
#
# Fix the function `hash_chain` to correctly implement the
# hash chain. Run your code to test it.
#
# Note: Don't use starkware.cairo.common.hash_chain (it computes the chain differently).

from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.hash import hash2

# Computes the Pedersen hash chain on an array of size `length` starting from `data_ptr`.
func hash_chain{hash_ptr : HashBuiltin*}(data_ptr : felt*, length : felt) -> (result : felt):
    if length == 2:
        let (result) = hash2(x=[data_ptr], y=[data_ptr + 1])
        return (result=result)
    else:
        let (lhs) = hash_chain(data_ptr, length - 1)
        let (res) = hash2(x=lhs, y=[data_ptr + length - 1])
        return (result=res)
    end
end
