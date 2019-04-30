# -*- coding: utf-8 -*-
import shutil


def copy_results():
    for file in snakemake.input.results:
        shutil.copyfile(file, "../../data/" + file)


def copy_data():
    for directory in snakemake.input.dirs:
        shutil.copytree(directory, "../../data/" + directory)