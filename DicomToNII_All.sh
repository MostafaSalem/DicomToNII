#!/bin/bash
#----------------------------------------------------------------------------------------------------------------------------
#defineparametres:

OutputPath=$1
InHealthyPath=$2
InPatientPath=$3

mkdir -p -v $OutputPath/BiomarkEMData

echo 'Working With The Healthy Cases'
./DicomToNII_Healthy.sh $InHealthyPath $OutputPath/Healthy
echo 'Working With The Patient Cases'
./DicomToNII_Patient.sh $InPatientPath $OutputPath/Lesions
echo 'Done........................'

