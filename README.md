PDFMeta
=============

This is a little tool that allows you to set the metadata in a PDF
file. It is particularly useful if called within the literature
retrieval process, e.g., from
[BibDesk](http://bibdesk.sourceforge.net): It allows for setting the
metadata that is captured in BibDesk, back into the PDF - which for
example allows tools like DevonThink to display that metadata. You can
use [BetterTouchTool](https://www.boastr.net) to e.g. bind a keyboard
shortcut like `Cmd+Enter`, to this tool, so that at when you hit that
shortcut, the metadata for the currently selected bibliography entry
will be transferred into the PDF(s) attached to it.


BITS AND PIECES
=============

AppleScript: Link BibDesk to PDFMeta
---------------------------------------------------

If you want to link PDFMeta to BibDesk, use the `Write Bibdesk
Metadata to PDF.scpt` in the `macos` subfolder. And if you don't use
BibDesk, or even a Mac, I've copied the source code of that file into
`Write Bibdesk Metadata to PDF.txt` for you as a reference. It is
really not all that useful then, but if you don't have a Mac, you
won't be able to open the AppleScript file.


Shell Script: Wrap PDFMeta
--------------------------------------

PDFMeta is really a Java program. But we use a shell script to invoke
it as we need to do some processing on the command line. So really,
what you want to have a look at is the file `pdfmeta`, which is the
shell script. There's a configuration section at the top. You don't
really need to do that as long as you have a Mac and keep,
essentially, the whole directory structure intact.


Skim and Extended Attributes
----------------------------------------

Of course, if you use a Mac for research, chances are you're using
[Skim](http://skim-app.sourceforge.net). And if not, you should. Now,
if you do, there's one little challenge: Skim stores annotations that
you make not in the PDF file itself, but in the so-called extended
attributes of that file in the file system. And what that means is
that if we now essentially copy the file around on the command line,
and add metadata to it, we would normally lose those annotations -
which is of course not what you want to do.

To fix that, we use [pxattr](http://www.lesbonscomptes.com/pxattr/) -
which you find in the `pxattr` subfolder. It is invoked by the
`pdfmeta` shell script - and is really the only reason why that shell
script even exists. Since `pxattr` really only works on directories
and not files, there's some logic in `pdfmeta` where we use a
temporary directory to process the data.


Java
------

A large part of the package is an [Eclipse](https://eclipse.org)
project that contains code to actually set metadata into a PDF. We use
[iText](https://de.wikipedia.org/wiki/IText) to do that - and really,
a relatively old version because the author had changed his ideas
about licensing at some point. But that's fine with us (and him),
since we don't even need any of the newer functionalities of iText.

So that Java program you can compile - you don't need to as it also
comes precompiled as `pdfmeta.jar` - if you either import the
directory into Eclipse, or also if you just happen to have
[Ant](http://ant.apache.org), you can simply call Ant by itself:


```
Matthias-MacBook:pdfmeta mnott$ ant
Buildfile: /Users/mnott/Documents/mnott/Development/java/pdfmeta/build.xml

help:
     [echo] --------------------------------------------------
     [echo]        The following options are available:       
     [echo] --------------------------------------------------
     [echo] 
     [echo]   all              -  Make it all                 
     [echo]   compile          -  Compile the Source Code     
     [echo]   jar              -  Create the pdfmeta.jar
     [echo]   source           -  Create the Source Distri.   
     [echo]   clean            -  Clean up.                   
     [echo] 
     [echo] --------------------------------------------------

BUILD SUCCESSFUL
Total time: 0 seconds
```

So then to really build the Java program, you can do this:

```
Matthias-MacBook:pdfmeta mnott$ ant jar
Buildfile: /Users/mnott/Documents/mnott/Development/java/pdfmeta/build.xml

config:

compile:

jar:
      [jar] Building jar: /Users/mnott/Documents/mnott/Development/java/pdfmeta/distribution/pdfmeta/pdfmeta-1.1-201611151755.jar
     [copy] Copying 1 file to /Users/mnott/Documents/mnott/Development/java/pdfmeta

BUILD SUCCESSFUL
Total time: 0 seconds
```

Usage
=============

You can then test what you did first of all by using the created Jar
file - `pdfmeta.jar` - directly; if you did not recompile the
`pdfmeta.jar` you can just use the one that comes with the package:

```
Matthias-MacBook:pdfmeta mnott$ java -jar pdfmeta.jar 
Usage  : pdfmeta [options] srcfile [destfile]
Options: --print-info                Print Document Info before Processing
         --print-keywords            Print Document Keywords before Processing
         --title           <string>  Set Title
         --subject         <string>  Set Subject
         --keywords        <string>  Set Keywords
         --creator         <string>  Set Creator
         --author          <string>  Set Author
         --user-password   <string>  Set User Password
         --master-password <string>  Set Master Password
         --encryption-bits <number>  Set Number of Encryption Bits (40 or 128)
         --permissions     <list>    Set comma-separated List of allowed Actions:
                                         print
                                         degraded-print
                                         copy
                                         modify-contents
                                         modify-annotations
                                         assembly
                                         fill-in
                                         screen-readers
```

So as you see, the Java program comes with a whole  lot of command
line options that we can use. PDFMeta, the shell script, really uses
only some of them, but let's try it out on the `test.pdf` file that
conveniently is part of the package:

```
Matthias-MacBook:pdfmeta mnott$ java -jar pdfmeta.jar --print-info test.pdf 
Reading test.pdf...
There are 1 pages in the original file.
Document information:
CreationDate = "D:20161115173340+01'00'"
Keywords = "PDFMeta,Bibdesk"
Producer = "iText 2.1.4 (by lowagie.com)"
Author = "Matthias Nott"
Title = "Test Document for PDFMeta"
ModDate = "D:20161115173340+01'00'"
Creator = "Vorschau"
Subject = ""
```

Let's change some metadata to make sure it works: We'll set the Title
of the document to something else:

```
Matthias-MacBook:pdfmeta mnott$ java -jar pdfmeta.jar --title "Somethig else" test.pdf output.pdf 
Reading test.pdf...
There are 1 pages in the original file.
Writing output.pdf... 
[1] 
```

Let's see what has happened:

```
Matthias-MacBook:pdfmeta mnott$ java -jar pdfmeta.jar --print-info output.pdf 
Reading output.pdf...
There are 1 pages in the original file.
Document information:
CreationDate = "D:20161115175935+01'00'"
Keywords = "PDFMeta,Bibdesk"
Producer = "iText 2.1.4 (by lowagie.com)"
Author = "Matthias Nott"
Title = "Somethig else"
ModDate = "D:20161115175935+01'00'"
Creator = "Vorschau"
Subject = ""
```

Let's clean up:

```
Matthias-MacBook:pdfmeta mnott$ rm output.pdf 
```


Now, let's don't use the Java program itself, but use the included
shell script `pdfmeta` - because while the Java program allows you to
do more nifty things than just setting author, title and keywords, if
you do that you'll lose eventually existing Skim annotations.
`pdfmeta` takes care of this.

If you don't give any parameters, it shows you what to do:

```
Matthias-MacBook:pdfmeta mnott$ ./pdfmeta 
Usage: ./pdfmeta author title keywords pdffile
```

So let's set the metadata - exactly the way the script would have been
called by the AppleScript:

```
Matthias-MacBook:pdfmeta mnott$ ./pdfmeta "Matthias Nott" "Test Document for PDFMeta" "PDFMeta,Bibdesk" test.pdf 

Reading test.pdf...
There are 1 pages in the original file.
Writing out.pdf... 
[1] 
Have set author to Matthias Nott, title to Test Document for PDFMeta, keywords to PDFMeta,Bibdesk, and merged annotations.
```

And let's verify as we did before:

```
Matthias-MacBook:pdfmeta mnott$ java -jar pdfmeta.jar --print-info test.pdf 
Reading test.pdf...
There are 1 pages in the original file.
Document information:
CreationDate = "D:20161115180542+01'00'"
Keywords = "PDFMeta,Bibdesk"
Producer = "iText 2.1.4 (by lowagie.com)"
Author = "Matthias Nott"
Title = "Test Document for PDFMeta"
ModDate = "D:20161115180542+01'00'"
Creator = "Vorschau"
Subject = ""
```

HAVE FUN!
=============

That's really it. If you maintain the directory structure (especially,
the `lib` and `pxattr` subdirectories), then it should work completely
out of the box for you. And if it does not, well...

***Use the Source, Luke!***

