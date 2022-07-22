from starkware.cairo.common.bitwise import bitwise_and, bitwise_xor
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin

# Returns the xor of the last two hexadecimal digits.
func xor_last_hex_digits{bitwise_ptr : BitwiseBuiltin*}(x : felt) -> (res : felt):
    # Fix and uncomment the line below.
    let (digit0) = bitwise_and(x, 0xF)

    let (shifted_digit1) = bitwise_and(x, 0xF0)
    tempvar digit1 = shifted_digit1 / 0x10

    let (res) = bitwise_xor(digit0, digit1)
    return (res)
end
