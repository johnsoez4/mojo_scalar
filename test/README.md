# mojo_scalar Test Suite

This directory contains comprehensive tests for all scalar types in the mojo_scalar library, following **Mojo standard testing conventions** with `test_` prefixed functions that work with the `mojo test` command.

## Test Structure

The test suite follows Mojo's standard testing conventions:
- **Test functions** are prefixed with `test_` for automatic discovery
- **Uses `mojo test` command** for running tests
- **Built-in assertions** with descriptive error messages
- **Modular test organization** for better maintainability

## Test Coverage

### ✅ **Test Functions**
- `test_scalar_bool()` - Boolean scalar operations and bitwise logic
- `test_scalar_int_types()` - Integer arithmetic and comparisons
- `test_scalar_float_types()` - Floating-point operations
- `test_scalar_list_compatibility()` - Container compatibility (main library goal)
- `test_scalar_type_casting()` - Cross-type conversions
- `test_scalar_bitwise_operations()` - Bitwise and shift operations
- `test_scalar_constructors()` - Constructor patterns and validation

The test suite covers:

### ✅ **Scalar Types Tested**
- `ScalarBool` - Boolean scalar operations
- `ScalarInt8`, `ScalarInt16`, `ScalarInt32`, `ScalarInt64` - Signed integer scalars
- `ScalarUInt8`, `ScalarUInt16`, `ScalarUInt32`, `ScalarUInt64` - Unsigned integer scalars
- `ScalarFloat32`, `ScalarFloat64` - Floating-point scalars

### ✅ **Functionality Tested**
1. **Constructor Tests**
   - Default constructor: `Scalar[dtype]()`
   - Value constructor: `Scalar[dtype](value)`
   - Bool constructor: `Scalar[dtype](True/False)`

2. **Arithmetic Operations**
   - Addition (`+`), Subtraction (`-`), Multiplication (`*`)
   - Division (`/`), Floor Division (`//`), Modulo (`%`)
   - Unary operations (`+`, `-`)

3. **Comparison Operations**
   - Equality (`==`), Inequality (`!=`)
   - Ordering (`<`, `<=`, `>`, `>=`)
   - Bool return types (not SIMD[bool, 1])

4. **Bitwise Operations** (Integer types only)
   - AND (`&`), OR (`|`), XOR (`^`)
   - NOT (`~`), Left Shift (`<<`), Right Shift (`>>`)

5. **Container Compatibility** ⭐ **Main Library Goal**
   - `List[Scalar[dtype]]` operations
   - Append, search, length operations
   - Demonstrates the core problem solved by this library

6. **Type Casting**
   - `cast[target_dtype]()` method
   - Cross-type conversions between different scalar types

## Running Tests

### Quick Test
```bash
./run_tests.sh
```

### Using Mojo Test Command
```bash
# Copy scalar.mojo to test directory
cp ../scalar.mojo .

# Run tests using Mojo standard testing
mojo test test_scalars.mojo

# Clean up
rm scalar.mojo
```

### Direct Function Testing
```bash
# Run individual test functions
mojo test test_scalars.mojo::test_scalar_bool
mojo test test_scalars.mojo::test_scalar_list_compatibility
```

## Test Results

The test suite validates that:

1. **✅ All scalar types work with generic containers** (main library goal)
2. **✅ Comparison operations return proper Bool types** (not SIMD[bool, 1])
3. **✅ All arithmetic and bitwise operations function correctly**
4. **✅ Type casting works between different scalar types**
5. **✅ Constructor variants handle different input types**

## Expected Output

```
🧪 Starting Comprehensive Scalar Type Tests
==================================================

🔬 Testing ScalarBool
✓ ScalarBool equality works
✓ ScalarBool inequality works

🔬 Testing ScalarInt32
✓ ScalarInt32 addition works
✓ ScalarInt32 comparison works

🔬 Testing ScalarInt64 with List
✓ ScalarInt64 List operations work

🔬 Testing ScalarFloat64
✓ ScalarFloat64 division works

🔬 Testing Type Casting
✓ Type casting to int64 works

🔬 Testing Bitwise Operations
✓ Bitwise AND works
✓ Bitwise OR works
✓ Bitwise XOR works

==================================================
=== Test Results ===
Passed: 10
Failed: 0
Total: 10
🎉 All scalar types are working correctly!
```
