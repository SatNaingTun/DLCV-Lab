import nbformat
from nbconvert.exporters.webpdf import WebPDFExporter

with open("your_notebook.ipynb", "r", encoding="utf-8") as f:
    nb = nbformat.read(f, as_version=4)

exporter = WebPDFExporter(allow_chromium_download=True)
pdf_data, _ = exporter.from_notebook_node(nb)

with open("output.pdf", "wb") as f:
    f.write(pdf_data)