rule move_results:
    input:
        all=["tables/calls.tsv.gz", "annotated/all.vcf.gz"]
    output:
        all=["../../data/tables/calls.tsv.gz", "../../data/annotated/all.vcf.gz"]
    script:
        "../scripts/copy.py"


rule zip_workflow:
    input:
        folders=["tables/", "annotated/"]
    output:
        outfile="../../results/workflow.zip"
    script:
        "../scripts/zip.py"