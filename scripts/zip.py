# -*- coding: utf-8 -*-
import shutil

shutil.make_archive(snakemake.input.folder, "zip", snakemake.output.outfile)