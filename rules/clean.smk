import time

date = time.strftime("%Y_%m_%d")

archive_path = "archive/{}_workflow".format(date)


rule zip_workflow:
    input:
        files=["results/plots/depths.svg", "results/plots/allele-freqs.svg"],
        folder="../dna-seq-gatk-variant-calling"
    output:
        outfile="{}.zip".format(archive_path)
    script:
        "../src/zip.py"
        
rule clean:
    input:
        archive="{}.zip".format(archive_path),
        folders=["data/annotated", "results/", "data/qc", "data/filtered",
                "data/trimmed", "data/mapped", "data/called"]
    shell:
        "rm -rf {input.folders}"