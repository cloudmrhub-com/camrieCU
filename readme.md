Aug 22
# Camrie CU

matlab interface to PSudoMRI
## Installation

[CamrieCU](https://github.com/cloudmrhub-com/camrieCU) matlab script that calls PsudoMRICU
 1. Compile [PsudoMRICU](https://github.com/cloudmrhub-com/PsudoMRICU)
 1. Add bin to "PATH" environment variable
 1. add environment variable ncores
   - e.g. in matlab setenv('ncores','20')
   - e.g. in bash ncores=20 

## Usage 
before running these code please change the position of the files needed in testdata/testSignal.json and testdata/testNoise.json to your path
e.g.
change /data/PROJECTS/camrieCU/code/GUI2014bEdit/testdata/head_2x2x2.txt to  $PATH_WHERE_YOU_CLONED_CAMRIECU/code/GUI2014bEdit/testdata/head_2x2x2.txt

1 Signal Simulation
```
cd 'code'
addpath(genpath(pwd))
camrieAPI('/data/PROJECTS/camrieCU/testdata/testSignal.json', '~/o.json', '~/l.json', '/data/tmp/trial1/')
%position of the jsonfile with data customization
%position of the jsonfile where the output will be written to
%position of the jsonfile where the log will be written to
%position of the directory where the calculatin will be done
```

1 Noise Simulation
```
cd 'code'
addpath(genpath(pwd))
camrieAPI('/data/PROJECTS/camrieCU/testdata/testNoise.json', '~/o.json', '~/l.json', '/data/tmp/trial1/')
%position of the jsonfile with data customization
%position of the jsonfile where the output will be written to
%position of the jsonfile where the log will be written to
%position of the directory where the calculatin will be done
```
## Tested
- [x] linux ubuntu 22.04
- [x] docker linux ubuntu image


Camrie is part of [Cloud MR](http://www.cloudmrhub.com).

[*Dr. Eros Montin, PhD*](http://me.biodimensional.com)
**46&2 just ahead of me!**
