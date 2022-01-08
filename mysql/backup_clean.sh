#!/bin/bash
echo ----------CLEAN BEGIN----------
find data -mtime +60  -exec rm -rf {} \;
echo ----------CLEAN COMPLETE---------
