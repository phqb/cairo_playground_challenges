%lang starknet

from src.variables import step1, step2, step3

@external
func test_steps():
    let (z) = step1()
    assert z = 512
    let (z) = step2()
    assert z = 512
    let (z) = step3()
    assert z = 512
    return ()
end
