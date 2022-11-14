# Announcing: The Riffomonas Project YouTube channel



## To build paper

1. [Install miniconda](https://docs.conda.io/en/latest/miniconda.html)

2. [Install mamba](https://mamba.readthedocs.io/en/latest/installation.html) within base environment:  

    ```bash
    conda install mamba -n base -c conda-forge
    ```
  
1. Create and activate `mra` environment  

    ```bash
    mamba env create -f environment.yml
    conda activate mra
    ```

4. Build paper

    ```bash
    snakemake -c 1
    ```
