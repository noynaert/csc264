# Notes on Latex fonts

The Emerald font package needs to be installed for the Augie (handwriting font) font.

Download the emerald font from [https://ctan.org/tex-archive/fonts/emerald?lang=en](https://ctan.org/tex-archive/fonts/emerald?lang=en)  Be sure to unzip the file.  It should make a folder named `emerald`.

I had to find the `texmf` folder. On Feedora 42, I found the directory I needed at /var/lib/texmf/fonts/map/dvips.  I copied ~/Downloads/emerald/fonts/map/dvips/emerald.map to /var/lib/texmf/fonts/map/dvips

Then I had to run `mktexlsr` to rebuild the font database.  Then I restarted Code.

Also, the are .ttf files in the emerald folder that may be added with font manager.

OK.  So none of that worked.