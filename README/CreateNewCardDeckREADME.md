# Description
This Program is an alternative to the JITCG Program which creates a set of baseline taskcards
from the current AMM.sgm and the excel MS excel file.
This produces an output of a set of cards 

# Program dependencies
- Rscript 
- 

# Files / Folders:
- /System 	- Contains the programs needed to run 
- CreateNewCardDeck - Bash program which is the main program to call to create the base cards 
		1. Splits AMM.SGM to AMMTASK.SGM and AMMGRAPHIC.SGM
		2. Calls on JITCG.R which creates the first half of the cards from the MS Excel 		
		3. Uses TCRef.csv to attach the AMM References to the Cards.sgm at pathtoOutput
		4. Uses TCRef.csv to attach the Graphics to the Cards.sgm at pathtOutput
- CreateNewCardDeck.R 	- Contains the R program which is called from ./CreateBaseCards.
	  	- This program Creates the first half of the cards (header) from the MS Excel
	  	- Inputs are var.txt and output is TCRef.csv

# Temporary Files
- var.txt 	- txt file which contains variables which will be passed from ./CreateBaseCards to JITCG.R
- TCRev.csv 	- A file which has the Task Card Number and the AMM Reference. 
		- Used by ./CreateBaseCards to search AMM.SGM to attach to the card
		- Contains two variables: CardNo, and AMMRef (Condensed) 
- AMMTASK.SGM	- AMM.SGM separated per line to be a <TASK>
- AMMGRAPHIC.SGM - AMM.SGM separated per line to be <GRAPHREF>

# Variables:	- these are asked by CreateBaseCards
- pathtoAMM 	- full path to AMM.SGM. Default is "../AMM.SGM"
- pathtoMS	- full path to MS Excel file.
- pathtoOutput 	- output location where Cards will be created

# Required Inputs:
- AMM.SGM 	- Airbus AMM.SGM file provided by the manufacturer
- MS Excel	- Consolidated MS Excel file. Assumes this is at Sheet 1, Row 2 has headers, 15 Columns are taken in
- 

# Open Stuff
- problem with engine applicability? does not show
DSL  / DTD of the smaples not aligned
Note: this file is more updated than the A350 creator

to do in PAL:

PATH=$PATH:</path/to/file> to the ~/.bashrc

