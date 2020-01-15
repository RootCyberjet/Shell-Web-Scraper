###################################################################################
#			NAME		: SHIBA BISWAS
#			DESIGNATION	: STUDENT
#			EMAIL		: shibabiswas1111@gmail.com
#			COUNTRY		: INDIA
###################################################################################

#! /bin/bash

#WEB SCRAPING (ONLY FOR AMAZON.IN MOBILE COLLECTION)


#GOT INFORMATION FROM CLIENT
echo "-----------------------------------------------------------"
echo -e "Enter Mobile's BRAND  name* : \c"
read br
echo -e "Enter MODEL name* : \c"
read mod
echo -e "Enter COLOR* : \c"
read col
echo -e "Required RAM(Optional) : \c"
read ram
echo -e "Required STORAGE(Optional) : \c"
read storage
echo "WAITING ..."


#MAKE A SEARCH STRING
query=$br+$mod+$col+$ram+$storage
amazon="https://www.amazon.in/s?k="
search=$amazon$query


#CAPTURE SOURCE-CODE BY LYNX BROWSER
lynx -source "$search" > /home/sourceCode.txt


#CAPTURE DATA
detail=$(cat /home/sourceCode.txt | tr '"' "'" | sed -n "/a-text-normal'>$(echo ${br^})/p" | head -1 | cut -d ">" -f 2 | cut -d "<" -f 1)
price=$(sed -n '/<span class="a-price-whole">/p' /home/sourceCode.txt | head -1 | cut -d ">" -f 3 | cut -d "<" -f 1)
Oprice=$(sed -n '/<span aria-hidden="true">₹/p' /home/sourceCode.txt | head -1 | cut -d ">" -f 3 | cut -d "<" -f 1)
save=$(sed -n '/<span>Save/p' /home/sourceCode.txt | head -1 | cut -d ">" -f 4 | cut -d "<" -f 1)
link=$(sed -n "/#customerReviews/p" /home/sourceCode.txt | head -1 | cut -d '"' -f 6 | cut -d "#" -f 1)


#ECHO DETAILS
echo "-----------------------------------------------------------"
echo "			DATA FROM AMAZON.IN			 "
echo "-----------------------------------------------------------"
echo "MODEL DETAILS 	: $detail"
echo "BUYING PRICE  	: $price"
echo "ORIGINAL PRICE	: $Oprice"
echo "SAVINGS		: $save"
echo "WEBSITE LINK	: https://www.amazon.in$link"
echo "-----------------------------------------------------------"
#####################################################################################

