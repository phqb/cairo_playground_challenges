%lang starknet

from src.revoked_references import step2, step4, step5, step6

@external
func test_steps():
    let (res) = step2()
    assert res = 1125
    let (res) = step4()
    assert res = 1125
    let (res) = step5()
    assert res = 1125
    let (res) = step6()
    assert res = 1125
    return ()
end
