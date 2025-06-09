# Mojo Scalar

A Scalar struct implementation for Mojo that wraps `SIMD[dtype, 1]` with enhanced trait support including `EqualityComparable` and `Comparable`.

## Overview

This library provides a `Scalar[dtype]` struct that wraps Mojo's `SIMD[dtype, 1]` type while implementing additional traits that make it more compatible with generic containers and comparison operations.

## Features

- **Enhanced Trait Support**: Implements `EqualityComparable` and `Comparable` traits with proper `Bool` return types
- **SIMD Delegation**: All SIMD operations are delegated to the internal `SIMD[dtype, 1]` value for optimal performance
- **Type Safety**: Comprehensive type aliases for all DType variants
- **Compatibility**: Works seamlessly with Mojo's generic containers like `List[T]`

## Key Problem Solved

Mojo's built-in scalar types like `UInt64` (which are `SIMD[dtype, 1]`) don't always conform to the traits required by generic containers. This library provides a wrapper that ensures full trait compliance while maintaining performance.

## Usage

```mojo
from scalar import Scalar, ScalarInt32, ScalarFloat64

# Create scalar values
var a = ScalarInt32(42)
var b = ScalarInt32(10)

# Arithmetic operations
var sum = a + b
var diff = a - b
var prod = a * b

# Comparison operations (return Bool, not SIMD[bool, 1])
var is_equal = a == b  # Returns Bool
var is_greater = a > b  # Returns Bool

# Works with generic containers
var numbers = List[ScalarInt32]()
numbers.append(a)
numbers.append(b)

# Type casting
var float_val = a.cast[DType.float64]()
```

## Available Type Aliases

- `ScalarBool`, `ScalarInt8`, `ScalarUInt8`
- `ScalarInt16`, `ScalarUInt16`, `ScalarInt32`, `ScalarUInt32`
- `ScalarInt64`, `ScalarUInt64`, `ScalarInt128`, `ScalarUInt128`
- `ScalarInt256`, `ScalarUInt256`
- `ScalarFloat16`, `ScalarFloat32`, `ScalarFloat64`

## Implementation Details

### TSIMD Trait

The library defines a `TSIMD` trait that encompasses the main traits implemented by SIMD:
- `Copyable`, `Movable`, `Stringable`, `Representable`, `Hashable`, `Boolable`

### Scalar Struct

The `Scalar[dtype: DType]` struct:
- Contains a `value: SIMD[dtype, 1]` field
- Implements `TSIMD`, `EqualityComparable`, and `Comparable` traits
- Provides constructors for various input types
- Delegates all operations to the internal SIMD value

### Comparison Methods

The key innovation is in the comparison methods (`__eq__`, `__ne__`, `__lt__`, `__le__`, `__gt__`, `__ge__`) which:
1. Call the corresponding SIMD method
2. Extract the first element `[0]` to convert from `SIMD[bool, 1]` to `Bool`
3. Return the single `Bool` value as required by the traits

## Installation

Simply copy `scalar.mojo` to your project and import the types you need.

## License

Apache-2.0 License - see LICENSE file for details.

## Contributing

Contributions are welcome! Please feel free to submit issues and pull requests.
