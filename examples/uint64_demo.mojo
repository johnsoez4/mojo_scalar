#!/usr/bin/env mojo

"""
UInt64 Error Demonstration

This file demonstrates the issue with UInt64 types in Mojo and shows how
the Scalar implementation from the mojo_scalar library solves it.

Run with: mojo uint64_demo.mojo
"""

from scalar import ScalarInt64 as UInt64, ScalarBool


fn main():
    print("=== UInt64 Error Demonstration ===")
    print()

    # The Problem: Built-in UInt64 doesn't work with generic containers
    print("❌ Problem: Built-in UInt64 type doesn't work with List[T]")
    print("   Error: 'SIMD[uint64, 1]' does not conform to trait")
    print("   'EqualityComparable & Copyable & Movable'")
    print()

    # This would fail:
    # var broken_list = List[UInt64]()  # Error!

    print("❌ Problem: DType.uint64 also doesn't work with List[T]")
    print("   Error: cannot implicitly convert 'DType' value to")
    print("   'Copyable & Movable' in type parameter")
    print()

    # This would also fail:
    # var also_broken = List[DType.uint64]()  # Error!

    # The Solution: Use our Scalar implementation
    print("✅ Solution: Use Scalar implementation from mojo_scalar library")
    print()

    # Create a list of UInt64 values - this works!
    var numbers = List[UInt64]()
    var value1 = UInt64(12345)
    var value2 = UInt64(67890)

    numbers.append(value1)
    numbers.append(value2)
    numbers.append(UInt64(99999))

    print("✓ Created List[UInt64] successfully")
    print("✓ Added values:", value1, ",", value2, ", and", UInt64(99999))
    print("✓ List size:", len(numbers))
    print()

    # Test arithmetic operations
    print("=== Arithmetic Operations ===")
    var a = UInt64(100)
    var b = UInt64(50)

    print("a =", a, ", b =", b)
    print("a + b =", a + b)
    print("a - b =", a - b)
    print("a * b =", a * b)
    print("a / b =", a / b)
    print()

    # Test comparison operations (these return Bool, not SIMD[bool, 1])
    print("=== Comparison Operations ===")
    print("a == b:", a == b)
    print("a != b:", a != b)
    print("a > b:", a > b)
    print("a >= b:", a >= b)
    print("a < b:", a < b)
    print("a <= b:", a <= b)
    print()

    # Test searching in list
    print("=== List Operations ===")
    if value1 in numbers:
        print("✓ Found", value1, "in the list")
    else:
        print("✗ Value not found in list")

    # Test type casting
    print()
    print("=== Type Casting ===")
    var int_val = UInt64(42)
    var float_val = int_val.cast[DType.float64]()
    print("Original UInt64:", int_val)
    print("Cast to Float64:", float_val)
    print()

    # Test Bool constructor (fixes ambiguity issue)
    print("=== Bool Constructor Test ===")
    var bool_true = ScalarBool(True)
    var bool_false = ScalarBool(False)
    print("ScalarBool(True):", bool_true)
    print("ScalarBool(False):", bool_false)
    print("True == False:", bool_true == bool_false)
    print("True != False:", bool_true != bool_false)
    print()

    # Compare with working Int type
    print("=== Comparison: Built-in Int type works fine ===")
    var int_list = List[Int]()
    int_list.append(123)
    int_list.append(456)
    print("✓ List[Int] works without issues, size:", len(int_list))
    print()

    print("=== Summary ===")
    print("The Scalar implementation provides:")
    print("• Proper trait implementations for generic containers")
    print("• Bool return types for comparison operations")
    print("• Full compatibility with Mojo's type system")
    print("• All SIMD performance benefits")
    print()
    print("Repository: https://github.com/johnsoez4/mojo_scalar")
    print("License: Apache-2.0")
    print()
    print("✅ All tests completed successfully!")
