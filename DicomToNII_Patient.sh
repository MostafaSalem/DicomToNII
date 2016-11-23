#!/bin/bash
#----------------------------------------------------------------------------------------------------------------------------
#defineparametres:
# The source folder
sourceDir=$1   
IPISourceDir=$sourceDir/IPI
TPISourceDir=$sourceDir/TPI
VPISourceDir=$sourceDir/VPI

# The data (Images) folder
destinationDir=$2
IPIDestinationDir=$destinationDir/IPI
TPIDestinationDir=$destinationDir/TPI
VPIDestinationDir=$destinationDir/VPI

#----------------------------------------------------------------------------------------------------------------------------
mkdir -p -v ./tmp
mkdir -p -v $destinationDir
mkdir -p -v $IPIDestinationDir
mkdir -p -v $TPIDestinationDir
mkdir -p -v $VPIDestinationDir



for i  in {1..10};
do
echo 'Working With Patient No.'$i
# Scan
scanIPIDestinationDir=$IPIDestinationDir/$i
mkdir -p -v $scanIPIDestinationDir
scanTPIDestinationDir=$TPIDestinationDir/$i
mkdir -p -v $scanTPIDestinationDir
scanVPIDestinationDir=$VPIDestinationDir/$i
mkdir -p -v $scanVPIDestinationDir

###########################################################################################################################################
# IPI (Scan-RScan)
###########################################################################################################################################
echo 'Working With IPI-Scan'
#----------------------------------------------------------------------------------------------------------------------------
dataDirScan=$IPISourceDir/IPI"$(printf "%02d" $i)"_0/SER1

mri_convert  --split -ot nii   --out_orientation RAS $dataDirScan/IMG00001.dcm  ./tmp/a.nii >IPImriConvertOutput.txt

sudo mv ./tmp/a0000.nii $scanIPIDestinationDir/t1.nii
#----------------------------------------------------------------------------------------------------------------------------
dataDirScan=$IPISourceDir/IPI"$(printf "%02d" $i)"_0/SER2

mri_convert  --split -ot nii   --out_orientation RAS $dataDirScan/IMG00001.dcm  ./tmp/b.nii >>IPImriConvertOutput.txt

sudo mv ./tmp/b0000.nii $scanIPIDestinationDir/flair.nii
#----------------------------------------------------------------------------------------------------------------------------
dataDirScan=$IPISourceDir/IPI"$(printf "%02d" $i)"_0/SER3

mri_convert  --split -ot nii   --out_orientation RAS $dataDirScan/IMG00001.dcm  ./tmp/c.nii >>IPImriConvertOutput.txt

sudo mv ./tmp/c0000.nii $scanIPIDestinationDir/pd.nii
sudo mv ./tmp/c0001.nii $scanIPIDestinationDir/t2.nii
#----------------------------------------------------------------------------------------------------------------------------
echo 'Working With IPI-RScan'
#----------------------------------------------------------------------------------------------------------------------------
dataDirScan=$IPISourceDir/IPI"$(printf "%02d" $i)"_0R/SER1

mri_convert  --split -ot nii   --out_orientation RAS $dataDirScan/IMG00001.dcm  ./tmp/a.nii >>IPImriConvertOutput.txt

sudo mv ./tmp/a0000.nii $scanIPIDestinationDir/t1_rscan.nii
#----------------------------------------------------------------------------------------------------------------------------
dataDirScan=$IPISourceDir/IPI"$(printf "%02d" $i)"_0R/SER2

mri_convert  --split -ot nii   --out_orientation RAS $dataDirScan/IMG00001.dcm  ./tmp/b.nii >>IPImriConvertOutput.txt

sudo mv ./tmp/b0000.nii $scanIPIDestinationDir/flair_rscan.nii
#----------------------------------------------------------------------------------------------------------------------------
dataDirScan=$IPISourceDir/IPI"$(printf "%02d" $i)"_0R/SER3

mri_convert  --split -ot nii   --out_orientation RAS $dataDirScan/IMG00001.dcm  ./tmp/c.nii >>IPImriConvertOutput.txt

sudo mv ./tmp/c0000.nii $scanIPIDestinationDir/pd_rscan.nii
sudo mv ./tmp/c0001.nii $scanIPIDestinationDir/t2_rscan.nii
#----------------------------------------------------------------------------------------------------------------------------

###########################################################################################################################################
# TPI (Scan-RScan)
###########################################################################################################################################
echo 'Working With TPI-Scan'
#----------------------------------------------------------------------------------------------------------------------------
dataDirScan=$TPISourceDir/TPI"$(printf "%02d" $i)"_0/SER1

mri_convert  --split -ot nii   --out_orientation RAS $dataDirScan/IMG00001.dcm  ./tmp/a.nii >TPImriConvertOutput.txt

