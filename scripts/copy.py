# -*- coding: utf-8 -*-
import shutil


def copy_results(infiles, outfiles):
    for infile, outfile in zip(infiles, outfiles):
        shutil.copyfile(infile, outfile)


def copy_data(indirs, outdirs):
    for indir, outdir in zip(indirs, outdirs):
        shutil.copytree(indir, outdir)