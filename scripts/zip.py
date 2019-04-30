# -*- coding: utf-8 -*-
import shutil

archive = str(snakemake.output.outfile).split(".")

shutil.make_archive(archive[0], "zip", snakemake.input.folder)