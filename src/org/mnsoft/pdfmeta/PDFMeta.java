package org.mnsoft.pdfmeta;

import com.lowagie.text.Document;
import com.lowagie.text.pdf.PRAcroForm;
import com.lowagie.text.pdf.PdfCopy;
import com.lowagie.text.pdf.PdfImportedPage;
import com.lowagie.text.pdf.PdfReader;
import com.lowagie.text.pdf.PdfWriter;

import org.apache.log4j.Logger;

import java.io.FileOutputStream;

import java.util.Iterator;
import java.util.Map;
import java.util.StringTokenizer;


/**
 * PDFMeta - Set PDF Metadata
 *
 * (C) 2010 Matthias Nott
 *
 * Based on prior work
 *
 * (C) 2002-2004 Sebastien Aperghis-Tramoni
 * (C) 2002 Bruno Lowagie
 *
 * This program is a free software available under
 * WTFPL.
 *
 * This code is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 */
public class PDFMeta {
  /**
   * Logger for this class
   */
  private static final Logger log             = Logger.getLogger(PDFMeta.class);

  @SuppressWarnings("deprecation")
  private boolean             encryption_bits = PdfWriter.STRENGTH128BITS;

  @SuppressWarnings("rawtypes")
  private Map                 info;
  private String              input_file;
  private String              output_file;
  private String              doc_title;
  private String              doc_subject;
  private String              doc_keywords;
  private String              doc_creator;
  private String              doc_author;
  private String              user_passwd;
  private String              owner_passwd;
  private boolean             encrypt        = false;
  private int                 permissions    = 0;
  private boolean             print_info     = false;
  private boolean             print_keywords = false;

  public PDFMeta(String[] args) {
    parseOptions(args);
    validateOptions();
  }

  /**
   * Run function
   */
  @SuppressWarnings({ "deprecation" })
  public void run() throws Exception {
    /*
     * Create a reader for the input file
     */
    if (!this.print_keywords) {
      log.debug("Reading " + this.input_file + "...");
    }

    final PdfReader reader = new PdfReader(this.input_file);

    /*
     * Retrieve the total number of pages
     */
    final int       n      = reader.getNumberOfPages();
    if (!this.print_keywords) {
      log.info("There are " + n + " pages in the original file.");
    }

    /*
     *  Get the document information
     */
    this.info = reader.getInfo();

    /*
     *  Print the document information if asked to do so
     */
    if (this.print_info) {
      printDocumentInfo();
    }

    /*
     * Print the document keywords if asked to do so
     */
    if (this.print_keywords) {
      printDocumentKeywords();
    }
    
    /*
     * Exit now if we have not two documents
     */
    if(this.input_file == null || this.output_file == null) {
      System.exit(0);
    }

    /*
     * Transfer the Document Metadata
     */
    transferDocumentMetadata();

    /*
     *  Step 1:
     *
     *  Creation of a document object
     */
    final Document document = new Document(reader.getPageSizeWithRotation(1));

    /*
     *  Step 2:
     *
     *  Create a writer that listens to the document
     */
    final PdfCopy  writer   = new PdfCopy(document, new FileOutputStream(this.output_file));

    /*
     *  Step 3.1:
     *
     *  Add the meta data
     */
    document.addTitle(this.doc_title);
    document.addSubject(this.doc_subject);
    document.addKeywords(this.doc_keywords);
    document.addCreator(this.doc_creator);
    document.addAuthor(this.doc_author);

    /*
     * Step 3.2:
     * Set up the protection and encryption parameters
     */
    if (this.encrypt) {
      writer.setEncryption(this.encryption_bits, this.user_passwd, this.owner_passwd, this.permissions);
    }

    /*
     *  Step 4
     *
     *  Open the document
     */
    log.info("Writing " + this.output_file + "... ");
    document.open();

    PdfImportedPage page;

    int             i = 0;

    /*
     * Step 5:
     *
     * Add content
     */
    while (i < n) {
      i++;
      page = writer.getImportedPage(reader, i);
      writer.addPage(page);

      log.info("[" + i + "] ");
    }

    final PRAcroForm form = reader.getAcroForm();
    if (form != null) {
      writer.copyAcroForm(reader);
    }

    /*
     * Step 6:
     *
     * Close the document
     */
    document.close();
  }


  /**
   * Print Usage
   */
  private void usage() {
    log.error("Usage  : pdfmeta [options] srcfile [destfile]");
    log.error("Options: --print-info                Print Document Info before Processing");
    log.error("         --print-keywords            Print Document Keywords before Processing");
    log.error("         --title           <string>  Set Title");
    log.error("         --subject         <string>  Set Subject");
    log.error("         --keywords        <string>  Set Keywords");
    log.error("         --creator         <string>  Set Creator");
    log.error("         --author          <string>  Set Author");
    log.error("         --user-password   <string>  Set User Password");
    log.error("         --master-password <string>  Set Master Password");
    log.error("         --encryption-bits <number>  Set Number of Encryption Bits (40 or 128)");
    log.error("         --permissions     <list>    Set comma-separated List of allowed Actions:");
    log.error("                                         print");
    log.error("                                         degraded-print");
    log.error("                                         copy");
    log.error("                                         modify-contents");
    log.error("                                         modify-annotations");
    log.error("                                         assembly");
    log.error("                                         fill-in");
    log.error("                                         screen-readers");
  }


