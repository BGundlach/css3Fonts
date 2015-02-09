# css3fonts

QUICK START GUIDE:
------------------

This CSS3 Font Converter is a shell script that allows developers, using a
command line, to convert a set of fonts, TTF/OTF/WOFF/WOFF2 into all the other
currently used CSS3 @font-face formats (i.e. EOT, SVG, WOFF, WOFF2).  
Syntax:

    css3fonts <filelist>

For example, if you wanted to convert all the ttf files in your projects fonts folder and output the stylesheet to your scss folder, In your project base you could type in the command:

    $ css3fonts fonts/*.ttf --prefix="ProjectName" -o scss/_fonts.scss

The fonts will then be converted to the .eot, .woff, and .svg formats.  It
will also generate a stylesheet, stylesheet.css, that will produce the
@font-face rules using The New Bulletproof @Font-Face Syntax.  

If you are converting .otf fonts or .woff2, a .ttf font will be generated first before
the other fonts. If you are converting .woff, it will first convert to .otf, then ttf.


FULL COMMAND LINE OPTIONS:
---------------------------
```
Usage: $0 [--options] [fontfilelist]

Where: - [fontfilelist] is a space separated list of ttf otf woff2 woff fonts.
         
       - [--options] are one of the following:

-m --minify[=<string>]  limits the font to <string> or A-z,0-9 and punctuation
-w --weight             merge font-weights and styles under same font name
-s --stretch            merge condensed and expanded fonts under same font name
-H --autohint           hint fonts
-p --prefix=<prefix>    prepend the name of all the fonts with this string
-o --output=<filename>  the default output file is c3f.css
-f --show-features      display a list of OpenType feature tags a font supports
-h --help               this help menu.
  
This script can run on any version of linux running bash and is designed to 
also run under Windows using Cygwin. Installation instructions and more 
information can be found at http://github.com/BGundlach/css3fonts or 
http://mrkt.ga/F2

BSD derivitives (looking at you mac) may need to install the linux getopt 
for this script to work properly.
```

SUPPORTED OSes:
---------------

Windows (using Cygwin), OS X and Linux (tested on Ubuntu 10.10 Maverick
Meerkat and crunchbang 11 waldorf).  Please let us know if you find it works on others.

This script should run on any version of UNIX running bash.
Installation instructions and more information can be found at [Gundlach Marketing](http://gundlach-marketing.com/blog/create-webfont-css-kits-from-your-command-line "webfonts from your command line")


REQUIREMENTS:
-------------

This script uses the following programs to do the heavy listing.
  - Fontforge:        [http://fontforge.sourceforge.net/](http://fontforge.sourceforge.net/)
  - ttf2eot:          [http://www.npmjs.com/package/ttf2eot](http://www.npmjs.com/package/ttf2eot)
  - sfnt2woff:        [http://people.mozilla.com/~jkew/woff/](http://people.mozilla.com/~jkew/woff/)
  - woff2sfnt:        [http://people.mozilla.com/~jkew/woff/](http://people.mozilla.com/~jkew/woff/)
  - ttfautohint:      [http://www.freetype.org/ttfautohint/](http://www.freetype.org/ttfautohint/)
  - woff2_compress:   [http://code.google.com/p/font-compression-reference/w/list](http://code.google.com/p/font-compression-reference/w/list)
  - woff2_decompress: [http://code.google.com/p/font-compression-reference/w/list](http://code.google.com/p/font-compression-reference/w/list)
  - EOTFAST:          [http://eotfast.com/  *windows only*](http://eotfast.com/)
  
INSTALLATION:
-------------

The below commands will install the necessary dependencies on debian or ubuntu as well as the css3fonts script. 

I'm assuming you have git and [node.js](http://nodejs.org) installed (if not, install node now).  You can add git to the end of the first command if you don't have it already.

```bash
sudo apt-get install ttfautohint fontforge # git if you don't have it
sudo npm install -g ttf2eot  # need node for this
```


```
mkdir ~/bin/sfnt2woff-src
wget http://people.mozilla.org/~jkew/woff/woff-code-latest.zip
unzip woff-code-latest -d ~/bin/sfnt2woff-src
rm woff-code-latest.zip
cd ~/bin/sfnt2woff-src
make
cp sfnt2woff woff2sfnt ../
git clone https://github.com/google/woff2.git
cd woff2
git submodule init
git submodule update
make clean all
cp woff2_compress woff2_decompress ../
cd ../
git clone https://github.com/BGundlach/css3fonts.git
ln -sT css3FontConverter/css3fonts ~/bin/css3fonts
rm -r sfnt2woff-src woff2

```

LICENSE:
--------

This code is released under the WTFPL 3.0.  License can be found in the license file.  It is based off of
[Sam Hocevar's WTFPL](http://wtfpl.net)

CHANGELOG:
----------

### Authored By Zoltan

Feb 20, 2011 - Initial Release

Sep 22, 2013 - Added support for font-weight and autohinting, as well as reporting what font-feature-support tags (i.e. OpenType feature tags) are implemented by a font.

Sep 02, 2014 - Added support for WOFF2 fonts, if woff2_compress is in the user's path.  This program can be retrieved from here: http://code.google.com/p/font-compression-reference/w/list

### Authored By Brian

Jan 24, 2015 - Added symlink frindly code as well as a debian install script and updated ttf2eot to the maintained node module

Jan 25, 2015 - Added support for woff and woff2 fonts as valid input.

Feb 3, 2015 - Added "--minify" option & associated capabilities.

CONTACT:
--------

Any bug reports, fixes or feature requests should be posted to the github repo at [https://github.com/BGundlach/css3FontConverter](https://github.com/BGundlach/css3fonts "css3fonts")

If you think this script is pretty slick and want to hire me as a front end developer, contact me at GundlachWebDesign@gmail.com
