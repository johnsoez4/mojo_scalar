#!/bin/bash

# Test runner for mojo_scalar tests using Mojo standard testing conventions
# This script uses the `mojo test` command to discover and run test_ functions

echo "🧪 Running mojo_scalar Test Suite"
echo "=================================="
echo "📋 Setting up test environment..."

# Verify symlink exists
if [ ! -L "mojo_scalar" ]; then
    echo "❌ Error: mojo_scalar symlink not found!"
    echo "   Run: ln -s /home/johnsoe1/dev/EzProjects/ezThreading/src/mojo_scalar mojo_scalar"
    exit 1
fi

# Copy scalar.mojo from symlink to test directory
cp mojo_scalar/scalar.mojo .

echo "🚀 Running comprehensive scalar tests with mojo test..."
echo "   Using Mojo standard testing conventions (test_ prefixed functions)"

# Run tests using mojo test command (discovers test_ functions automatically)
mojo test test_scalars.mojo

# Store exit code to return proper status
test_exit_code=$?

echo "🧹 Cleaning up..."
rm scalar.mojo

echo ""
if [ $test_exit_code -eq 0 ]; then
    echo "✅ Test suite completed successfully!"
else
    echo "❌ Test suite failed!"
fi

# Exit with the same code as the test run
exit $test_exit_code
