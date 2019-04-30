import time
date = time.strftime("%Y_%m_%d")

rule copy_results:
    input:
        all=["tables/calls.tsv.gz", "annotated/all.vcf.gz"]
    output:
        all=["../../data/tables/calls.tsv.gz", "../../data/annotated/all.vcf.gz"]
    script:
        "../scripts/copy.py"


rule zip_workflow:
    input:
        folder="../dna-seq-gatk-variant-calling"
    output:
        outfile="../../results/{date}_workflow.zip"
    script:
        "../scripts/zip.py"