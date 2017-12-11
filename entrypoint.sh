#!/bin/sh

echo github.com >> ~/.ssh/known_hosts

chromium-browser --version

echo "Installing dependencies..."
npm install

echo "Starting development server..."
npm start
