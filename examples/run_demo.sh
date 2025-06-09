#!/bin/bash

# Script to run the uint64_demo.mojo example
# This handles the scalar.mojo dependency automatically

echo "Running UInt64 Demo..."
echo "======================"

# Copy scalar.mojo to current directory
cp ../scalar.mojo .

# Run the demo
mojo uint64_demo.mojo

# Clean up
rm scalar.mojo

echo ""
echo "Demo completed!"
