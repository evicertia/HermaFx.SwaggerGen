#!/bin/bash

echo Generating swagger client for $2

# Get file name
clientname=$(basename $2)
# Remove .swagger.json
clientname="${clientname/.swagger.json/""}"

# Get directory name
outdir=$(dirname $2)

NAMESPACE=$3.$clientname
CLASSNAME=$clientname
GENERATESYNC=true
INJECTHTTPCLIENT=false
CLASSSTYLE=Poco

if [ -e $outdir\\$clientname.swagger.config ]; then
    echo "Config file found, reading parameters"
    source $outdir\\$clientname.swagger.config
else 
    echo "Config file not found, using default values"
fi 

if [ -e $outdir\\$clientname.swagger.cs ]; then
    rm $outdir\\$clientname.swagger.cs
fi
mono $1 swagger2csclient /input:$2 /classname:$clientname /namespace:$3.$clientname /output:$outdir\\$clientname.swagger.cs /GenerateSyncMethods:$GENERATESYNC /InjectHttpClient:$INJECTHTTPCLIENT /ClassStyle:$CLASSSTYLE