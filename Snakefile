import time

date = time.strftime("%Y_%m_%d")

archive_path = "archive/{}_workflow".format(date)

include: "rules/common.smk"

##### Target rules #####

rule all:
    input:
        "results/annotated/all.vcf.gz",
        "results/qc/multiqc.html",
        "results/plots/depths.svg",
        "results/plots/allele-freqs.svg",
        "{}.zip".format(archive_path)


##### Modules #####

include: "rules/mapping.smk"
include: "rules/calling.smk"
include: "rules/filtering.smk"
include: "rules/stats.smk"
include: "rules/qc.smk"
include: "rules/annotation.smk"
include: "rules/clean.smk"