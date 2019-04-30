import copy
import time
date = time.strftime("%Y_%m_%d")

rule copy_results:
    input:
        results=["tables/calls.tsv.gz", "annotated/all.vcf.gz", "qc/multiqc.html",
            "plots/depths.svg", "plots/allele-freqs.svg"]
    output:
        all=["../../data/tables/calls.tsv.gz", "../../data/annotated/all.vcf.gz"]
    run:
        copy.copy_results()


rule copy_data:
    input:
        dirs=["qc", "snpeff", "mapped", "trimmed", "recal", "filtered", "called",
            "genotyped", "annotated"]
    output:
        all=["../../data/qc", "../../data/snpeff", "../../data/mapped", "../../data/trimmed",
            "../../data/recal", "../../data/filtered", "../../data/called", "../../data/genotyped",
            ../../data/annotated"]
    run:
        copy.copy_data()


rule zip_workflow:
    input:
        folder="../dna-seq-gatk-variant-calling"
    output:
        outfile="../../results/{}_workflow".format(date)
    script:
        "../scripts/zip.py"