sudo mv ./tmp/a0000.nii $scanTPIDestinationDir/t1.nii
#----------------------------------------------------------------------------------------------------------------------------
dataDirScan=$TPISourceDir/TPI"$(printf "%02d" $i)"_0/SER2

mri_convert  --split -ot nii   --out_orientation RAS $dataDirScan/IMG00001.dcm  ./tmp/b.nii >>TPImriConvertOutput.txt

sudo mv ./tmp/b0000.nii $scanTPIDestinationDir/pd.nii
sudo mv ./tmp/b0001.nii $scanTPIDestinationDir/t2.nii
#----------------------------------------------------------------------------------------------------------------------------
dataDirScan=$TPISourceDir/TPI"$(printf "%02d" $i)"_0/SER3

mri_convert  --split -ot nii   --out_orientation RAS $dataDirScan/IMG00001.dcm  ./tmp/c.nii >>TPImriConvertOutput.txt

sudo mv ./tmp/c0000.nii $scanTPIDestinationDir/flair.nii
#----------------------------------------------------------------------------------------------------------------------------
echo 'Working With TPI-RScan'
#----------------------------------------------------------------------------------------------------------------------------
dataDirScan=$TPISourceDir/TPI"$(printf "%02d" $i)"_0R/SER1

mri_convert  --split -ot nii   --out_orientation RAS $dataDirScan/IMG00001.dcm  ./tmp/a.nii >>TPImriConvertOutput.txt

sudo mv ./tmp/a0000.nii $scanTPIDestinationDir/t1_rscan.nii
#----------------------------------------------------------------------------------------------------------------------------
dataDirScan=$TPISourceDir/TPI"$(printf "%02d" $i)"_0R/SER2

mri_convert  --split -ot nii  --out_orientation RAS  $dataDirScan/IMG00001.dcm  ./tmp/b.nii >>TPImriConvertOutput.txt

sudo mv ./tmp/b0000.nii $scanTPIDestinationDir/pd_rscan.nii
sudo mv ./tmp/b0001.nii $scanTPIDestinationDir/t2_rscan.nii
#----------------------------------------------------------------------------------------------------------------------------
dataDirScan=$TPISourceDir/TPI"$(printf "%02d" $i)"_0R/SER3

mri_convert  --split -ot nii   --out_orientation RAS $dataDirScan/IMG00001.dcm  ./tmp/c.nii >>TPImriConvertOutput.txt

sudo mv ./tmp/c0000.nii $scanTPIDestinationDir/flair_rscan.nii
#----------------------------------------------------------------------------------------------------------------------------

###########################################################################################################################################
# VPI (Scan-RScan)
###########################################################################################################################################
echo 'Working With VPI-Scan'
#----------------------------------------------------------------------------------------------------------------------------
dataDirScan=$VPISourceDir/VPI"$(printf "%02d" $i)"_0/SER1

mri_convert  --split -ot nii   --out_orientation RAS $dataDirScan/IMG00001.dcm  ./tmp/a.nii >VPImriConvertOutput.txt

sudo mv ./tmp/a0000.nii $scanVPIDestinationDir/t1.nii
#----------------------------------------------------------------------------------------------------------------------------
dataDirScan=$VPISourceDir/VPI"$(printf "%02d" $i)"_0/SER2

mri_convert  --split -ot nii   --out_orientation RAS $dataDirScan/IMG00001.dcm  ./tmp/b.nii >>VPImriConvertOutput.txt

sudo mv ./tmp/b0000.nii $scanVPIDestinationDir/pd.nii
sudo mv ./tmp/b0001.nii $scanVPIDestinationDir/t2.nii
#----------------------------------------------------------------------------------------------------------------------------
dataDirScan=$VPISourceDir/VPI"$(printf "%02d" $i)"_0/SER3

mri_convert  --split -ot nii   --out_orientation RAS $dataDirScan/IMG00001.dcm  ./tmp/c.nii >>VPImriConvertOutput.txt

sudo mv ./tmp/c0000.nii $scanVPIDestinationDir/flair.nii
#----------------------------------------------------------------------------------------------------------------------------
echo 'Working With VPI-RScan'
#----------------------------------------------------------------------------------------------------------------------------
dataDirScan=$VPISourceDir/VPI"$(printf "%02d" $i)"_0R/SER1

mri_convert  --split -ot nii   --out_orientation RAS $dataDirScan/IMG00001.dcm  ./tmp/a.nii >>VPImriConvertOutput.txt

sudo mv ./tmp/a0000.nii $scanVPIDestinationDir/t1_rscan.nii
#----------------------------------------------------------------------------------------------------------------------------
dataDirScan=$VPISourceDir/VPI"$(printf "%02d" $i)"_0R/SER2

mri_convert  --split -ot nii   --out_orientation RAS $dataDirScan/IMG00001.dcm  ./tmp/b.nii >>VPImriConvertOutput.txt

sudo mv ./tmp/b0000.nii $scanVPIDestinationDir/flair_rscan.nii

###########################################################################################################################################

done
