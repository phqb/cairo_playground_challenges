# Returns a^3 for a != 0 and 1 otherwise.
func foo(a) -> (res):
    if a == 0:
        return (res=1)
    else:
        return (res=a * a * a)
    end
end
