func step1() -> (z : felt):
    tempvar x = 2
    let y = x * x * x
    let z = y * y * y
    # Because of the `let`s, the following line is equivalent to
    # serialize_word(x * x * x * x * x * x * x * x * x).
    return (z=z)
end

func step2() -> (z : felt):
    tempvar x = 2
    tempvar y = x * x * x
    tempvar z = y * y * y
    return (z=z)
end

func step3() -> (z : felt):
    alloc_locals
    local x = 2
    local y = x * x * x
    local z = y * y * y
    return (z=z)
end
