# The function `abs_eq` should return 1 if its inputs
# are equal or differ only in sign and 0 otherwise.
# Its current implementation is incorrect.
#
# 1. Click on "Run" to see the where it fails.
# 2. Fix the body of `abs_eq`, so that the
#    program terminates successfully.

# Returns 1 if |x| = |y| (that is, x = y or x = -y),
# 0 otherwise.
func abs_eq(x : felt, y : felt) -> (bit : felt):
    if x == -y:
        return (bit=1)
    end
    if x == y:
        return (bit=1)
    end
    return (bit=0)
end
