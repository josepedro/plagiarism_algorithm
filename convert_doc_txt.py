#!/usr/bin/env python 
# -*- coding: utf-8 -*-

import glob, re, os
f = glob.glob('works/*.doc') + glob.glob('works/*.DOC')

outDir = 'txts'
if not os.path.exists(outDir):
    os.makedirs(outDir)
number = 0
for i in f:
    os.system("catdoc -w '%s' > '%s'" %
              (i, outDir + '/' + re.sub(r'.*/([^.]+)\.doc', r'\1.txt', i,
                                   flags=re.IGNORECASE)))
    number = number + 1