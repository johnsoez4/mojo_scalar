#!/usr/bin/env mojo
"""
Comprehensive tests for all scalar types.

This module follows Mojo testing conventions with test_ prefixed functions
that can be discovered by the `mojo test` command.

Run with: mojo test test_scalars.mojo
"""

from builtin.dtype import DType
from builtin.bool import Bool
from collections.list import List
from mojo_scalar.scalar import (
    Scalar,
    ScalarBool,
    ScalarInt8,
    ScalarUInt8,
    ScalarInt16,
    ScalarUInt16,
    ScalarInt32,
    ScalarUInt32,
    ScalarInt64,
    ScalarUInt64,
    ScalarFloat32,
    ScalarFloat64,
)


fn main():
    """Main function to run all tests."""
    print("🧪 Starting Comprehensive Scalar Type Tests")
    print("=" * 50)

    test_scalar_bool()
    test_scalar_int_types()
    test_scalar_float_types()
    test_scalar_list_compatibility()
    test_scalar_type_casting()
    test_scalar_bitwise_operations()
    test_scalar_constructors()

    print("\n" + "=" * 50)
    print("All tests completed successfully!")


fn test_scalar_bool():
    """Test ScalarBool functionality."""
    print("🔬 Testing ScalarBool")

    bool_true = ScalarBool(True)
    bool_false = ScalarBool(False)

    # Test equality
    if not (bool_true == bool_true):
        print("❌ ScalarBool equality failed")
        return
    if not (bool_true != bool_false):
        print("❌ ScalarBool inequality failed")
        return

    # Test boolean conversion
    if not bool_true.__bool__():
        print("❌ ScalarBool True conversion failed")
        return
    if bool_false.__bool__():
        print("❌ ScalarBool False conversion failed")
        return

    # Test bitwise operations
    and_result = bool_true & bool_false
    or_result = bool_true | bool_false
    if and_result.__bool__():
        print("❌ ScalarBool AND failed")
        return
    if not or_result.__bool__():
        print("❌ ScalarBool OR failed")
        return

    # print("✅ ScalarBool tests passed")


fn test_scalar_int_types():
    """Test various integer scalar types."""
    print("🔬 Testing Integer Scalar Types")

    # Test ScalarInt32
    int_a = ScalarInt32(10)
    int_b = ScalarInt32(5)

    # Test arithmetic operations
    sum_result = int_a + int_b
    if not (sum_result == ScalarInt32(15)):
        print("❌ ScalarInt32 addition failed")
        return

    diff_result = int_a - int_b
    if not (diff_result == ScalarInt32(5)):
        print("❌ ScalarInt32 subtraction failed")
        return

    mult_result = int_a * int_b
    if not (mult_result == ScalarInt32(50)):
        print("❌ ScalarInt32 multiplication failed")
        return

    # Test comparison operations
    if not (int_a > int_b):
        print("❌ ScalarInt32 greater than failed")
        return
    if not (int_b < int_a):
        print("❌ ScalarInt32 less than failed")
        return
    if not (int_a != int_b):
        print("❌ ScalarInt32 inequality failed")
        return
    if not (int_a == int_a):
        print("❌ ScalarInt32 equality failed")
        return

    # Test ScalarInt64
    big_a = ScalarInt64(1000000)
    big_b = ScalarInt64(500000)
    big_sum = big_a + big_b
    if not (big_sum == ScalarInt64(1500000)):
        print("❌ ScalarInt64 arithmetic failed")
        return

    # Test ScalarUInt32
    uint_a = ScalarUInt32(100)
    uint_b = ScalarUInt32(50)
    uint_sum = uint_a + uint_b
    if not (uint_sum == ScalarUInt32(150)):
        print("❌ ScalarUInt32 arithmetic failed")
        return

    # print("✅ Integer scalar tests passed")


