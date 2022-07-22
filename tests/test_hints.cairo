%lang starknet

# The following function uses hints to efficiently compute the square root `res`
# of the argument `n`.
# The idea is that the verifier only needs to be convinced that res * res = n,
# it doesn't really care how res was computed.
# In such cases, we don't have to compute res in pure Cairo - we can write a
# piece of python code inside the Cairo program, which is called a "hint".
# A hint is a piece of code that the prover runs to initialize
# some memory cells. Note that it is completely transparent from the verifier's
# point of view, so the result of the hint *must* be verified using pure Cairo
# instructions (e.g., the "assert n = res * res" instruction below).
#
# 1. Comment out the line "assert n = res * res" and run the code. Does it still output
#    the expected value? Can you explain why the assert is nonetheless essential?
#    Hint: Recall that from the verifier's point of view, the hint does not exist.
# 2. Uncomment the assert line and change the function to compute the fourth
#    root.

from src.hints import sqrt, fourth_root

@external
func test_hints():
    let (res) = sqrt(256)
    %{ print(ids.res) %}
    let (res) = fourth_root(256)
    %{ print(ids.res) %}
    return ()
end
