# In this challenge you're going to implement a stack using a linked list.
#
# Add the missing code so that main() runs successfully.

from starkware.cairo.common.registers import get_fp_and_pc

struct Node:
    # A pointer to the next node in the stack.
    member next : Node*

    # The value of the node.
    member value : felt

    # The number of elements in the stack.
    member size : felt
end

# Returns an empty stack.
func empty_stack() -> (stack : Node*):
    alloc_locals
    local new_node : Node
    assert new_node.next = cast(0, Node*)
    assert new_node.value = 0
    assert new_node.size = 0

    # The usage of get_fp_and_pc() here is necessary in order
    # to access the address of a local variable (&new_node).
    # You can read more about get_fp_and_pc() [here](https://cairo-lang.org/docs/how_cairo_works/functions.html#retrieving-registers).
    let (local __fp__, _) = get_fp_and_pc()
    return (stack=&new_node)
end

# Adds a node to the top of the stack.
# Returns the updated stack (since Cairo is immutable, you can still use the
# old copy of the stack).
func push(stack : Node*, value : felt) -> (stack : Node*):
    alloc_locals
    local new_node : Node
    # Fix and uncomment below.
    assert new_node.next = stack
    assert new_node.value = value
    assert new_node.size = stack.size + 1

    let (__fp__, _) = get_fp_and_pc()
    return (stack=&new_node)
end

# Removes the top element of the stack.
# Returns the updated stack and the element that was removed.
func pop(stack : Node*) -> (stack : Node*, value : felt):
    return (stack=stack.next, value=stack.value)
end

# Returns the value of the n-th element from the top of the stack.
func stack_at(stack : Node*, n : felt) -> (value : felt):
    if n == 0:
        return (stack.value)
    end

    let (res) = stack_at(stack.next, n - 1)
    return (res)
end