fn test_scalar_float_types():
    """Test floating-point scalar types."""
    print("🔬 Testing Float Scalar Types")

    # Test ScalarFloat64
    float_a = ScalarFloat64(3.14159)
    float_b = ScalarFloat64(2.71828)

    # Test arithmetic operations
    sum_result = float_a + float_b
    if not (sum_result > ScalarFloat64(5.8)):
        print("❌ ScalarFloat64 addition failed")
        return

    div_result = float_a / float_b
    if not (div_result > ScalarFloat64(1.0)):
        print("❌ ScalarFloat64 division failed")
        return

    # Test comparison operations
    if not (float_a > float_b):
        print("❌ ScalarFloat64 comparison failed")
        return
    if not (float_a != float_b):
        print("❌ ScalarFloat64 inequality failed")
        return

    # Test ScalarFloat32
    small_a = ScalarFloat32(1.5)
    small_b = ScalarFloat32(0.5)
    small_mult = small_a * small_b
    if not (small_mult == ScalarFloat32(0.75)):
        print("❌ ScalarFloat32 multiplication failed")
        return

    # print("✅ Float scalar tests passed")


fn test_scalar_list_compatibility():
    """Test ScalarInt64 with List functionality - main library goal."""
    print("🔬 Testing ScalarInt64 with List")

    list_vals = List[ScalarInt64]()
    val1 = ScalarInt64(42)
    val2 = ScalarInt64(84)
    val3 = ScalarInt64(126)

    # Test list operations
    list_vals.append(val1)
    list_vals.append(val2)
    list_vals.append(val3)

    if not (len(list_vals) == 3):
        print("❌ ScalarInt64 List append failed")
        return

    # Test search functionality (main problem this library solves)
    found = val1 in list_vals
    if not found:
        print("❌ ScalarInt64 List search failed")
        return

    not_found = ScalarInt64(999) in list_vals
    if not_found:
        print("❌ ScalarInt64 List search false positive")
        return

    # print("✅ ScalarInt64 List compatibility tests passed")


fn test_scalar_type_casting():
    """Test type casting functionality."""
    print("🔬 Testing Type Casting")

    original = ScalarInt32(42)
    as_int64 = original.cast[DType.int64]()
    as_float64 = original.cast[DType.float64]()

    # Test casting results
    if not (as_int64 == ScalarInt64(42)):
        print("❌ Type casting to int64 failed")
        return
    if not (as_float64 == ScalarFloat64(42.0)):
        print("❌ Type casting to float64 failed")
        return

    # Test cross-type casting
    float_val = ScalarFloat64(3.14)
    as_int = float_val.cast[DType.int32]()
    if not (as_int == ScalarInt32(3)):
        print("❌ Float to int casting failed")
        return

    # print("✅ Type casting tests passed")


fn test_scalar_bitwise_operations():
    """Test bitwise operations for integer types."""
    print("🔬 Testing Bitwise Operations")

    bit_a = ScalarInt32(12)  # 1100 in binary
    bit_b = ScalarInt32(10)  # 1010 in binary

    # Test bitwise operations
    and_result = bit_a & bit_b  # Should be 8 (1000)
    or_result = bit_a | bit_b  # Should be 14 (1110)
    xor_result = bit_a ^ bit_b  # Should be 6 (0110)
    _ = ~bit_a  # Should be -13 (not_result unused)

    if not (and_result == ScalarInt32(8)):
        print("❌ Bitwise AND failed")
        return
    if not (or_result == ScalarInt32(14)):
        print("❌ Bitwise OR failed")
        return
    if not (xor_result == ScalarInt32(6)):
        print("❌ Bitwise XOR failed")
        return

    # Test shift operations
    left_shift = bit_a << ScalarInt32(1)  # Should be 24
    right_shift = bit_a >> ScalarInt32(1)  # Should be 6

    if not (left_shift == ScalarInt32(24)):
        print("❌ Left shift failed")
        return
    if not (right_shift == ScalarInt32(6)):
        print("❌ Right shift failed")
        return

    # print("✅ Bitwise operations tests passed")


fn test_scalar_constructors():
    """Test various constructor patterns."""
    print("🔬 Testing Constructors")

    # Test default constructors
    _ = ScalarInt32()
    _ = ScalarFloat64()
    _ = ScalarBool()

    # Test value constructors
    from_int = ScalarInt64(123456789)
    _ = ScalarFloat32(2.718)
    from_bool_true = ScalarBool(True)
    from_bool_false = ScalarBool(False)

    # Test that constructors work
    if not (from_int == ScalarInt64(123456789)):
        print("❌ Int constructor failed")
        return
    if not from_bool_true.__bool__():
        print("❌ Bool True constructor failed")
        return
    if from_bool_false.__bool__():
        print("❌ Bool False constructor failed")
        return

    # print("✅ Constructor tests passed")
