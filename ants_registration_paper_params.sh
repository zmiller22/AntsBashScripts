#!/bin/bash
export ANTSPATH=${HOME}/bin/ants/bin/
export PATH=${ANTSPATH}:$PATH

# WSL path /mnt/c/Users/TracingPC1/Desktop/Bash_scripts/registration_with_point_sets.sh

fixed=/mnt/c/Users/TracingPC1/Desktop/ANTSruns/volumes/zbrain3ch.nrrd
moving=/mnt/c/Users/TracingPC1/Desktop/ANTSruns/volumes/confocal_ch0102max_iso08um.nrrd
cwd=$(pwd)

/home/tracingpc1/bin/ants/bin//antsRegistration \
 --verbose 1 --dimensionality 3 --float 1 --collapse-output-transforms 1 \
 --output [ output, ${cwd}outputWarped.nrrd, ${cwd}outputInverseWarped.nii.gz ] \
 --interpolation "WlechWindowedSinc" --use-histogram-matching 0 --winsorize-image-intensities [ 0.005,0.995 ] \
 --initial-moving-transform [ $moving, $fixed, 1 ] \
 --transform Rigid[ 0.1 ] --metric MI[ $moving, $fixed,1,32,Regular,0.25 ] \
 --convergence [ 200x200x200x0, 1e-8, 10 ] --shrink-factors 12x8x4x2 --smoothing-sigmas 4x3x2x1vox \
 --transform Affine[ 0.1 ] --metric MI[ $moving, $fixed, 1, 32, Regular, 0.25 ] \
 --convergence [ 200x200x200x0, 1e-8, 10 ] --shrink-factors 12x8x4x2 --smoothing-sigmas 4x3x2x1vox \
 --transform SyN[ 0.1, 6, 0 ] --metric CC[ $moving, $fixed, 1, 2 ] \
 --convergence [ 200x200x200x10, 1e-7, 10 ] --shrink-factors 12x8x4x2 --smoothing-sigmas 4x3x2x1vox
