###################################################################################
#			NAME		: SHIBA BISWAS
#			DESIGNATION	: STUDENT
#			EMAIL		: shibabiswas1111@gmail.com
#			COUNTRY		: INDIA
###################################################################################

#! /bin/bash

#WEB SCRAPING (ONLY FOR AMAZON.IN MOBILE COLLECTION)


#GOT INFORMATION FROM CLIENT. '*' indicates required field for better match.
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
query1=$br+$mod+$col+$ram+$storage
amazon="https://www.amazon.in/s?k="
search1=$amazon$query1


#CAPTURE SOURCE-CODE BY LYNX BROWSER
lynx -source "$search1" > /home/sourceCode.txt


#CAPTURE DATA
detail1=$(cat /home/sourceCode.txt | tr '"' "'" | sed -n "/a-text-normal'>$(echo ${br^})/p" | head -1 | cut -d ">" -f 2 | cut -d "<" -f 1)
price1=$(sed -n '/<span class="a-price-whole">/p' /home/sourceCode.txt | head -1 | cut -d ">" -f 3 | cut -d "<" -f 1)
Oprice1=$(sed -n '/<span aria-hidden="true">₹/p' /home/sourceCode.txt | head -1 | cut -d ">" -f 3 | cut -d "<" -f 1)
save1=$(sed -n '/<span>Save/p' /home/sourceCode.txt | head -1 | cut -d ">" -f 4 | cut -d "<" -f 1)
link1=$(sed -n "/#customerReviews/p" /home/sourceCode.txt | head -1 | cut -d '"' -f 6 | cut -d "#" -f 1)


#ECHO DETAILS
echo "------------------------------------------------------------"
echo "			DATA FROM AMAZON.IN			 "
echo "------------------------------------------------------------"

echo "MODEL DETAILS 	: $detail1"
echo "BUYING PRICE  	: $price1"
echo "ORIGINAL PRICE	: $Oprice1"
echo "SAVINGS		: $save1"
echo "WEBSITE LINK	: https://www.amazon.in$link1"


echo "------------------------------------------------------------"
echo -e "N.B: IF SHOWING RESULTS ARE NOT MATCHED WITH YOUR GIVEN\nDETAILS, THAT'S MEAN THE PRODUCT MAY NOT AVAILABLE THEREIN."


#WEB SCRAPING (ONLY FOR FLIPKART MOBILE COLLECTION)


#GOT INFORMATION FROM CLIENT
#echo "------------------------------------------------------------"
#echo -e "Enter Mobile's BRAND  name* : \c"
#read br
#echo -e "Enter MODEL name* : \c"
#read mod
#echo -e "Enter COLOR* : \c"
#read col
#echo -e "Required RAM(Optional) : \c"
#read ram
#echo -e "Required STORAGE(Optional) : \c"
#read storage
#echo "WAITING ..."

#MAKE A SEARCH STRING
query2=$br%20$mod%20$col%20$ram%20$storage
flipkart="https://www.flipkart.com/search?q="
search2=$flipkart$query2


#CAPTURE SOURCE-CODE BY LYNX BROWSER
lynx -source "$search2" > /home/sourceCode1.txt

#CAPTURE DATA
detail2=$(cat /home/sourceCode1.txt | tr "<" "\012" | grep "3wU53n" | head -1 | cut -d ">" -f 2)
price2=$(cat /home/sourceCode1.txt | tr "<" "\012" | grep "2rQ-NK" | head -1 | cut -d ">" -f 2)
Oprice2=$(cat /home/sourceCode1.txt | tr "/" "\012" | grep "3auQ3N" | head -1 | cut -d "<" -f 3 | cut -d ">" -f 2)
save2=$(cat /home/sourceCode1.txt | tr "/" "\012" | grep "VGWI6T" | head -1 | cut -d "<" -f 3 | cut -d ">" -f 2)
link2=$(cat /home/sourceCode1.txt | tr ">" "\012" | grep "31qSD5" | head -1 | cut -d '"' -f 8)


#ECHO DETAILS
echo "------------------------------------------------------------"
echo "			DATA FROM FLIPKART.COM			  "
echo "------------------------------------------------------------"
echo "MODEL DETAILS 	: $detail2"
echo "BUYING PRICE  	: $price2"
echo "ORIGINAL PRICE	: ₹$Oprice2"
echo "SAVINGS		: $save2"
echo "WEBSITE LINK	: https://www.flipkart.com$link2"
echo "------------------------------------------------------------"
echo -e "N.B: IF SHOWING RESULTS ARE NOT MATCHED WITH YOUR GIVEN\nDETAILS, THAT'S MEAN THE PRODUCT MAY NOT AVAILABLE THEREIN."
echo "------------------------------------------------------------"

###################################################################################
