########################################################################################
#				NAME		: SHIBA BISWAS
#				DESIGNATION	: STUDENT
#				EMAIL		: shibabiswas1111@gmail.com
#				COUNTRY		: INDIA
#########################################################################################


#! /bin/bash

#WEB SCRAPING (ONLY FOR FLIPKART MOBILE COLLECTION)


#GOT INFORMATION FROM CLIENT
echo "------------------------------------------------------------"
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
query=$br%20$mod%20$col%20$ram%20$storage
flipkart="https://www.flipkart.com/search?q="
search=$flipkart$query


#CAPTURE SOURCE-CODE BY LYNX BROWSER
lynx -source "$search" > /home/sourceCode1.txt

#CAPTURE DATA
detail=$(cat /home/sourceCode1.txt | tr "<" "\012" | grep "3wU53n" | head -1 | cut -d ">" -f 2)
price=$(cat /home/sourceCode1.txt | tr "<" "\012" | grep "2rQ-NK" | head -1 | cut -d ">" -f 2)
Oprice=$(cat /home/sourceCode1.txt | tr "/" "\012" | grep "3auQ3N" | head -1 | cut -d "<" -f 3 | cut -d ">" -f 2)
save=$(cat /home/sourceCode1.txt | tr "/" "\012" | grep "VGWI6T" | head -1 | cut -d "<" -f 3 | cut -d ">" -f 2)
link=$(cat /home/sourceCode1.txt | tr ">" "\012" | grep "31qSD5" | head -1 | cut -d '"' -f 8)


#ECHO DETAILS
echo "------------------------------------------------------------"
echo "			DATA FROM FLIPKART.COM			  "
echo "------------------------------------------------------------"
echo "MODEL DETAILS 	: $detail"
echo "BUYING PRICE  	: $price"
echo "ORIGINAL PRICE	: ₹$Oprice"
echo "SAVINGS		: $save"
echo "WEBSITE LINK	: https://www.flipkart.com$link"
echo "------------------------------------------------------------"

#####################################################################################
