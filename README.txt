Installation

1. brew install mkdocs
2. pip install mkdocs-material
3. pip install fontawesome_markdown

To build, navigate to the root of this repo and run:
    mkdocs build --clean
    mkdocs serve

To deploy, run the following:

`rsync -avz --exclude .git/ --del -e "ssh -p 722" ~/git/dcdocs/site/ macropeo@77.72.0.226:/home/macropeo/docs.datacontroller.io`

Note that the readme has been renamed to README.txt to prevent github pages from considering it to be the index by default!
