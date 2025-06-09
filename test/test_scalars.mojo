#!/usr/bin/env mojo
"""
Comprehensive tests for all scalar types.
"""

from builtin.dtype import DType
from builtin.bool import Bool
from collections.list import List
from scalar import Scalar, ScalarBool, ScalarInt32, ScalarInt64, ScalarFloat64

fn main():
    print("🧪 Starting Comprehensive Scalar Type Tests")
    print("=" * 50)
    
    var passed = 0
    var total = 0
    
    # Test ScalarBool
    print("\n🔬 Testing ScalarBool")
    var bool_true = ScalarBool(True)
    var bool_false = ScalarBool(False)
    
    if bool_true == bool_true:
        print("✓ ScalarBool equality works")
        passed += 1
    else:
        print("✗ ScalarBool equality failed")
    total += 1
    
    if bool_true != bool_false:
        print("✓ ScalarBool inequality works")
        passed += 1
    else:
        print("✗ ScalarBool inequality failed")
    total += 1
    
    # Test ScalarInt32
    print("\n🔬 Testing ScalarInt32")
    var int_a = ScalarInt32(10)
    var int_b = ScalarInt32(5)
    
    var sum_result = int_a + int_b
    if sum_result == ScalarInt32(15):
        print("✓ ScalarInt32 addition works")
        passed += 1
    else:
        print("✗ ScalarInt32 addition failed")
    total += 1
    
    if int_a > int_b:
        print("✓ ScalarInt32 comparison works")
        passed += 1
    else:
        print("✗ ScalarInt32 comparison failed")
    total += 1
    
    # Test ScalarInt64 with List
    print("\n🔬 Testing ScalarInt64 with List")
    var list_vals = List[ScalarInt64]()
    var val1 = ScalarInt64(42)
    var val2 = ScalarInt64(84)
    
    list_vals.append(val1)
    list_vals.append(val2)
    
    if len(list_vals) == 2:
        print("✓ ScalarInt64 List operations work")
        passed += 1
    else:
        print("✗ ScalarInt64 List operations failed")
    total += 1
    
    # Test ScalarFloat64
    print("\n🔬 Testing ScalarFloat64")
    var float_a = ScalarFloat64(3.14)
    var float_b = ScalarFloat64(2.71)
    
    var div_result = float_a / float_b
    if div_result > ScalarFloat64(1.0):
        print("✓ ScalarFloat64 division works")
        passed += 1
    else:
        print("✗ ScalarFloat64 division failed")
    total += 1
    
    # Test type casting
    print("\n🔬 Testing Type Casting")
    var original = ScalarInt32(42)
    var as_int64 = original.cast[DType.int64]()
    var as_float64 = original.cast[DType.float64]()
    
    if as_int64 == ScalarInt64(42):
        print("✓ Type casting to int64 works")
        passed += 1
    else:
        print("✗ Type casting to int64 failed")
    total += 1
    
    # Test bitwise operations
    print("\n🔬 Testing Bitwise Operations")
    var bit_a = ScalarInt32(12)  # 1100 in binary
    var bit_b = ScalarInt32(10)  # 1010 in binary
    
    var and_result = bit_a & bit_b  # Should be 8 (1000)
    var or_result = bit_a | bit_b   # Should be 14 (1110)
    var xor_result = bit_a ^ bit_b  # Should be 6 (0110)
    
    if and_result == ScalarInt32(8):
        print("✓ Bitwise AND works")
        passed += 1
    else:
        print("✗ Bitwise AND failed")
    total += 1
    
    if or_result == ScalarInt32(14):
        print("✓ Bitwise OR works")
        passed += 1
    else:
        print("✗ Bitwise OR failed")
    total += 1
    
    if xor_result == ScalarInt32(6):
        print("✓ Bitwise XOR works")
        passed += 1
    else:
        print("✗ Bitwise XOR failed")
    total += 1
    
    # Print summary
    print("\n" + "=" * 50)
    print("=== Test Results ===")
    print("Passed:", passed)
    print("Failed:", total - passed)
    print("Total:", total)
    
    if passed == total:
        print("🎉 All scalar types are working correctly!")
    else:
        print("⚠️  Some tests failed - check implementation!")
