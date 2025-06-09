#!/bin/bash
echo "🧪 Running mojo_scalar Test Suite"
echo "=================================="
echo "📋 Setting up test environment..."
# Verify symlink exists
if [ ! -L "mojo_scalar" ]; then
    echo "❌ Error: mojo_scalar symlink not found!"
    echo "   Run: ln -s /home/johnsoe1/dev/EzProjects/ezThreading/src/mojo_scalar mojo_scalar"
    exit 1
fi
cp mojo_scalar/scalar.mojo .
echo "🚀 Running comprehensive scalar tests..."
mojo test_scalars.mojo
echo "🧹 Cleaning up..."
rm scalar.mojo
echo ""
echo "✅ Test suite completed!"