  /**
   * Parse Commandline
   * @param args Program arguments
   */
  @SuppressWarnings("deprecation")
  private void parseOptions(String[] args) {
    if (args.length < 2) {
      usage();
      System.exit(1);
    }

    for (int i = 0; i < args.length; i++) {
      if (args[i].equals("--title")) {
        this.doc_title = args[++i];
      } else if (args[i].equals("--subject")) {
        this.doc_subject = args[++i];
      } else if (args[i].equals("--keywords")) {
        this.doc_keywords = args[++i];
      } else if (args[i].equals("--creator")) {
        this.doc_creator = args[++i];
      } else if (args[i].equals("--author")) {
        this.doc_author = args[++i];
      } else if (args[i].equals("--print-info")) {
        this.print_info = true;
      } else if (args[i].equals("--print-keywords")) {
        this.print_keywords = true;
      } else if (args[i].equals("--user-password")) {
        this.encrypt     = true;
        this.user_passwd = args[++i];
      } else if (args[i].equals("--master-password")) {
        this.encrypt      = true;
        this.owner_passwd = args[++i];
      } else if (args[i].equals("--encryption-bits")) {
        i++;
        this.encrypt = true;

        if (args[i].equals("128")) {
          this.encryption_bits = PdfWriter.STRENGTH128BITS;
        } else if (args[i].equals("40")) {
          this.encryption_bits = PdfWriter.STRENGTH40BITS;
        } else {
          usage();
          System.exit(1);
        }

        continue;
      } else if (args[i].equals("--permissions")) {
        i++;

        StringTokenizer st = new StringTokenizer(args[i], ",");
        while (st.hasMoreTokens()) {
          String s = st.nextToken();
          if (s.equals("print")) {
            this.permissions |= PdfWriter.AllowPrinting;
          } else if (s.equals("degraded-print")) {
            this.permissions |= PdfWriter.AllowDegradedPrinting;
          } else if (s.equals("copy")) {
            this.permissions |= PdfWriter.AllowCopy;
          } else if (s.equals("modify-contents")) {
            this.permissions |= PdfWriter.AllowModifyContents;
          } else if (s.equals("modify-annotations")) {
            this.permissions |= PdfWriter.AllowModifyAnnotations;
          } else if (s.equals("assembly")) {
            this.permissions |= PdfWriter.AllowAssembly;
          } else if (s.equals("fill-in")) {
            this.permissions |= PdfWriter.AllowFillIn;
          } else if (s.equals("screen-readers")) {
            this.permissions |= PdfWriter.AllowScreenReaders;
          } else {
            log.warn("Unknown permission '" + s + "' ignored");
          }
        }

        continue;
      } else if (args[i].startsWith("--")) {
        log.error("Unknown option '" + args[i] + "'");
      } else if (this.input_file == null) {
        this.input_file = args[i];
      } else if (this.output_file == null) {
        this.output_file = args[i];
      } else {
        usage();
      }
    }
  }


  /**
   * Validate the Options
   */
  private void validateOptions() {
    if (!this.print_keywords && !this.print_info) {
      if ((this.input_file == null) || (this.output_file == null)) {
        usage();
        System.exit(1);
      }

      if (this.input_file.equals(this.output_file)) {
        log.error("Input and output files must be different");
        System.exit(1);
      }
    }
  }


  /**
   * Print Document Information
   */
  @SuppressWarnings("rawtypes")
  private void printDocumentInfo() {
    /*
     *  Print the document information if asked to do so
     */
    log.info("Document information:");

    final Iterator it = this.info.entrySet().iterator();
    while (it.hasNext()) {
      final Map.Entry entry = (Map.Entry) it.next();
      log.info(entry.getKey() + " = \"" + entry.getValue() + "\"");
    }
  }


  /**
   * Print Document Keywords
   */
  private void printDocumentKeywords() {
    String keywords = "" + this.info.get("Keywords");
    if ((null == keywords) || "null".equals(keywords)) {
      keywords = "";
    }

    log.info(keywords);
  }


  /**
   * Transfer Document Metadata
   *
   * If any meta data field is unspecified,
   * copy the value from the input document
   */
  private void transferDocumentMetadata() {
    if (this.doc_title == null) {
      this.doc_title = (String) this.info.get("Title");
    }

    if (this.doc_subject == null) {
      this.doc_subject = (String) this.info.get("Subject");
    }

    if (this.doc_keywords == null) {
      this.doc_keywords = (String) this.info.get("Keywords");
    }

    if (this.doc_creator == null) {
      this.doc_creator = (String) this.info.get("Creator");
    }

    if (this.doc_author == null) {
      this.doc_author = (String) this.info.get("Author");
    }

    /*
     * Null metadata field are set to the empty string
     */
    if (this.doc_title == null) {
      this.doc_title = "";
    }

    if (this.doc_subject == null) {
      this.doc_subject = "";
    }

    if (this.doc_keywords == null) {
      this.doc_keywords = "";
    }

    if (this.doc_creator == null) {
      this.doc_creator = "";
    }

    if (this.doc_author == null) {
      this.doc_author = "";
    }
  }


  /**
   * Main Function
   *
   * @param args the command line arguments
   */
  public static void main(String[] args) throws Exception {
    final PDFMeta pdfMeta = new PDFMeta(args);
    pdfMeta.run();
  }
}
