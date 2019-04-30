# -*- coding: utf-8 -*-
import shutil

shutil.make_archive(snakemake.output.outfile, "zip", snakemake.input.folder)