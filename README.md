tktltiki2 LaTeX class
======================

This is a thesis and course report LaTeX class following the conventions at the Computer Science Department of the University of Helsinki. The class is intended to be used for the bachelor's thesis, master's thesis and various course and seminar reports.

The tktltiki2 class is appearance-wise largely based on the older tktltiki class, but nearly all features have been rewritten to make it less likely to break. Some of the features, most notably the automatic appendix page counting, are not included at least in the current version. The tktltiki-specifix bibtex style has been dropped in favour of babelbib package included in most recent LaTeX installations.

Usage
-----

Simply download tktltiki2.cls and put it in your project folder to get started. You may also install it to your LaTeX distribution tree if you intend to use it frequently.

Documentation
-------------

For now, refer to template-en.tex (English) or template-fi.tex (Finnish) to see how the class is used and what options are available. A more detailed documentation, along with full worked examples, will be published hopefully during January 2013.


Compiling with latexmk
----------------------

Re-compile everything as needed:

    latexmk template-en.tex

Clean up everything:

    latexmk -C template-en.tex


Compiling with rubber
---------------------

Re-compile everything as needed:

    rubber -Wall template-en.tex

Clean up everything:

    rubber --clean template-en.tex


Compiling manually
------------------

Compile everything:

    pdflatex template-en
    bibtex template-en
    pdflatex template-en
    pdflatex template-en


Known issues
------------

The current version of the class requires the latest version of the geometry package to be installed. This may cause issues if your LaTeX installation is not up to date.
