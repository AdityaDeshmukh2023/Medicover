#!/bin/bash

# Creating directories
if [ ! -d "src" ]; then
    mkdir src
fi
if [ ! -d "research" ]; then
    mkdir research
fi

# Creating files (Windows compatible way)
echo "" > src/__init__.py
echo "" > src/helper.py 
echo "" > src/prompt.py
echo "" > .env 
echo "" > setup.py
echo "" > app.py
echo "" > research/trials.ipynb 
echo "" > requirements.txt

echo "Directory and files created successfully!"