%lang starknet

from src.structs import empty_stack, push, pop, stack_at

@external
func test_stack():
    alloc_locals
    # Start with an empty stack.
    let (stack) = empty_stack()
    # Push 1, 10, 100.
    let (stack) = push(stack, 1)
    let (stack) = push(stack, 10)
    let (local stack) = push(stack, 100)

    # Check the size of the stack.
    assert stack.size = 3

    # Query the stack at indices 0, 1 and 2.
    let (value) = stack_at(stack, 0)
    assert value = 100
    let (value) = stack_at(stack, 1)
    assert value = 10
    let (value) = stack_at(stack, 2)
    assert value = 1

    # Pop the top 2 values (100 and 10) and push 1000.
    let (stack, value) = pop(stack)
    assert value = 100
    let (stack, value) = pop(stack)
    assert value = 10
    let (local stack) = push(stack, 1000)

    # Query the stack at indices 0 and 1.
    let (value) = stack_at(stack, 0)
    assert value = 1000
    let (value) = stack_at(stack, 1)
    assert value = 1

    return ()
end
