#! /usr/bin/bash	

# Author: Greekforce1821
#
# Description: 
#
##################################################################################################
###The Spiritbeat tool will convert the README.md file into .pdf and .html files simultaneously###
###In order to use this shell script you will need to open a terminal window, and run#############
###the command: ./make.sh in order to start the automated procedure.##############################
##################################################################################################
#
# Starting the Procedure:

if [ ! -d "./pdf" ]; then
   echo "Created a pdf directory"
   mkdir ./pdf
fi

if [ ! -d "./html" ]; then
   echo "Created an html directory"
   mkdir ./html
fi

echo "Searching for the MYREADME.md file in the local directory: "

ls

echo "The script found the file and it will start the conversion procedure in a while. Please Standby! "

# Here, the program will print a "draft" menu inspired by my colleague @nkanagno (https://github.com/nkanagno) which I thank him.

echo "Choose the .md file you wish to be converted into various formats:
     a) MYREADME.md"
read option_one


if [ "$option_one" = "a" ];
then

echo "Select which output you wish the .md file to be converted into:
a) .pdf
b) .html"
read option_two

    if [ "$option_two" = "b" ];
    then
   	echo "Initiating the convertion from .md to .html file. Please Standby!"
        pandoc -s MYREADME.md --metadata title="README" -o README.html
        echo "The convertion was a success, you may open the .html file!"
    else
        echo "Initiating the conversion from .md to .pdf file. Please Standby!"
        pandoc -N --quiet --variable "geometry=margin=1.2in" --variable mainfont="DejaVuSansMono" --variable sansfont="DejaVuSansMono" --variable monofont="DejaVuSansMono" --variable fontsize=12pt --variable version=2.0 MYREADME.md  --pdf-engine=xelatex --toc -o MYREADME.pdf
        echo "The convertion was a success, you may open the .pdf file!"
    fi
fi

echo "Thank you for using Spiritbeat! If you encountered problems, 
please don't hesitate to contact me!"

############################################################################
####COPYRIGHT: GREEKFORCE1821 2022-2023 WITH THE CONTRIBUTION OF NKANAGNO###
############################################################################
