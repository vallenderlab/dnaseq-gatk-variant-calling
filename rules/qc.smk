rule fastqc:
    input:
        unpack(get_fastq)
    output:
        html="data/qc/fastqc/{sample}-{unit}.html",
        zip="data/qc/fastqc/{sample}-{unit}.zip"
    wrapper:
        "0.27.1/bio/fastqc"


rule samtools_stats:
    input:
        "data/recal/{sample}-{unit}.bam"
    output:
        "data/qc/samtools-stats/{sample}-{unit}.txt"
    log:
        "logs/samtools-stats/{sample}-{unit}.log"
    wrapper:
        "0.27.1/bio/samtools/stats"


rule multiqc:
    input:
        expand(["data/qc/samtools-stats/{u.sample}-{u.unit}.txt",
                "data/qc/fastqc/{u.sample}-{u.unit}.zip",
                "data/qc/dedup/{u.sample}-{u.unit}.metrics.txt"],
               u=units.itertuples()),
        "results/snpeff/all.csv"
    output:
        report("results/qc/multiqc.html", caption="../report/multiqc.rst", category="Quality control")
    log:
        "logs/multiqc.log"
    wrapper:
        "0.27.1/bio/multiqc"
