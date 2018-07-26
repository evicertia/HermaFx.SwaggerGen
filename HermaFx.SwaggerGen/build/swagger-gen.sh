#!/bin/bash

echo Generating swagger client for $2

# Get file name
clientname=$(basename $2)
# Remove .swagger.json
clientname="${clientname/.swagger.json/""}"

# Get directory name
outdir=$(dirname $2)

mono $1 swagger2csclient /input:$2 /classname:$clientname /namespace:$3.Swagger$clientname /output:$outdir\\$clientname.swagger.cs