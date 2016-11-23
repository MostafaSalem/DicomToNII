#!/bin/bash
#----------------------------------------------------------------------------------------------------------------------------
#defineparametres:


# The source folder
sourceDir=$1   
ISISourceDir=$sourceDir/ISI
TSISourceDir=$sourceDir/TSI
VSISourceDir=$sourceDir/VSI

# The data (Images) folder
destinationDir=$2
ISIDestinationDir=$destinationDir/ISI
TSIDestinationDir=$destinationDir/TSI
VSIDestinationDir=$destinationDir/VSI

#----------------------------------------------------------------------------------------------------------------------------
mkdir -p -v ./tmp
mkdir -p -v $destinationDir
mkdir -p -v $ISIDestinationDir
mkdir -p -v $TSIDestinationDir
mkdir -p -v $VSIDestinationDir



for i  in 3 4 #{1..15};
do
echo 'Working With Healthy case No.'$i
# Scan
scanISIDestinationDir=$ISIDestinationDir/$i
mkdir -p -v $scanISIDestinationDir
scanTSIDestinationDir=$TSIDestinationDir/$i
mkdir -p -v $scanTSIDestinationDir
scanVSIDestinationDir=$VSIDestinationDir/$i
mkdir -p -v $scanVSIDestinationDir

###########################################################################################################################################
# ISI (Scan-RScan)
###########################################################################################################################################
echo 'Working With ISI-Scan'
#----------------------------------------------------------------------------------------------------------------------------
dataDirScan=$ISISourceDir/ISI"$(printf "%02d" $i)"_0/SER1

mri_convert  --split -ot nii   --out_orientation RAS $dataDirScan/IMG00001.dcm  ./tmp/a.nii >ISImriConvertOutput.txt
sudo mv ./tmp/a0000.nii $scanISIDestinationDir/t1.nii
#----------------------------------------------------------------------------------------------------------------------------
dataDirScan=$ISISourceDir/ISI"$(printf "%02d" $i)"_0/SER2

mri_convert  --split -ot nii   --out_orientation RAS $dataDirScan/IMG00001.dcm  ./tmp/b.nii >>ISImriConvertOutput.txt

sudo mv ./tmp/b0000.nii $scanISIDestinationDir/flair.nii
#----------------------------------------------------------------------------------------------------------------------------
dataDirScan=$ISISourceDir/ISI"$(printf "%02d" $i)"_0/SER3

mri_convert  --split -ot nii   --out_orientation RAS $dataDirScan/IMG00001.dcm  ./tmp/c.nii >>ISImriConvertOutput.txt

sudo mv ./tmp/c0000.nii $scanISIDestinationDir/pd.nii
sudo mv ./tmp/c0001.nii $scanISIDestinationDir/t2.nii
#----------------------------------------------------------------------------------------------------------------------------
echo 'Working With ISI-RScan'
#----------------------------------------------------------------------------------------------------------------------------
dataDirScan=$ISISourceDir/ISI"$(printf "%02d" $i)"_0R/SER1

mri_convert  --split -ot nii  --out_orientation RAS $dataDirScan/IMG00001.dcm  ./tmp/a.nii >>ISImriConvertOutput.txt

sudo mv ./tmp/a0000.nii $scanISIDestinationDir/t1_rscan.nii
#----------------------------------------------------------------------------------------------------------------------------
dataDirScan=$ISISourceDir/ISI"$(printf "%02d" $i)"_0R/SER2

mri_convert  --split -ot nii   --out_orientation RAS $dataDirScan/IMG00001.dcm  ./tmp/b.nii >>ISImriConvertOutput.txt

sudo mv ./tmp/b0000.nii $scanISIDestinationDir/flair_rscan.nii
#----------------------------------------------------------------------------------------------------------------------------
dataDirScan=$ISISourceDir/ISI"$(printf "%02d" $i)"_0R/SER3

mri_convert  --split -ot nii   --out_orientation RAS $dataDirScan/IMG00001.dcm  ./tmp/c.nii >>ISImriConvertOutput.txt

sudo mv ./tmp/c0000.nii $scanISIDestinationDir/pd_rscan.nii
sudo mv ./tmp/c0001.nii $scanISIDestinationDir/t2_rscan.nii
#----------------------------------------------------------------------------------------------------------------------------

###########################################################################################################################################
# TSI (Scan-RScan)
###########################################################################################################################################
echo 'Working With TSI-Scan'
#----------------------------------------------------------------------------------------------------------------------------
dataDirScan=$TSISourceDir/TSI"$(printf "%02d" $i)"_0/SER1

mri_convert  --split -ot nii  --out_orientation RAS $dataDirScan/IMG00001.dcm  ./tmp/a.nii >TSImriConvertOutput.txt

sudo mv ./tmp/a0000.nii $scanTSIDestinationDir/t1.nii
#----------------------------------------------------------------------------------------------------------------------------
dataDirScan=$TSISourceDir/TSI"$(printf "%02d" $i)"_0/SER2

