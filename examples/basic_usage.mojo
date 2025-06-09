#!/usr/bin/env mojo

"""
Basic usage examples for the Scalar implementation.
"""

from scalar import Scalar, ScalarInt32, ScalarFloat64, ScalarBool

fn test_arithmetic():
    """Demonstrate basic arithmetic operations."""
    print("=== Arithmetic Operations ===")
    
    var a = ScalarInt32(42)
    var b = ScalarInt32(10)
    
    print("a =", a)
    print("b =", b)
    print("a + b =", a + b)
    print("a - b =", a - b)
    print("a * b =", a * b)
    print("a / b =", a / b)
    print("a % b =", a % b)

fn test_comparisons():
    """Demonstrate comparison operations."""
    print("\n=== Comparison Operations ===")
    
    var x = ScalarFloat64(3.14)
    var y = ScalarFloat64(2.71)
    
    print("x =", x)
    print("y =", y)
    print("x == y:", x == y)
    print("x != y:", x != y)
    print("x < y:", x < y)
    print("x <= y:", x <= y)
    print("x > y:", x > y)
    print("x >= y:", x >= y)

fn test_type_casting():
    """Demonstrate type casting between different scalar types."""
    print("\n=== Type Casting ===")
    
    var int_val = ScalarInt32(42)
    var float_val = int_val.cast[DType.float64]()
    var bool_val = ScalarBool(True)
    
    print("Original int:", int_val)
    print("Cast to float:", float_val)
    print("Bool value:", bool_val)

fn test_list_compatibility():
    """Demonstrate compatibility with List containers."""
    print("\n=== List Compatibility ===")
    
    var numbers = List[ScalarInt32]()
    numbers.append(ScalarInt32(1))
    numbers.append(ScalarInt32(2))
    numbers.append(ScalarInt32(3))
    
    print("List size:", len(numbers))
    print("First element:", numbers[0])
    print("Last element:", numbers[len(numbers) - 1])
    
    # Test searching
    var target = ScalarInt32(2)
    var found = False
    for i in range(len(numbers)):
        if numbers[i] == target:
            found = True
            print("Found", target, "at index", i)
            break
    
    if not found:
        print("Target not found")

fn main():
    """Main function demonstrating all features."""
    print("Mojo Scalar Library - Basic Usage Examples")
    print("=" * 50)
    
    test_arithmetic()
    test_comparisons()
    test_type_casting()
    test_list_compatibility()
    
    print("\n" + "=" * 50)
    print("All examples completed successfully!")
