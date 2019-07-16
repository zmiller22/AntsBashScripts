#!/bin/bash

# WSL path /mnt/c/Users/TracingPC1/Desktop/Bash_scripts/ants_apply_transformation.sh

export ANTSPATH=${HOME}/bin/ants/bin/
export PATH=${ANTSPATH}:$PATH

input=/mnt/c/Users/TracingPC1/Desktop/BIGWARP/VOLUMES/isotropic_stitched_ch01_rotate90_flipZ_flipV.nii
output=/mnt/c/Users/TracingPC1/Desktop/BIGWARP/TRANSFORMS/190529_Transforms/isotropic_stitched_ch01_rotate90_flipZ_flipV_antsTest.nii
reference=/mnt/c/Users/TracingPC1/Desktop/BIGWARP/VOLUMES/crop_em2.nii
transformation=/mnt/c/Users/TracingPC1/Desktop/BIGWARP/TRANSFORMS/190529_Transforms/warp_field.tif


/home/tracingpc1/bin/ants/bin//antsApplyTransforms \
--verbose 1 --dimensionality 3 --float 1 \
--input $input --reference-image $reference --output $output \
--transform $transformation