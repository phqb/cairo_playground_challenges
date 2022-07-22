%lang starknet

from starkware.cairo.common.cairo_builtins import BitwiseBuiltin

from src.bitwise_operations import xor_last_hex_digits

@external
func test_xor_last_hex_degits{bitwise_ptr : BitwiseBuiltin*}():
    let (res) = xor_last_hex_digits(0x1234)
    assert res = 7

    return ()
end
