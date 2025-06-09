#!/bin/bash
echo "🧪 Running mojo_scalar Test Suite"
echo "=================================="
echo "📋 Setting up test environment..."
cp ../scalar.mojo .
echo "🚀 Running comprehensive scalar tests..."
mojo test_scalars.mojo
echo "🧹 Cleaning up..."
rm scalar.mojo
echo ""
echo "✅ Test suite completed!"
