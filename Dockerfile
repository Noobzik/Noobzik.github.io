FROM squidfunk/mkdocs-material
RUN pip install mkdocs-awesome-pages-plugin \
    mkdocs-git-revision-date-localized-plugin mkdocs-redirects \
    mkdocs-exclude-search mkdocs-embed-external-markdown mkdocs-video mike \
    pillow cairosvg mkdocs-mermaid2-plugin