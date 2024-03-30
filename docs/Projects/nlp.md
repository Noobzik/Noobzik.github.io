# Scientific article summarization

!!! note
    [GitHub](https://github.com/Noobzik/nlp_project)
    [Model](https://1drv.ms/u/s!AvRMY6XncL9ItT_bENxx538mzSXA)
    [Dataset](https://www.tensorflow.org/datasets/catalog/scientific_papers)

!!! abstract "Technical skill used"
    *  Python
    *  Tensorflow
    *  Transformers
    *  nltk
    *  HuggingFace


## Synopsis

This model generate a summarized scientific article from [arXiv](https://arxiv.org). The goal is to understand in a few sentences the content of the article. It is not aimed to replace the article abstract.

### Model Description

The model used is a T5-small with Hugging-Face weight (Transfert Learning)

!!! note "Inputs"
    *  text as a token format

!!! note "outputs"
    *  A text with a number of word. The general meaning is as close as the article abstract.

!!! warning "Model limitation"
    *  The article must be available at arXiv.
    *  The article must come in `tex` format.
    *  The `tex' should be in a valid format.
    *  The article should be written in English.

!!! warning "Tradeoff"
    *  A complete resume requires a longer inference time.
    *  Mathematics formulas and citations are hidden to not have to make another train for understanding these formulas
