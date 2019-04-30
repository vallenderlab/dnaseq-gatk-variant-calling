from os.path import join
import time

from copy import *

date = time.strftime("%Y_%m_%d")

outpath = config["projectroot"]
results_path = join(outpath, "results")
data_path = join(outpath, "data")
archive_path = join(outpath, "results/{}_workflow".format(date))

rule copy_results:
    input:
        results=["tables/", "annotated/", "qc/", "plots/"]
    output:
        outresults=[join(outpath, "results/tables/calls.tsv.gz"),
            join(outpath, "results/annotated/all.vcf.gz"),
            join(outpath, "results/qc/multiqc.html"),
            join(outpath, "results/plots/depths.svg"),
            join(outpath, "results/plots/allele-freqs.svg")]
    shell:
        "cp -R {input.results} {results_path}"

rule copy_data:
    input:
        dirs=["snpeff", "mapped", "trimmed", "recal", "filtered", "called",
            "genotyped", "annotated"]
    output:
        all=[directory(join(outpath, "data/qc")),
            directory(join(outpath, "data/snpeff")),
            directory(join(outpath, "data/mapped")),
            directory(join(outpath, "data/trimmed")),
            directory(join(outpath, "data/recal")),
            directory(join(outpath, "data/filtered")),
            directory(join(outpath, "data/called")),
            directory(join(outpath, "data/genotyped")),
            directory(join(outpath, "data/annotated"))]
    shell:
        "cp -R {input.dirs} {data_path}"

rule zip_workflow:
    input:
        folder="../dna-seq-gatk-variant-calling"
    output:
        outfile="{}.zip".format(archive_path)
    script:
        "../scripts/zip.py"