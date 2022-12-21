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

rule track_changes:
  input:
    tex = "submission/manuscript.tex"
  output:
    pdf = "submission/track_changes.pdf"
  shell:
    """ 
    git cat-file -p 02528564908e691ef75d208a19b7f1b3866fe4df:submission/manuscript.tex > submission/manuscript_old.tex
    latexdiff submission/manuscript_old.tex submission/manuscript.tex > submission/track_changes.tex
    pdflatex -output-directory=submission submission/track_changes.tex
    rm submission/track_changes.aux submission/track_changes.log submission/track_changes.out submission/track_changes.tex submission/manuscript_old.tex
    """ 

rule response_to_reviewers:
  input:
    "submission/response_to_reviewers.md"
  output:
    "submission/response_to_reviewers.pdf"
  shell:
    """
    pandoc {input} -o {output}
    """
