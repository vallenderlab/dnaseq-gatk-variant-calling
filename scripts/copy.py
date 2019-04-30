# -*- coding: utf-8 -*-
import shutil

for file in snakemake.input.all:
    shutil.copyfile(file, "../../data/" + file)