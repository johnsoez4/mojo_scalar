"""
Scalar types based on SIMD[_, size=1] with enhanced trait support.

This module provides a Scalar struct that wraps SIMD[dtype, 1] and implements
all SIMD traits plus EqualityComparable and Comparable traits with proper
Bool return types for comparison operations.
"""

from builtin.simd import SIMD
from builtin.dtype import DType
from builtin.comparable import Comparable
from builtin.equality_comparable import EqualityComparable
from builtin.bool import Bool

# Type aliases for all DType scalar types
alias ScalarBool = Scalar[DType.bool]
alias ScalarInt8 = Scalar[DType.int8]
alias ScalarUInt8 = Scalar[DType.uint8]
alias ScalarInt16 = Scalar[DType.int16]
alias ScalarUInt16 = Scalar[DType.uint16]
alias ScalarInt32 = Scalar[DType.int32]
alias ScalarUInt32 = Scalar[DType.uint32]
alias ScalarInt64 = Scalar[DType.int64]
alias ScalarUInt64 = Scalar[DType.uint64]
alias ScalarInt128 = Scalar[DType.int128]
alias ScalarUInt128 = Scalar[DType.uint128]
alias ScalarInt256 = Scalar[DType.int256]
alias ScalarUInt256 = Scalar[DType.uint256]
alias ScalarFloat16 = Scalar[DType.float16]
alias ScalarFloat32 = Scalar[DType.float32]
alias ScalarFloat64 = Scalar[DType.float64]


# Define the TSIMD trait that includes the main traits from SIMD
trait TSIMD(
    Copyable,
    Movable,
    Stringable,
    Representable,
    Hashable,
    Boolable,
    Writable,
):
    """Trait that encompasses the main traits implemented by SIMD."""

    pass


