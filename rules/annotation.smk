rule snpeff:
    input:
        "data/filtered/all.vcf.gz",
    output:
        vcf=report("results/annotated/all.vcf.gz", caption="../report/vcf.rst", category="Calls"),
        csvstats="results/snpeff/all.csv"
    log:
        "logs/snpeff.log"
    params:
        reference=config["ref"]["name"],
        extra="-Xmx6g"
    wrapper:
        "0.27.1/bio/snpeff"