mri_convert  --split -ot nii   --out_orientation RAS $dataDirScan/IMG00001.dcm  ./tmp/b.nii >>TSImriConvertOutput.txt

sudo mv ./tmp/b0000.nii $scanTSIDestinationDir/pd.nii
sudo mv ./tmp/b0001.nii $scanTSIDestinationDir/t2.nii
#----------------------------------------------------------------------------------------------------------------------------
dataDirScan=$TSISourceDir/TSI"$(printf "%02d" $i)"_0/SER3

mri_convert  --split -ot nii   --out_orientation RAS $dataDirScan/IMG00001.dcm  ./tmp/c.nii >>TSImriConvertOutput.txt

sudo mv ./tmp/c0000.nii $scanTSIDestinationDir/flair.nii
#----------------------------------------------------------------------------------------------------------------------------
echo 'Working With TSI-RScan'
#----------------------------------------------------------------------------------------------------------------------------
dataDirScan=$TSISourceDir/TSI"$(printf "%02d" $i)"_0R/SER1

mri_convert  --split -ot nii  --out_orientation RAS $dataDirScan/IMG00001.dcm  ./tmp/a.nii >>TSImriConvertOutput.txt

sudo mv ./tmp/a0000.nii $scanTSIDestinationDir/t1_rscan.nii
#----------------------------------------------------------------------------------------------------------------------------
dataDirScan=$TSISourceDir/TSI"$(printf "%02d" $i)"_0R/SER2

mri_convert  --split -ot nii   --out_orientation RAS $dataDirScan/IMG00001.dcm  ./tmp/b.nii >>TSImriConvertOutput.txt

sudo mv ./tmp/b0000.nii $scanTSIDestinationDir/pd_rscan.nii
sudo mv ./tmp/b0001.nii $scanTSIDestinationDir/t2_rscan.nii
#----------------------------------------------------------------------------------------------------------------------------
dataDirScan=$TSISourceDir/TSI"$(printf "%02d" $i)"_0R/SER3

mri_convert  --split -ot nii   --out_orientation RAS $dataDirScan/IMG00001.dcm  ./tmp/c.nii >>TSImriConvertOutput.txt

sudo mv ./tmp/c0000.nii $scanTSIDestinationDir/flair_rscan.nii
#----------------------------------------------------------------------------------------------------------------------------

###########################################################################################################################################
# VSI (Scan-RScan)
###########################################################################################################################################
echo 'Working With VSI-Scan'
#----------------------------------------------------------------------------------------------------------------------------
dataDirScan=$VSISourceDir/VSI"$(printf "%02d" $i)"_0/SER1

mri_convert  --split -ot nii   --out_orientation RAS $dataDirScan/IMG00001.dcm  ./tmp/a.nii >VSImriConvertOutput.txt

sudo mv ./tmp/a0000.nii $scanVSIDestinationDir/t1.nii
#----------------------------------------------------------------------------------------------------------------------------
dataDirScan=$VSISourceDir/VSI"$(printf "%02d" $i)"_0/SER2

mri_convert  --split -ot nii   --out_orientation RAS $dataDirScan/IMG00001.dcm  ./tmp/b.nii >>VSImriConvertOutput.txt

sudo mv ./tmp/b0000.nii $scanVSIDestinationDir/pd.nii
sudo mv ./tmp/b0001.nii $scanVSIDestinationDir/t2.nii
#----------------------------------------------------------------------------------------------------------------------------
dataDirScan=$VSISourceDir/VSI"$(printf "%02d" $i)"_0/SER3

mri_convert  --split -ot nii   --out_orientation RAS $dataDirScan/IMG00001.dcm  ./tmp/c.nii >>VSImriConvertOutput.txt

sudo mv ./tmp/c0000.nii $scanVSIDestinationDir/flair.nii
#----------------------------------------------------------------------------------------------------------------------------
echo 'Working With VSI-RScan'
#----------------------------------------------------------------------------------------------------------------------------
dataDirScan=$VSISourceDir/VSI"$(printf "%02d" $i)"_0R/SER1

mri_convert  --split -ot nii   --out_orientation RAS $dataDirScan/IMG00001.dcm  ./tmp/a.nii >>VSImriConvertOutput.txt

sudo mv ./tmp/a0000.nii $scanVSIDestinationDir/t1_rscan.nii
#----------------------------------------------------------------------------------------------------------------------------
dataDirScan=$VSISourceDir/VSI"$(printf "%02d" $i)"_0R/SER2

mri_convert  --split -ot nii   --out_orientation RAS $dataDirScan/IMG00001.dcm  ./tmp/b.nii >>VSImriConvertOutput.txt

sudo mv ./tmp/b0000.nii $scanVSIDestinationDir/flair_rscan.nii

###########################################################################################################################################

done