struct Scalar[dtype: DType](TSIMD, EqualityComparable, Comparable):
    """
    A scalar value that wraps SIMD[dtype, 1] and provides enhanced trait support.

    This struct implements all SIMD traits plus EqualityComparable and Comparable
    with proper Bool return types for comparison operations.

    Parameters:
        dtype: The data type of the scalar value.
    """

    var value: SIMD[dtype, 1]

    # Constructors
    fn __init__(out self):
        """Default constructor initializing to zero."""
        self.value = SIMD[dtype, 1]()

    fn __init__(out self, value: SIMD[dtype, 1]):
        """Initialize from a SIMD[dtype, 1] value."""
        self.value = value

    fn __init__[other_dtype: DType](out self, value: SIMD[other_dtype, 1]):
        """Initialize from another SIMD scalar with type conversion."""
        self.value = value.cast[dtype]()

    fn __init__(out self, value: Int):
        """Initialize from an Int value."""
        self.value = SIMD[dtype, 1](value)

    fn __init__(out self, value: UInt):
        """Initialize from a UInt value."""
        self.value = SIMD[dtype, 1](value)

    fn __init__(out self, value: Bool):
        """Initialize from a Bool value."""
        if value:
            self.value = SIMD[dtype, 1](1)
        else:
            self.value = SIMD[dtype, 1](0)

    # EqualityComparable trait methods with Bool return types
    fn __eq__(self, other: Self) -> Bool:
        """Compare for equality, returning a single Bool value."""
        var simd_result = self.value.__eq__(other.value)
        return simd_result[0]

    fn __ne__(self, other: Self) -> Bool:
        """Compare for inequality, returning a single Bool value."""
        var simd_result = self.value.__ne__(other.value)
        return simd_result[0]

    # Comparable trait methods with Bool return types
    fn __lt__(self, other: Self) -> Bool:
        """Less than comparison, returning a single Bool value."""
        var simd_result = self.value.__lt__(other.value)
        return simd_result[0]

    fn __le__(self, other: Self) -> Bool:
        """Less than or equal comparison, returning a single Bool value."""
        var simd_result = self.value.__le__(other.value)
        return simd_result[0]

    fn __gt__(self, other: Self) -> Bool:
        """Greater than comparison, returning a single Bool value."""
        var simd_result = self.value.__gt__(other.value)
        return simd_result[0]

    fn __ge__(self, other: Self) -> Bool:
        """Greater than or equal comparison, returning a single Bool value."""
        var simd_result = self.value.__ge__(other.value)
        return simd_result[0]

    # Delegate all other SIMD methods to the value field
    fn __bool__(self) -> Bool:
        """Convert to Bool."""
        return self.value.__bool__()

    fn __getitem__(self, idx: Int) -> SIMD[dtype, 1]:
        """Get element at index."""
        return self.value.__getitem__(idx)

    fn __setitem__(mut self, idx: Int, val: SIMD[dtype, 1]):
        """Set element at index."""
        self.value.__setitem__(idx, val)

    fn __neg__(self) -> Self:
        """Unary negation."""
        return Self(self.value.__neg__())

    fn __pos__(self) -> Self:
        """Unary positive."""
        return Self(self.value.__pos__())

    fn __invert__(self) -> Self:
        """Bitwise inversion."""
        return Self(self.value.__invert__())

    fn __add__(self, rhs: Self) -> Self:
        """Addition."""
        return Self(self.value.__add__(rhs.value))

    fn __sub__(self, rhs: Self) -> Self:
        """Subtraction."""
        return Self(self.value.__sub__(rhs.value))

    fn __mul__(self, rhs: Self) -> Self:
        """Multiplication."""
        return Self(self.value.__mul__(rhs.value))

    fn __truediv__(self, rhs: Self) -> Self:
        """True division."""
        return Self(self.value.__truediv__(rhs.value))

    fn __floordiv__(self, rhs: Self) -> Self:
        """Floor division."""
        return Self(self.value.__floordiv__(rhs.value))

    fn __mod__(self, rhs: Self) -> Self:
        """Modulo."""
        return Self(self.value.__mod__(rhs.value))

    fn __pow__(self, exp: Int) -> Self:
        """Power with integer exponent."""
        return Self(self.value.__pow__(exp))

    fn __pow__(self, exp: Self) -> Self:
        """Power with scalar exponent."""
        return Self(self.value.__pow__(exp.value))

    fn __lshift__(self, rhs: Self) -> Self:
        """Left shift."""
        return Self(self.value.__lshift__(rhs.value))

    fn __rshift__(self, rhs: Self) -> Self:
        """Right shift."""
        return Self(self.value.__rshift__(rhs.value))

    fn __and__(self, rhs: Self) -> Self:
        """Bitwise AND."""
        return Self(self.value.__and__(rhs.value))

    fn __or__(self, rhs: Self) -> Self:
        """Bitwise OR."""
        return Self(self.value.__or__(rhs.value))

    fn __xor__(self, rhs: Self) -> Self:
        """Bitwise XOR."""
        return Self(self.value.__xor__(rhs.value))

    # Reverse operators
    fn __radd__(self, value: Self) -> Self:
        """Reverse addition."""
        return Self(self.value.__radd__(value.value))

    fn __rsub__(self, value: Self) -> Self:
        """Reverse subtraction."""
        return Self(self.value.__rsub__(value.value))

    fn __rmul__(self, value: Self) -> Self:
        """Reverse multiplication."""
        return Self(self.value.__rmul__(value.value))

    fn __rtruediv__(self, value: Self) -> Self:
        """Reverse true division."""
        return Self(self.value.__rtruediv__(value.value))

    fn __rfloordiv__(self, rhs: Self) -> Self:
        """Reverse floor division."""
        return Self(self.value.__rfloordiv__(rhs.value))

    fn __rmod__(self, value: Self) -> Self:
        """Reverse modulo."""
        return Self(self.value.__rmod__(value.value))

    fn __rpow__(self, base: Self) -> Self:
        """Reverse power."""
        return Self(self.value.__rpow__(base.value))

    fn __rlshift__(self, value: Self) -> Self:
        """Reverse left shift."""
        return Self(self.value.__rlshift__(value.value))

    fn __rrshift__(self, value: Self) -> Self:
        """Reverse right shift."""
        return Self(self.value.__rrshift__(value.value))

    fn __rand__(self, value: Self) -> Self:
        """Reverse bitwise AND."""
        return Self(self.value.__rand__(value.value))

    fn __ror__(self, value: Self) -> Self:
        """Reverse bitwise OR."""
        return Self(self.value.__ror__(value.value))

    fn __rxor__(self, value: Self) -> Self:
        """Reverse bitwise XOR."""
        return Self(self.value.__rxor__(value.value))

    # In-place operators
    fn __iadd__(mut self, rhs: Self):
        """In-place addition."""
        self.value.__iadd__(rhs.value)

    fn __isub__(mut self, rhs: Self):
        """In-place subtraction."""
        self.value.__isub__(rhs.value)

    fn __imul__(mut self, rhs: Self):
        """In-place multiplication."""
        self.value.__imul__(rhs.value)

    fn __itruediv__(mut self, rhs: Self):
        """In-place true division."""
        self.value.__itruediv__(rhs.value)

    fn __ifloordiv__(mut self, rhs: Self):
        """In-place floor division."""
        self.value.__ifloordiv__(rhs.value)

    fn __imod__(mut self, rhs: Self):
        """In-place modulo."""
        self.value.__imod__(rhs.value)

    fn __ipow__(mut self, rhs: Int):
        """In-place power with integer exponent."""
        self.value.__ipow__(rhs)

    fn __ilshift__(mut self, rhs: Self):
        """In-place left shift."""
        self.value.__ilshift__(rhs.value)

    fn __irshift__(mut self, rhs: Self):
        """In-place right shift."""
        self.value.__irshift__(rhs.value)

    fn __iand__(mut self, rhs: Self):
        """In-place bitwise AND."""
        self.value.__iand__(rhs.value)

    fn __ixor__(mut self, rhs: Self):
        """In-place bitwise XOR."""
        self.value.__ixor__(rhs.value)

    fn __ior__(mut self, rhs: Self):
        """In-place bitwise OR."""
        self.value.__ior__(rhs.value)

    # Additional trait methods
    fn __len__(self) -> Int:
        """Get length (always 1 for scalar)."""
        return self.value.__len__()

    fn __int__(self) -> Int:
        """Convert to Int."""
        return self.value.__int__()

    fn __index__(self) -> Int:
        """Convert to index."""
        return self.value.__index__()

    fn __float__(self) -> SIMD[DType.float64, 1]:
        """Convert to Float64."""
        return self.value.__float__()

    fn __str__(self) -> String:
        """Convert to String."""
        return self.value.__str__()

    fn __repr__(self) -> String:
        """Get representation."""
        return self.value.__repr__()

    fn __floor__(self) -> Self:
        """Floor operation."""
        return Self(self.value.__floor__())

    fn __ceil__(self) -> Self:
        """Ceiling operation."""
        return Self(self.value.__ceil__())

    fn __trunc__(self) -> Self:
        """Truncation operation."""
        return Self(self.value.__trunc__())

    fn __abs__(self) -> Self:
        """Absolute value."""
        return Self(self.value.__abs__())

    fn __round__(self) -> Self:
        """Round to nearest integer."""
        return Self(self.value.__round__())

    fn __round__(self, ndigits: Int) -> Self:
        """Round to specified number of digits."""
        return Self(self.value.__round__(ndigits))

    fn __hash__(self) -> UInt:
        """Hash the value."""
        return self.value.__hash__()

    fn __ceildiv__(self, denominator: Self) -> Self:
        """Ceiling division."""
        return Self(self.value.__ceildiv__(denominator.value))

    # Additional utility methods
    fn copy(self) -> Self:
        """Create a copy."""
        return Self(self.value.copy())

    fn cast[target: DType](self) -> Scalar[target]:
        """Cast to different dtype."""
        return Scalar[target](self.value.cast[target]())

    fn write_to[W: Writer](self, mut writer: W):
        """Write to a Writer."""
        self.value.write_to(writer)
