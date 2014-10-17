# David Rubello Matrix Compiler

## Syntax for Compiler

Put all content into the file contents.txt, place contents for each page in the order that they will be situated on the index page.

### The following text:

    %slug a_new_page 
    %title Title For the Page 

    A paragraph...no synatax indicator needed... will go on until the next carriage return

    %h2 A subtitle

    Another paragraph. This one has some text in *italics* and some text in **bold**

    %img example_1.jpg
    %caption A caption for the image 

    An in-line link %link[slug_to_link_to,Title or other Linking Text] in the middle of a paragraph. And here is a link to another site: %link[http://saganipsum.com/,Sagan Ipsum]

### Will Compile to:

    <!DOCTYPE html>
    <html lang="en">
    <head>
    <meta name="description" content="David Rubello" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1 user-scalable=0" />
    <title>Title For the Page</title>
    <link rel="stylesheet" href="css/main.css" />
    </head>
    <body class="lt-green">
    <div class="article">
    <h1>Title For the Page</h1>
    <h2>A Subtitle</h2>
    <p>A paragraph...no synatax indicator needed... will go on until the next carriage return</p>
    <img src="img/example_1.jpg" alt="example_1"><div class=" image-caption">A caption for the image</div>
    <p>A paragraph...with a link <a href="slug_to_link_to.html">Title or other Linking Text</a> in the middle of it.</p>
    </div>
    </body>
    </html>

## To run compiler:

    cd rubello_piper
    chmod 777 compiler.rb 
    ./compiler.rb

## Credits

* Matthew Piper...
* David Rubello...
* [Sagan Ipsum](http://saganipsum.com/) was used for the sample text
* [Fluid Squares](http://fluidsquares.com/) was used for the grid styling
