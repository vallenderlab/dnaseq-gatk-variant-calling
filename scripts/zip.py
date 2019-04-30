# -*- coding: utf-8 -*-
from zipfile import ZipFile

output_zipfile = ZipFile("../../results/workflow.zip", mode='a')
for folder in snakemake.input.folders:
    output_zipfile.write(folder)
output_zipfile.close()