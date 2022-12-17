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

for a_dir in pdf html docx txt odt ipynb
do 
  if [ ! -d "${a_dir}" ]; then
    echo "Creating a ${a_dir} directory"
    mkdir "${a_dir}" || {
      echo "  Error creating directory: ${a_dir}"
      exit 1
    }
  fi
done 

while true 
do
  clear
  echo "Searching for MarkDown files in the local directory: "
  COUNT=0
  for n in *.md
  do 
    MCOUNT=$((COUNT+1))
    F+=( "$n" )
    echo "    ${MCOUNT}. ${F[$COUNT]}"
    ((COUNT++))
  done

  echo -n "Select a file to be converted: "
  read ANS
  if [ -z "$ANS" ]; then ANS="2020";fi

  ((ANS--))
  FILE_NAME="${F[$ANS]}"
  if [ ! -z "${FILE_NAME}" ]
  then
    break
  fi 
done

while true
do
  clear
  echo -n "Select which output you wish the .md file to be converted into:
  a) .pdf
  b) .html
  c) .txt
  d) .docx
  e) .odt
  f) .ipynb
  g) all of the above formats
or type any other key to exit: "
  read option_two

  if [ "$option_two" = "b" ];
  then
    echo "Initiating the conversion from .md to .html file. Please Standby!"
    pandoc -s "${FILE_NAME}" --metadata title="README" -o html/"${FILE_NAME/.md/}".html
  elif [ "$option_two" = "a" ];
  then
    echo "Initiating the conversion from .md to .pdf file. Please Standby!"
    pandoc -N --quiet --variable "geometry=margin=1.2in" --variable mainfont="DejaVuSansMono" \
      --variable sansfont="DejaVuSansMono" --variable monofont="DejaVuSansMono" \
      --variable fontsize=12pt --variable version=2.0 "${FILE_NAME}" \
      --pdf-engine=xelatex --toc -o pdf/"${FILE_NAME/.md/}".pdf
        elif [ "$option_two" = "c" ];
        then
          echo "Initiating the conversion from .md to .txt file. Please Standby!"
          pandoc -f markdown -t plain "${FILE_NAME}" -o txt/"${FILE_NAME/.md/}".txt
        elif [ "$option_two" = "d" ];
        then
          echo "Initiating the conversion from .md to .docx file. Please Standby!"
          pandoc "${FILE_NAME}" -f markdown -t docx -o docx/"${FILE_NAME/.md/}".docx
        elif [ "$option_two" = "e" ];
        then
          echo "Initiating the conversion from .md to .odt file. Please Standby!"
          pandoc "${FILE_NAME}" -o odt/"${FILE_NAME/.md/}".odt
        elif [ "$option_two" = "f" ];
        then
          echo "Initiating the conversion from .md to .ipynb file. Please Standby!"
          pandoc "${FILE_NAME}" -o ipynb/"${FILE_NAME/.md/}".ipynb
        elif [ "$option_two" = "g" ];
        then
          echo "Initiating the conversion of the .md file to all the above formats. Please Standby!"
          pandoc -s "${FILE_NAME}" --metadata title="README" -o html/"${FILE_NAME/.md/}".html
          pandoc -N --quiet --variable "geometry=margin=1.2in" --variable mainfont="DejaVuSansMono" \
            --variable sansfont="DejaVuSansMono" --variable monofont="DejaVuSansMono" \
            --variable fontsize=12pt --variable version=2.0 "${FILE_NAME}" \
            --pdf-engine=xelatex --toc -o pdf/"${FILE_NAME/.md/}".pdf
          pandoc -f markdown -t plain "${FILE_NAME}" -o txt/"${FILE_NAME/.md/}".txt
          pandoc "${FILE_NAME}" -f markdown -t docx -o docx/"${FILE_NAME/.md/}".docx
          pandoc "${FILE_NAME}" -o odt/"${FILE_NAME/.md/}".odt
          pandoc "${FILE_NAME}" -o ipynb/"${FILE_NAME/.md/}".ipynb
        else
          break
  fi
  echo "The conversion was a success, you may open the converted file(s)!"
  echo
  echo -n "Press ENTER to continue..."
  read
done

clear
echo "Thank you for using Spiritbeat! If you encountered problems, 
please don't hesitate to contact me!"

############################################################################
####COPYRIGHT: GREEKFORCE1821 2022-2023 WITH THE CONTRIBUTION OF NKANAGNO###
############################################################################

