rule targets:
  input:
    "submission/manuscript.pdf",
    "submission/manuscript.md",
    "submission/manuscript.docx",
    "submission/manuscript.tex"
        
rule write_paper:
  input:
    rmd = "submission/manuscript.Rmd",
    bib = "submission/references.bib",
    csl = "submission/asm.csl"
  output:
    "submission/manuscript.pdf",
    "submission/manuscript.docx",
    "submission/manuscript.tex",
    "submission/manuscript.md"
  shell:
    """
    R -e "library(rmarkdown); render('{input.rmd}', clean = FALSE, output_format = 'all')"
    mv submission/manuscript.knit.md submission/manuscript.md
    """
