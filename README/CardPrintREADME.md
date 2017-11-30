# CardPrint TaskCard Creator Replacement #

# Objective #
- To replace the windows card creator with a linux based system 
- This system will be able to replace the functions of:
1. Creating Cards to be printed with modified headers


# Requirements
- cups-pdf 
     - (OutputFolder default at ~/PDF)
- libreoffice --pt PDF
- openjade, openjade1.3
- pdftk
- Task_Card_App System Files
	AMM.CFE
	AMM.DTD
	AMM.gia
	AMM.SCE
	AMM.SDL
	AMM.SGE
	AMM.SNE
	AMM.SWE
	builtins.dsl
	CARD.DSL
	CARD.DTD
	catalog
	dsssl.dtd
	fot.dtd
	style-sheet.dtd
- Adding to the path variable so that program will be called from anywhere
     - export PATH=$PATH:</path/to/file> to your ~/.bashrc file (just at the end is fine).


#Open Items
- waiting for for printing to finish before moving from ~/PDF to ./temp/
- ooffice to print rtfs to prevent gibberish to print
- attaching pdfattaches or graphics

