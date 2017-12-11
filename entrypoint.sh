#!/bin/sh

chromium-browser --version

echo "Installing dependencies..."
npm install

echo "Starting development server..."
npm start
