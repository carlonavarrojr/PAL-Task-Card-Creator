<!DOCTYPE style-sheet PUBLIC "-//James Clark//DTD DSSSL Style Sheet//EN" []>
<!--
[
<!ENTITY html-ss 
  PUBLIC "-//Norman Walsh//DOCUMENT DocBook HTML Stylesheet//EN" CDATA dsssl>
]
-->

<style-sheet>
<!--
<style-specification id="html" use="html-stylesheet">
<style-specification-body>
-->

(define-unit in 0.0254m)

(mode foot
  (element source
    (make sequence font-size: 7pt)))
    
(element taskcard
	(make simple-page-sequence
	page-width: 8.5in
	page-height: 11in
	top-margin: 1.5in
	bottom-margin: 1.25in
	right-margin: 0.75in
	left-margin: 0.75in
	header-margin: 0.8in
	footer-margin: 0.5in
	left-header: (make sequence
					font-family-name: "Courier"
					font-size: 9pt
					font-weight: 'bold
					(literal "DATE: "
					(attribute-string "wodate"))
					(literal "  TAIL NO.: "
					(attribute-string "tail"))
					(literal "  STATION: "
					(attribute-string "station"))
					(literal "  W/O NO: "
					(attribute-string "wo"))
					
					
				)
	
					
;	right-header: (make external-graphic
;					entity-system-id: "image.bmp"
;					display?: #t
;					)				

	left-footer: (make sequence
					font-family-name: "Courier"
					font-size: 9pt
					font-weight: 'bold
					;font-posture: 'italic
					(literal 
					(string-append
					"COMPLIANCE DATE: "
					"______________  "
					))
				)

	;center-footer: (with-mode foot (make sequence
	;			font-family-name: "Courier"
	;			font-size: 9pt
    ;           line-spacing: 14pt
    ;          font-posture: 'italic
    ;           (literal "SOURCE: ")
    ;           (process-first-descendant "source")))					USED TO CALL-OUT ELEMENT CONTENT
				
	center-footer: (make sequence
						font-family-name: "Courier"
						font-weight: 'bold
						font-size: 9pt
						(literal
						(attribute-string "cardnbr")
						)
               		)
               
               								
	right-footer: 	(make sequence
					font-family-name: "Courier"
					font-weight: 'bold
					font-size: 9pt
					(literal "PAGE  ")
					(page-number-sosofo)
					(literal " OF ")
					
					(if (= 0 (node-list-count (select-elements (descendants (current-node)) "graphic")))
					 
						(with-mode node-page
		            		(process-node-list
		                  	(node-list-last (select-elements
		                              (descendants (current-node)) "so"))))
		                              
		                (with-mode node-page
		            		(process-node-list
		                  	(node-list-last (select-elements
		                              (descendants (current-node)) "graphic"))))
					)
					)
			
			(make sequence
			font-size: 14pt
			
				
				(make paragraph
				font-family-name: "Courier"
				space-before: 4pt
				space-after: 12pt
				start-indent: 33pt 
				font-size: 16pt 
				font-weight: 'bold
				(literal "CARD NO.:     ") 
				(literal (attribute-string "cardnbr")))
				
				(make paragraph
				font-family-name: "Courier"
				space-before: 4pt
				space-after: 12pt
				start-indent: 33pt 
				font-size: 16pt 
				font-weight: 'bold 
				 (literal "DATE:         ")
				(literal (attribute-string "wodate")))
							
				(make paragraph
				font-family-name: "Courier"
				space-before: 4pt
				space-after: 12pt
				start-indent: 33pt  
				font-size: 16pt 
				font-weight: 'bold 
				(literal "TAIL NO.:     ")
				(literal (attribute-string "tail")))
				
				(make paragraph
				font-family-name: "Courier"
				space-before: 4pt
				space-after: 12pt
				start-indent: 33pt 
				font-size: 16pt 
				font-weight: 'bold 
				(literal "STATION:      ")
				(literal (attribute-string "station")))						
			
				(make paragraph
				font-family-name: "Courier"
				space-before: 4pt
				space-after: 24pt
				start-indent: 33pt 
				font-size: 16pt 
				font-weight: 'bold 
				(literal "W/O NO.:      ")
				(literal (attribute-string "wo")))
										
				(make paragraph
				font-family-name: "Courier"
				space-before: 4pt
				space-after: 12pt
				start-indent: 33pt 
				font-size: 11pt 
				font-weight: 'bold 
				(literal "CARD REV. DATE:     ")
				(literal (attribute-string "CARDREVDATE")))
				
				(make paragraph
				font-family-name: "Courier"
				space-before: 4pt
				space-after: 12pt
				start-indent: 33pt 
				font-size: 11pt 
				font-weight: 'bold 
				(literal "CARD REV. NO:       ")
				(literal (attribute-string "REVNUM")))
				
				(if (equal? (attribute-string "status") "ACTIV")
					
					(make paragraph (literal ""))
				
					(make paragraph
					font-family-name: "Courier"
					space-before: 4pt
					space-after: 24pt
					start-indent: 33pt
					font-weight: 'bold
					font-size: 11pt
					(literal "CARD REV. STATUS:   ")
					(literal (attribute-string "STATUS")))
					
				)						
				
			)
					
	(process-children)
	)
)


(mode node-page
     (default (current-node-page-number-sosofo)))

(define wodate (attribute-string "wodate"))

(element mainhead
	(make sequence
	font-size: 10pt
	font-family-name: "Courier"
;	(with-mode sourcex (process-first-descendant "source"))
	(make sequence
		(process-matching-children "source")
		(process-matching-children "refdata")
		(process-matching-children "skill")
		(process-matching-children "workarea")
		(process-matching-children "intdata")
		(process-matching-children "tasktype")
		(process-matching-children "apapdata")
		(process-matching-children "zdata")
		(process-matching-children "acdata")
		(process-matching-children "title")
		(process-matching-children "tnote")
		
;		(process-children)
	)	
	)
)

(element tcbody
	(make sequence
	font-size: 10pt
	font-family-name: "Courier"
	(process-children)
		(make paragraph
		space-before: 0pt
		quadding: 'center
		(literal "***** END *****")
		)
	)
)

(element so
	(if (node-list-empty? (select-elements (rsiblings (current-node)) "DELETED"))
	
	(if (equal? (attribute-string "id") "1")
	(make paragraph
	font-size: 14pt
	font-weight: 'bold
	space-before: 48pt
	quadding: 'end
	(process-children)
	(literal "MECH__________")
	)
		
		(if (equal? (attribute-string "id") "2")
		(make paragraph
		font-size: 14pt
		font-weight: 'bold
		space-before: 48pt
		quadding: 'end
		(process-children)
		(literal "INSP__________")
		)
	
			(if (equal? (attribute-string "id") "3")
			(make sequence
			font-size: 10pt
			font-weight: 'bold
			quadding: 'end
			(make paragraph
			space-before: 48pt
			space-after: 10pt
			(process-children)
			(literal "____NIL FINDINGS / SATISFACTORY "))
			(make paragraph
			space-after: 10pt
			(literal "____WITH FINDINGS / UNSATISFACTORY "))	
			(make paragraph
			space-after: 10pt
			(literal "(provide information and reference below)"))	
			(make paragraph
			space-after: 10pt
			(literal "__________________________________________"))
			(make paragraph
			space-after: 10pt			
			(literal "__________________________________________"))
			(make paragraph
			space-after: 10pt			
			(literal "__________________________________________"))
			(make paragraph
			(literal "__________________________________________"))
			)		
			
					(if (equal? (attribute-string "id") "4")
					(make paragraph
					font-size: 10pt
					font-weight: 'bold
					space-before: 48pt
					quadding: 'end
					(process-children)
					(literal "Enter the PN removed _________________")
					)
							(if (equal? (attribute-string "id") "5")
							(make paragraph
							font-size: 10pt
							font-weight: 'bold
							space-before: 48pt
							quadding: 'end
							(process-children)
							(literal "Enter the SN removed _________________")
							)
								(if (equal? (attribute-string "id") "6")
								(make paragraph
								font-size: 10pt
								font-weight: 'bold
								space-before: 48pt
								quadding: 'end
								(process-children)
								(literal "Enter the PN installed _________________")
								)
									(if (equal? (attribute-string "id") "7")
									(make paragraph
									font-size: 10pt
									font-weight: 'bold
									space-before: 48pt
									quadding: 'end
									(process-children)
									(literal "Enter the SN installed _________________")
									)
										(if (equal? (attribute-string "id") "8")
										(make sequence
										font-size: 10pt
										font-weight: 'bold
										quadding: 'end
										(make paragraph
										space-before: 48pt
										space-after: 10pt
										(process-children)
										(literal "PME: ____________________ "))
										(make paragraph
										space-before: 0pt
										space-after: 10pt
										(literal "Serial Number ______________ "))
										(make paragraph
										(literal "Calibration Due / Expiry Date _____________"))
										)
										
										(make paragraph
										font-size: 10pt
										font-weight: 'bold
										space-before: 48pt
										quadding: 'end
										(process-children)
										(literal "Record Measurement _________________")
										)
										
										
										
										)
									)							
								)
							)
					)
			)
				
		)
	)
	
	(make paragraph
	font-size: 1pt
	space-before: 48pt
	quadding: 'end
	(process-children)
	(literal ".")
	)
)
)

(element version
	(empty-sosofo)
)

(element chgdesc
	(empty-sosofo)
)

(element thrshtyp
	(empty-sosofo)
)

(mode sourcex
	(element source
	(make paragraph start-indent: 100pt
	(process-children)))
)


(element source
	(make sequence
		(make paragraph
		start-indent: 33pt
		space-before: 12pt
		(literal "SOURCE:               ")
		(process-children)
		)
	)
)

(element refdata
	(make sequence
	(make paragraph
	start-indent: 33pt
	space-before: 10pt
	(literal "REFERENCE:")
	)
		
	(make paragraph start-indent: 165pt
	(process-children)
	)
	)
)



(element reference
	(make sequence
		(if (= 1 (child-number))
	
			(make sequence
				(process-children)	
			)
			
			(make sequence
				(literal ", ")
				(process-children)
			)
		)
	)
)
	

(element skill
	(make sequence
		(make paragraph
		start-indent: 33pt
		space-before: 10pt
		(literal "SKILL:                ")
		(process-children)
		)
	)
)

(element samplethrshold
	(make sequence
		(make paragraph
		start-indent: 33pt
		space-before: 10pt
		(literal "SAMPLE THRESHOLD:  ")
		(process-children)
		)
	)
)

(element samplerepeat
	(make sequence
		(make paragraph
		start-indent: 33pt
		space-before: 10pt
		(literal "SAMPLE INTERVAL:   ")
		(process-children)
		)
	)
)

(element thrshold
	(make sequence
		(make paragraph
		start-indent: 33pt
		space-before: 10pt
		(literal "THRESHOLD:          ")
		(process-children)
		)
	)
)

(element repeat
	(make sequence
		(make paragraph
		start-indent: 33pt
		space-before: 10pt
		(literal "INTERVAL:             ")
		(process-children)
		)
	)
)

(element multiple
	(if (< 1 (child-number))
	
	(make sequence 
	(literal " OR ")
	(process-children)
	)
	
	(process-children)
	)
)
	
(element unit
	(make sequence
	(literal " ")
	(process-children)
	)
)

(element tasktype
	(make sequence
		(make paragraph
		start-indent: 33pt
		space-before: 10pt
		(literal "TASK:                 ")
		(process-children)
		)
	)
)

(element (apapdata apapplic)
	(make sequence
		(make paragraph
		start-indent: 33pt
		space-before: 10pt
		(literal "APPLICABILITY:      ")
		)
		
		(make paragraph start-indent: 165pt
		(process-children)
	)
	)
)

(element zdata
	(make sequence
	(make paragraph
	start-indent: 33pt
	space-before: 10pt
	(literal "ZONE:")
	)
		
	(make paragraph start-indent: 165pt
	(process-children)
	)
	)
)



(element zone
	(make sequence
		(if (= 1 (child-number))
	
			(make sequence
				(process-children)	
			)
			
			(make sequence
				(literal ", ")
				(process-children)
			)
		)
	)
)

;(literal (string-append (gi) ":"))			; USED TO DISPLAY THE ELEMENT NAME BEFORE THE ELEMENT CONTENT
;(literal (gi))								; (gi) represents element name

(element acdata
	(make sequence
	(make paragraph
	start-indent: 33pt
	space-before: 10pt
	(literal "ACCESS:     ")
	)
		
	(make paragraph start-indent: 165pt
	(process-children)
	)
	)
)



(element acpan
	(make sequence
		(if (= 1 (child-number))
	
			(make sequence
				(process-children)	
			)
			
			(make sequence
				(literal ", ")
				(process-children)
			)
		)
	)
)

(element (mainhead title)
	(make sequence
		(make paragraph
		start-indent: 33pt
		space-before: 10pt
		(literal "TITLE:     ")
		)
		
		(make paragraph start-indent: 165pt
		(process-children)
		)
	)
)

(element (mainhead tnote)
	(make sequence
		(make paragraph start-indent: 165pt
		space-before: 3pt
		font-size: 8pt
		(process-children)
		)
	)
)

(element task
	(if (equal? #f (attribute-string "VARNBR"))
 		(if (equal? #f (attribute-string "CONFLTR"))
			
 			(make paragraph
				break-before: 'page
				space-before: 0pt
				(literal
		   	 	(string-append
					"TASK "
		   	 		(attribute-string "CHAPNBR") "-"	; USED TO DISPLAY VALUE OF ATTRIBUTE "CHAPNBR"
		   	 		(attribute-string "SECTNBR") "-"
		   	 		(attribute-string "SUBJNBR") "-"
		   	 		(attribute-string "FUNC") "-"
		   	 		(attribute-string "SEQ")
				))
			(process-children)
			)
			
			(make paragraph
			break-before: 'page
			space-before: 0pt
			(literal
	   	 	(string-append
				"TASK "
	   	 		(attribute-string "CHAPNBR") "-"	; USED TO DISPLAY VALUE OF ATTRIBUTE "CHAPNBR"
	   	 		(attribute-string "SECTNBR") "-"
	   	 		(attribute-string "SUBJNBR") "-"
	   	 		(attribute-string "FUNC") "-"
	   	 		(attribute-string "SEQ") "-"
	   	 		(attribute-string "CONFLTR")
				))
			(process-children)
			)
					
			
		)
			
			
	(make paragraph
		break-before: 'page
		space-before: 0pt
		(literal
   	 	(string-append
			"TASK "
   	 		(attribute-string "CHAPNBR") "-"	; USED TO DISPLAY VALUE OF ATTRIBUTE "CHAPNBR"
   	 		(attribute-string "SECTNBR") "-"
   	 		(attribute-string "SUBJNBR") "-"
   	 		(attribute-string "FUNC") "-"
   	 		(attribute-string "SEQ") "-"
   	 		(attribute-string "VARNBR")
		))
	(process-children)
	)
	
	)
)

(element (task title)
		(make paragraph
		space-before: 12pt
		space-after: 12pt
		)
)

(mode extract-warning 
	(element(warning)
		(make paragraph 
		start-indent: 100pt
		font-weight: 'bold
;		(process-children)
		)
	)
)

(mode extract-title-text
      (element (TITLE)
      (process-children)))

(element title
	(make sequence
	font-weight: 'bold
	)
)      
      
(element pretopic
	(make paragraph
		space-before: 12pt
		space-after: 12pt
;		start-indent: 50pt
		(literal (format-number (child-number) "I"))
		(literal ". ")
;		(with-mode extract-title-text
;	   	(process-first-descendant "TITLE"))
	(process-children)
	)
)

(element (pretopic para)
	(make paragraph
	start-indent: 20pt
	space-before: 10pt
	space-after: 0pt)
)	

(element (pretopic unlist)
	(make paragraph
	start-indent: 20pt
	space-before: 10pt
	space-after: 0pt
	(literal (attribute-string "BULLTYPE"))
	(process-children)
	)
)	

(element (pretopic note)
	(make paragraph
	start-indent: 20pt
	space-before: 10pt
	space-after: 0pt)
)	

(element (pretopic list1 l1item)
	(make paragraph
	start-indent: 20pt
	space-before: 10pt
	(literal (format-number (child-number) "A"))
	(literal ". ")
	(process-children)
	)
)
	
(element warning
	(make sequence
	font-weight: 'bold
		(make paragraph	space-before: 12pt
		(literal "WARNING:     ")
		)
		
		(make paragraph 
		space-before: 3pt
		space-after: 12pt
		start-indent: 60pt
		(process-children)
		)
	)
)

(element (warning para)
		(make paragraph 
		start-indent: 60pt
		(process-children)
		)
)



(element (warning unlist unlitem para)
	(make paragraph
	start-indent: 60pt
	space-before: 0pt
	space-after: 0pt
;	(literal (inherited-attribute-string "BULLTYPE"))
	(literal "-")
	(process-children)
	)
)



(element caution
	(make sequence
	font-weight: 'bold
		(make paragraph	
		space-before: 12pt
		start-indent: 30pt
		(literal "CAUTION:     ")
		)
		
		(make paragraph 
		space-before: 3pt
		space-after: 12pt
		start-indent: 60pt
		(process-children)
		)
	)
)

(element (caution para)
		(make paragraph 
		start-indent: 60pt
		(process-children)
		)
)

(element (caution unlist unlitem para)
	(make paragraph
	start-indent: 60pt
	space-before: 0pt
	space-after: 0pt
;	(literal (inherited-attribute-string "BULLTYPE"))
	(literal "-")
	(process-children)
	)
)

(element (assodata zonelst)
	(empty-sosofo)
)

(element (assodata taskreq)
	(empty-sosofo)
)

(element (assodata elapstim)
	(empty-sosofo)
)

(element (assodata manhour)
	(empty-sosofo)
)

(element (assodata nbrpers)
	(empty-sosofo)
)


(element note
	(make sequence
		(make paragraph
		start-indent: 60pt
		space-before: 12pt
		(literal "NOTE:     ")
		)
		
		(make paragraph
			start-indent: 110pt
			space-after: 6pt	
			(process-children)
		)
	)
)
	
(element tgroup	
	(make table
		start-indent: 0pt
		space-before: 6pt
		space-after: 12pt
		display-alignment: 'center
		table-border: (make table-border line-thickness: 2pt)
		
		(process-children)
	)
)

(define COL1 1)
(define COL2 2)
(define COL3 3)
(define COL4 4)
(define COL5 5)
(define COL6 6)
(define COL7 7)
(define COL8 8)

;(element colspec
;	(make sequence
;	(if (equal? "ACTION" (process-first-descendant "PARA" ))
;			
;			(make table-column
;			column-number: (string->number (substring (attribute-string "COLNAME") 3 4))
;			width: (* 70 (string->number (string-append (substring (attribute-string "COLWIDTH") 0 (- (string-length (attribute-string "COLWIDTH")) 1)) "pt"))))
;	
;			(if (> 7 (string->number (substring (attribute-string "COLWIDTH") 0 (- (string-length (attribute-string "COLWIDTH")) 1))))
;			
;			(make table-column
;			column-number: (string->number (substring (attribute-string "COLNAME") 3 4))
;			width: 40pt)
;			
;			(make table-column
;			column-number: (string->number (substring (attribute-string "COLNAME") 3 4))
;			width: (* 5.7 (string->number (string-append (substring (attribute-string "COLWIDTH") 0 (- (string-length (attribute-string "COLWIDTH")) 1)) "pt"))))
;			
;			
;			)
;	)
;	)
;)
	

(element (thead row)
	(make table-row
	(make paragraph
		quadding: 'center
		font-weight: 'bold
	(process-children)
	))
)

(element (thead row entry)
	(make table-cell
		cell-before-column-border: #t
		cell-after-column-border: #t
		cell-after-row-border: #t
	(make paragraph
		start-indent: 3pt
		space-before: 4pt
		space-after: 4pt
		quadding: 'center
		font-size: 10pt
		font-weight: 'bold
	(process-children)
	))
)

(element (tbody row)
	(make table-row
		(process-children)
	)
)

;(element (row effect)
;	(make table-cell column-number: 5
;		(make paragraph 
;		font-size: 8pt
;		font-weight: 'bold
;		;font-posture: 'italic
;		space-after: 6pt
;			(make sequence
;				(literal "** ON A/C ")
;				(if (equal? (attribute-string "effrg") "001999")
;					(literal "ALL")
;					
;					(make sequence
;					(literal (substring(attribute-string "effrg") 0 3)) (literal "-") (literal (substring(attribute-string "effrg") 3 6))
;						
;						(if (= (string-length (attribute-string "effrg")) 13)
;						(make sequence	
;							(literal ", ") (literal (substring(attribute-string "effrg") 7 10)) (literal "-") (literal (substring(attribute-string "effrg") 10 13)))
;						(if (= (string-length (attribute-string "effrg")) 20)
;						(make sequence
;							(literal ", ") (literal (substring(attribute-string "effrg") 7 10)) (literal "-") (literal (substring(attribute-string "effrg") 10 13))							
;							(literal ", ") (literal (substring(attribute-string "effrg") 14 17)) (literal "-") (literal (substring(attribute-string "effrg") 17 20)))	
;						(if (= (string-length (attribute-string "effrg")) 27)
;						(make sequence
;							(literal ", ") (literal (substring(attribute-string "effrg") 7 10)) (literal "-") (literal (substring(attribute-string "effrg") 10 13))							
;							(literal ", ") (literal (substring(attribute-string "effrg") 14 17)) (literal "-") (literal (substring(attribute-string "effrg") 17 20))						
;							(literal ", ") (literal (substring(attribute-string "effrg") 21 24)) (literal "-") (literal (substring(attribute-string "effrg") 24 27)))	
;						
;						(process-children)					
;						)))
;					)
;				)
;			)
;		)
;	)
;)

(element entry
	
	(if (equal? (attribute-string "COLNAME") "COL1")	
	(make table-cell
	column-number: 1
	cell-before-row-border: #t
	cell-before-column-border: #t
	cell-after-row-border: #t
	cell-after-column-border: #t
	(process-element-with-id "effect")
	(make paragraph
	start-indent: 4pt
	quadding: 'start
	space-before: 3pt
	space-after: 3pt
	(process-children)
	))	
			(if (equal? (attribute-string "COLNAME") "COL2")	
			(make table-cell
			column-number: 2
			cell-before-row-border: #t
			cell-before-column-border: #t
			cell-after-row-border: #t
			cell-after-column-border: #t
			(make paragraph
			start-indent: 4pt
			quadding: 'start
			space-before: 3pt
			space-after: 3pt
			(process-children)
			))
				
				(if (equal? (attribute-string "COLNAME") "COL3")	
				(make table-cell
				column-number: 3
				cell-before-row-border: #t
				cell-before-column-border: #t
				cell-after-row-border: #t
				cell-after-column-border: #t
				(make paragraph
				start-indent: 4pt
				quadding: 'start
				space-before: 3pt
				space-after: 3pt
				(process-children)
				))
			
					(if (equal? (attribute-string "COLNAME") "COL4")	
					(make table-cell
					column-number: 4
					cell-before-row-border: #t
					cell-before-column-border: #t
					cell-after-row-border: #t
					cell-after-column-border: #t
					(make paragraph
					start-indent: 4pt
					quadding: 'start
					space-before: 3pt
					space-after: 3pt					
					(process-children)
					))
					
					(make table-cell
					cell-before-row-border: #t
					cell-before-column-border: #t
					cell-after-row-border: #t
					cell-after-column-border: #t
					(make paragraph
					start-indent: 4pt
					quadding: 'start
					space-before: 3pt
					space-after: 3pt					
					(process-children)
					))		
					)
				)
			)			
	)	
)





;(element topic
;	(make paragraph
;	numbered-lines?: #t
;	space-after: 12pt
;	)
;)

(element topic
	(make paragraph
		space-before: 12pt
		(literal (format-number (+ 2 (child-number)) "I"))
		(literal ". ")
	(process-children)
	)
)

(element (topic subtask)
	(let ( (del (select-elements (children (current-node)) "DELETED")))

		(if (node-list-empty? del)
						
			(make sequence
				(make paragraph
				font-weight: 'bold
				start-indent: 20pt
				space-before: 12pt
				space-after: 6pt
				(literal (string-append 
					"Subtask "
					(attribute-string "chapnbr") "-"
					(attribute-string "sectnbr") "-"
					(attribute-string "subjnbr") "-"
					(attribute-string "func") "-"
					(attribute-string "seq")
				))
				)
				(process-children)
			)
			
;			(empty-sosofo)
			
			(process-children)
			
		)	
	)		
)

(element (topic subtask list1 l1item)
	(make paragraph
	start-indent: 20pt
	space-before: 12pt
	space-after: 6pt
	(literal (format-number (ancestor-child-number "subtask") "A"))
	(literal ". ")
	(process-children)
	)
)

(element (subtask list1 l1item unlist unlitem para)
	(make paragraph
	start-indent: 40pt
	space-before: 0pt
	space-after: 0pt
;	(literal (inherited-attribute-string "BULLTYPE"))
	(literal "-")
	(process-children)
	)
)

(element (subtask list1 l1item list2 l2item unlist unlitem para)
	(make paragraph
	start-indent: 60pt
	space-before: 0pt
	space-after: 0pt
;	(literal (inherited-attribute-string "BULLTYPE"))
	(literal "-")
	(process-children)
	)
)

(element (subtask list1 l1item list2 l2item list3 l3item unlist unlitem para)
	(make paragraph
	start-indent: 80pt
	space-before: 0pt
	space-after: 0pt
;	(literal (inherited-attribute-string "BULLTYPE"))
	(literal "-")
	(process-children)
	)
)


(element (subtask list1 l1item numlist numlitem para)
	(make paragraph
	start-indent: 40pt
	space-before: 0pt
	space-after: 0pt
	(literal (inherited-attribute-string "NUMTYPE"))
	(process-children)
	)
)

(element (subtask list1 l1item list2 l2item numlist numlitem para)
	(make paragraph
	start-indent: 60pt
	space-before: 0pt
	space-after: 0pt
	(literal (inherited-attribute-string "NUMTYPE"))
	(process-children)
	)
)

(element (subtask list1 l1item list2 l2item list3 l3item numlist numlitem para)
	(make paragraph
	start-indent: 80pt
	space-before: 0pt
	space-after: 0pt
	(literal (inherited-attribute-string "NUMTYPE"))
	(process-children)
	)
)

(element (subtask list1 l1item list2 l2item list3 l3item list4 l4item numlist numlitem para)
	(make paragraph
	start-indent: 80pt
	space-before: 0pt
	space-after: 0pt
	(literal (inherited-attribute-string "NUMTYPE"))
	(process-children)
	)
)



(element (subtask list1 l1item list2 l2item)
	(make paragraph
	start-indent: 40pt
	space-before: 6pt
	space-after: 3pt
	(literal (format-number (child-number) "1"))
	(literal ". ")
	(process-children)
	)
)

(element (subtask list1 l1item list2 l2item list3 l3item)
	(make paragraph
	start-indent: 60pt
	space-before: 6pt
	space-after: 3pt
	(literal (format-number (child-number) "a"))
	(literal ". ")
	(process-children)
	)
)

(element (subtask list1 l1item list2 l2item list3 l3item list4 l4item)
	(make paragraph
	start-indent: 80pt
	space-before: 6pt
	space-after: 3pt
	(literal (format-number (child-number) "i"))
	(literal ". ")
	(process-children)
	)
)

(element (subtask list1 l1item list2 l2item list3 l3item list4 l4item list5 l5item)
	(make paragraph
	start-indent: 100pt
	space-before: 6pt
	space-after: 3pt
	(literal (format-number (child-number) "a"))
	(literal ". ")
	(process-children)
	)
)


(element (topic grphcref)
	(make paragraph
	space-before: 6pt
	start-indent: 20pt
		(make sequence
		(process-children)
		(literal ")")
		)
	)
)

(element (subtask list1 l1item para grphcref)
	(make paragraph
	space-before: 3pt
	start-indent: 40pt
		(make sequence
		(process-children)
		(literal ")")
		)
	)
)

(element (subtask list1 l1item list2 l2item para grphcref)
	(make paragraph
	space-before: 3pt
	start-indent: 60pt
		(make sequence
		(process-children)
		(literal ")")
		)
	)
)

(element (subtask list1 l1item list2 l2item list3 l3item para grphcref)
	(make paragraph
	space-before: 3pt
	start-indent: 80pt
		(make sequence
		(process-children)
		(literal ")")
		)
	)
)

(element (entry para grphcref)
	(make sequence
	(process-children)
;	(literal ")")
	)
)

(element (grphcref effect)
	(make sequence
		(make paragraph
			space-before: 0pt
			space-after: 6pt
			start-indent: 20pt
			font-size: 8pt
			font-weight: 'bold
			;font-posture: 'italic			
			(make sequence
				(literal "** ON A/C ")
				(if (equal? (attribute-string "effrg") "001999")
					(literal "ALL")
					
					(make sequence
					(literal (substring(attribute-string "effrg") 0 3)) (literal "-") (literal (substring(attribute-string "effrg") 3 6))
						
						(if (= (string-length (attribute-string "effrg")) 13)
						(make sequence	
							(literal ", ") (literal (substring(attribute-string "effrg") 7 10)) (literal "-") (literal (substring(attribute-string "effrg") 10 13)))
						(if (= (string-length (attribute-string "effrg")) 20)
						(make sequence
							(literal ", ") (literal (substring(attribute-string "effrg") 7 10)) (literal "-") (literal (substring(attribute-string "effrg") 10 13))							
							(literal ", ") (literal (substring(attribute-string "effrg") 14 17)) (literal "-") (literal (substring(attribute-string "effrg") 17 20)))	
						(if (= (string-length (attribute-string "effrg")) 27)
						(make sequence
							(literal ", ") (literal (substring(attribute-string "effrg") 7 10)) (literal "-") (literal (substring(attribute-string "effrg") 10 13))							
							(literal ", ") (literal (substring(attribute-string "effrg") 14 17)) (literal "-") (literal (substring(attribute-string "effrg") 17 20))						
							(literal ", ") (literal (substring(attribute-string "effrg") 21 24)) (literal "-") (literal (substring(attribute-string "effrg") 24 27)))	
;start
						(if (= (string-length (attribute-string "effrg")) 34)
						(make sequence
							(literal ", ") (literal (substring(attribute-string "effrg") 7 10)) (literal "-") (literal (substring(attribute-string "effrg") 10 13))							
							(literal ", ") (literal (substring(attribute-string "effrg") 14 17)) (literal "-") (literal (substring(attribute-string "effrg") 17 20))						
							(literal ", ") (literal (substring(attribute-string "effrg") 21 24)) (literal "-") (literal (substring(attribute-string "effrg") 24 27))	
							(literal ", ") (literal (substring(attribute-string "effrg") 28 31)) (literal "-") (literal (substring(attribute-string "effrg") 31 34)))	
						(if (= (string-length (attribute-string "effrg")) 41)
						(make sequence
							(literal ", ") (literal (substring(attribute-string "effrg") 7 10)) (literal "-") (literal (substring(attribute-string "effrg") 10 13))							
							(literal ", ") (literal (substring(attribute-string "effrg") 14 17)) (literal "-") (literal (substring(attribute-string "effrg") 17 20))						
							(literal ", ") (literal (substring(attribute-string "effrg") 21 24)) (literal "-") (literal (substring(attribute-string "effrg") 24 27))	
							(literal ", ") (literal (substring(attribute-string "effrg") 28 31)) (literal "-") (literal (substring(attribute-string "effrg") 31 34))	
							(literal ", ") (literal (substring(attribute-string "effrg") 35 38)) (literal "-") (literal (substring(attribute-string "effrg") 38 41)))	
						(if (= (string-length (attribute-string "effrg")) 48)
						(make sequence
							(literal ", ") (literal (substring(attribute-string "effrg") 7 10)) (literal "-") (literal (substring(attribute-string "effrg") 10 13))							
							(literal ", ") (literal (substring(attribute-string "effrg") 14 17)) (literal "-") (literal (substring(attribute-string "effrg") 17 20))						
							(literal ", ") (literal (substring(attribute-string "effrg") 21 24)) (literal "-") (literal (substring(attribute-string "effrg") 24 27))	
							(literal ", ") (literal (substring(attribute-string "effrg") 28 31)) (literal "-") (literal (substring(attribute-string "effrg") 31 34))	
							(literal ", ") (literal (substring(attribute-string "effrg") 35 38)) (literal "-") (literal (substring(attribute-string "effrg") 38 41))	
							(literal ", ") (literal (substring(attribute-string "effrg") 42 45)) (literal "-") (literal (substring(attribute-string "effrg") 45 48)))	
						(if (= (string-length (attribute-string "effrg")) 55)
						(make sequence
							(literal ", ") (literal (substring(attribute-string "effrg") 7 10)) (literal "-") (literal (substring(attribute-string "effrg") 10 13))							
							(literal ", ") (literal (substring(attribute-string "effrg") 14 17)) (literal "-") (literal (substring(attribute-string "effrg") 17 20))						
							(literal ", ") (literal (substring(attribute-string "effrg") 21 24)) (literal "-") (literal (substring(attribute-string "effrg") 24 27))	
							(literal ", ") (literal (substring(attribute-string "effrg") 28 31)) (literal "-") (literal (substring(attribute-string "effrg") 31 34))	
							(literal ", ") (literal (substring(attribute-string "effrg") 35 38)) (literal "-") (literal (substring(attribute-string "effrg") 38 41))	
							(literal ", ") (literal (substring(attribute-string "effrg") 42 45)) (literal "-") (literal (substring(attribute-string "effrg") 45 48))	
							(literal ", ") (literal (substring(attribute-string "effrg") 49 52)) (literal "-") (literal (substring(attribute-string "effrg") 52 55)))	
						
						(process-children)					
						)))))))
					)
				)
			)
			
		)
		
		(literal "(Ref. Fig. ")
		
	)
)

(element (refblock refint)
(empty-sosofo)
)


(element (entry para refblock)
	(make sequence
	font-weight: 'semi-bold
		(make sequence
		(literal " (Ref. TASK ")
		(process-children)
		(literal ") ")
		)
	)
)

(element (topic subtask list1 l1item para refblock)
	(make sequence
	start-indent: 40pt
	font-weight: 'semi-bold
		(make sequence
		(literal " (Ref. TASK ")
		(process-children)
		(literal ") ")
		)
	)
)

(element (topic subtask list1 l1item list2 l2item para refblock)
	(make sequence
	start-indent: 60pt
	font-weight: 'semi-bold
		(make sequence
		(literal " (Ref. TASK ")
		(process-children)
		(literal ") ")
		)
	)
)

(element (topic subtask list1 l1item list2 l2item list3 l3item para refblock)
	(make sequence
	start-indent: 80pt
	font-weight: 'semi-bold
		(make sequence
		(literal " (Ref. TASK ")
		(process-children)
		(literal ") ")
		)
	)
)
(element (note para refblock)
	(make sequence
	start-indent: 80pt
	font-weight: 'semi-bold
		(make sequence
		(literal " (Ref. TASK ")
		(process-children)
		(literal ") ")
		)
	)
)

(element (unlist unlitem para refblock)
	(make sequence 
	font-weight: 'semi-bold
	(literal " (Ref. ")
	(process-children)
	(literal ") ")
	)
)

(element (subtask list1 l1item para refext)
	(make sequence 
	font-weight: 'semi-bold
	(literal " (Ref. ")
	(process-children)
	(literal ") ")
	)
)

(element (subtask list1 l1item list2 l2item para refext)
	(make sequence 
	font-weight: 'semi-bold
	(literal " (Ref. ")
	(process-children)
	(literal ") ")
	)
)

(element (subtask list1 l1item list2 l2item list3 l3item para refext)
	(make sequence 
	font-weight: 'semi-bold
	(literal " (Ref. ")
	(process-children)
	(literal ") ")
	)
)

(element (note para refext)
	(make sequence 
	font-weight: 'semi-bold
	(literal " (Ref. ")
	(process-children)
	(literal ") ")
	)
)

(element (unlist unlitem para refext)
	(make sequence 
	font-weight: 'semi-bold
	(literal " (Ref. ")
	(process-children)
	(literal ") ")
	)
)

(element (subtask list1 l1item para refint)
	(make sequence 
	font-weight: 'semi-bold
	(literal " (Ref. ")
	(process-children)
	(literal ") ")
	)
)

(element (subtask list1 l1item list2 l2item para refint)
	(make sequence 
	font-weight: 'semi-bold
	(literal " (Ref. ")
	(process-children)
	(literal ") ")
	)
)

(element (subtask list1 l1item list2 l2item list3 l3item para refint)
	(make sequence 
	font-weight: 'semi-bold
	(literal " (Ref. ")
	(process-children)
	(literal ") ")
	)
)

(element (note para refint)
	(make sequence 
	font-weight: 'semi-bold
	(literal " (Ref. ")
	(process-children)
	(literal ") ")
	)
)

(element (unlist unlitem para refint)
	(make sequence 
	font-weight: 'semi-bold
	(literal " (Ref. ")
	(process-children)
	(literal ") ")
	)
)

(element (para cb)
	(if (= 1 (child-number))
	
	(make sequence
	font-weight: 'semi-bold
	(process-children)
	)
	
	(make sequence
	font-weight: 'semi-bold
	(literal ", ")
	(process-children)
	)
	)
)
	
(element txtgrphc
	(make paragraph
	space-before: 12pt
	space-after: 12pt)
)

(element (txtline)
	(make paragraph
	space-after: 4pt)
)

(element (txtgrphc txtline)
	(make paragraph
	space-after: 4pt)
)

(element toolnbr
;	(empty-sosofo)
	(make sequence font-weight: 'semi-bold
	(literal " (")
	(process-children)
	(literal ")")
	)
)

(element toolname
;	(empty-sosofo)
(make sequence font-weight: 'semi-bold)
)

(element stdnbr
;	(empty-sosofo)
	(make sequence font-weight: 'semi-bold
	(literal "(")
	(process-children)
	(literal ")")
	)
)

(element stdname
;	(empty-sosofo)
(make sequence font-weight: 'semi-bold)
)

(element ted
	(make sequence 
	(process-matching-children "toolname")
	(process-matching-children "toolnbr")
	)
)

(element std
	(make sequence 
	(process-matching-children "stdname")
	(process-matching-children "stdnbr")
	)
)

(element conname
	(make sequence font-weight: 'semi-bold
	)
)

(element connbr
	(make sequence font-weight: 'semi-bold
	(process-children)
	(literal " ")
	)
)

(element conname
(make sequence font-weight: 'semi-bold)
)



(element (taskcard effect)
	(empty-sosofo)
)

(element (task effect)
	(make paragraph
	space-before: 6pt
	space-after: 6pt
	start-indent: 20pt
	font-size: 8pt
	font-weight: 'bold
	;font-posture: 'italic
		(make sequence
				(literal "** ON A/C ")
				(if (equal? (attribute-string "effrg") "001999")
					(literal "ALL")
					
					(make sequence
					(literal (substring(attribute-string "effrg") 0 3)) (literal "-") (literal (substring(attribute-string "effrg") 3 6))
						
						(if (= (string-length (attribute-string "effrg")) 13)
						(make sequence	
							(literal ", ") (literal (substring(attribute-string "effrg") 7 10)) (literal "-") (literal (substring(attribute-string "effrg") 10 13)))
						(if (= (string-length (attribute-string "effrg")) 20)
						(make sequence
							(literal ", ") (literal (substring(attribute-string "effrg") 7 10)) (literal "-") (literal (substring(attribute-string "effrg") 10 13))							
							(literal ", ") (literal (substring(attribute-string "effrg") 14 17)) (literal "-") (literal (substring(attribute-string "effrg") 17 20)))	
						(if (= (string-length (attribute-string "effrg")) 27)
						(make sequence
							(literal ", ") (literal (substring(attribute-string "effrg") 7 10)) (literal "-") (literal (substring(attribute-string "effrg") 10 13))							
							(literal ", ") (literal (substring(attribute-string "effrg") 14 17)) (literal "-") (literal (substring(attribute-string "effrg") 17 20))						
							(literal ", ") (literal (substring(attribute-string "effrg") 21 24)) (literal "-") (literal (substring(attribute-string "effrg") 24 27)))	
;start
						(if (= (string-length (attribute-string "effrg")) 34)
						(make sequence
							(literal ", ") (literal (substring(attribute-string "effrg") 7 10)) (literal "-") (literal (substring(attribute-string "effrg") 10 13))							
							(literal ", ") (literal (substring(attribute-string "effrg") 14 17)) (literal "-") (literal (substring(attribute-string "effrg") 17 20))						
							(literal ", ") (literal (substring(attribute-string "effrg") 21 24)) (literal "-") (literal (substring(attribute-string "effrg") 24 27))	
							(literal ", ") (literal (substring(attribute-string "effrg") 28 31)) (literal "-") (literal (substring(attribute-string "effrg") 31 34)))	
						(if (= (string-length (attribute-string "effrg")) 41)
						(make sequence
							(literal ", ") (literal (substring(attribute-string "effrg") 7 10)) (literal "-") (literal (substring(attribute-string "effrg") 10 13))							
							(literal ", ") (literal (substring(attribute-string "effrg") 14 17)) (literal "-") (literal (substring(attribute-string "effrg") 17 20))						
							(literal ", ") (literal (substring(attribute-string "effrg") 21 24)) (literal "-") (literal (substring(attribute-string "effrg") 24 27))	
							(literal ", ") (literal (substring(attribute-string "effrg") 28 31)) (literal "-") (literal (substring(attribute-string "effrg") 31 34))	
							(literal ", ") (literal (substring(attribute-string "effrg") 35 38)) (literal "-") (literal (substring(attribute-string "effrg") 38 41)))	
						(if (= (string-length (attribute-string "effrg")) 48)
						(make sequence
							(literal ", ") (literal (substring(attribute-string "effrg") 7 10)) (literal "-") (literal (substring(attribute-string "effrg") 10 13))							
							(literal ", ") (literal (substring(attribute-string "effrg") 14 17)) (literal "-") (literal (substring(attribute-string "effrg") 17 20))						
							(literal ", ") (literal (substring(attribute-string "effrg") 21 24)) (literal "-") (literal (substring(attribute-string "effrg") 24 27))	
							(literal ", ") (literal (substring(attribute-string "effrg") 28 31)) (literal "-") (literal (substring(attribute-string "effrg") 31 34))	
							(literal ", ") (literal (substring(attribute-string "effrg") 35 38)) (literal "-") (literal (substring(attribute-string "effrg") 38 41))	
							(literal ", ") (literal (substring(attribute-string "effrg") 42 45)) (literal "-") (literal (substring(attribute-string "effrg") 45 48)))	
						(if (= (string-length (attribute-string "effrg")) 55)
						(make sequence
							(literal ", ") (literal (substring(attribute-string "effrg") 7 10)) (literal "-") (literal (substring(attribute-string "effrg") 10 13))							
							(literal ", ") (literal (substring(attribute-string "effrg") 14 17)) (literal "-") (literal (substring(attribute-string "effrg") 17 20))						
							(literal ", ") (literal (substring(attribute-string "effrg") 21 24)) (literal "-") (literal (substring(attribute-string "effrg") 24 27))	
							(literal ", ") (literal (substring(attribute-string "effrg") 28 31)) (literal "-") (literal (substring(attribute-string "effrg") 31 34))	
							(literal ", ") (literal (substring(attribute-string "effrg") 35 38)) (literal "-") (literal (substring(attribute-string "effrg") 38 41))	
							(literal ", ") (literal (substring(attribute-string "effrg") 42 45)) (literal "-") (literal (substring(attribute-string "effrg") 45 48))	
							(literal ", ") (literal (substring(attribute-string "effrg") 49 52)) (literal "-") (literal (substring(attribute-string "effrg") 52 55)))	
						
						(process-children)					
						)))))))
					)
				)
		)
	)
)

(element (subtask effect)
	(make paragraph
	space-before: 6pt
	space-after: 6pt
	start-indent: 20pt
	font-size: 8pt
	font-weight: 'bold
	;font-posture: 'italic
		(make sequence
				(literal "** ON A/C ")
				(if (equal? (attribute-string "effrg") "001999")
					(literal "ALL")
					
					(make sequence
					(literal (substring(attribute-string "effrg") 0 3)) (literal "-") (literal (substring(attribute-string "effrg") 3 6))
						
						(if (= (string-length (attribute-string "effrg")) 13)
						(make sequence	
							(literal ", ") (literal (substring(attribute-string "effrg") 7 10)) (literal "-") (literal (substring(attribute-string "effrg") 10 13)))
						(if (= (string-length (attribute-string "effrg")) 20)
						(make sequence
							(literal ", ") (literal (substring(attribute-string "effrg") 7 10)) (literal "-") (literal (substring(attribute-string "effrg") 10 13))							
							(literal ", ") (literal (substring(attribute-string "effrg") 14 17)) (literal "-") (literal (substring(attribute-string "effrg") 17 20)))	
						(if (= (string-length (attribute-string "effrg")) 27)
						(make sequence
							(literal ", ") (literal (substring(attribute-string "effrg") 7 10)) (literal "-") (literal (substring(attribute-string "effrg") 10 13))							
							(literal ", ") (literal (substring(attribute-string "effrg") 14 17)) (literal "-") (literal (substring(attribute-string "effrg") 17 20))						
							(literal ", ") (literal (substring(attribute-string "effrg") 21 24)) (literal "-") (literal (substring(attribute-string "effrg") 24 27)))	
;start
						(if (= (string-length (attribute-string "effrg")) 34)
						(make sequence
							(literal ", ") (literal (substring(attribute-string "effrg") 7 10)) (literal "-") (literal (substring(attribute-string "effrg") 10 13))							
							(literal ", ") (literal (substring(attribute-string "effrg") 14 17)) (literal "-") (literal (substring(attribute-string "effrg") 17 20))						
							(literal ", ") (literal (substring(attribute-string "effrg") 21 24)) (literal "-") (literal (substring(attribute-string "effrg") 24 27))	
							(literal ", ") (literal (substring(attribute-string "effrg") 28 31)) (literal "-") (literal (substring(attribute-string "effrg") 31 34)))	
						(if (= (string-length (attribute-string "effrg")) 41)
						(make sequence
							(literal ", ") (literal (substring(attribute-string "effrg") 7 10)) (literal "-") (literal (substring(attribute-string "effrg") 10 13))							
							(literal ", ") (literal (substring(attribute-string "effrg") 14 17)) (literal "-") (literal (substring(attribute-string "effrg") 17 20))						
							(literal ", ") (literal (substring(attribute-string "effrg") 21 24)) (literal "-") (literal (substring(attribute-string "effrg") 24 27))	
							(literal ", ") (literal (substring(attribute-string "effrg") 28 31)) (literal "-") (literal (substring(attribute-string "effrg") 31 34))	
							(literal ", ") (literal (substring(attribute-string "effrg") 35 38)) (literal "-") (literal (substring(attribute-string "effrg") 38 41)))	
						(if (= (string-length (attribute-string "effrg")) 48)
						(make sequence
							(literal ", ") (literal (substring(attribute-string "effrg") 7 10)) (literal "-") (literal (substring(attribute-string "effrg") 10 13))							
							(literal ", ") (literal (substring(attribute-string "effrg") 14 17)) (literal "-") (literal (substring(attribute-string "effrg") 17 20))						
							(literal ", ") (literal (substring(attribute-string "effrg") 21 24)) (literal "-") (literal (substring(attribute-string "effrg") 24 27))	
							(literal ", ") (literal (substring(attribute-string "effrg") 28 31)) (literal "-") (literal (substring(attribute-string "effrg") 31 34))	
							(literal ", ") (literal (substring(attribute-string "effrg") 35 38)) (literal "-") (literal (substring(attribute-string "effrg") 38 41))	
							(literal ", ") (literal (substring(attribute-string "effrg") 42 45)) (literal "-") (literal (substring(attribute-string "effrg") 45 48)))	
						(if (= (string-length (attribute-string "effrg")) 55)
						(make sequence
							(literal ", ") (literal (substring(attribute-string "effrg") 7 10)) (literal "-") (literal (substring(attribute-string "effrg") 10 13))							
							(literal ", ") (literal (substring(attribute-string "effrg") 14 17)) (literal "-") (literal (substring(attribute-string "effrg") 17 20))						
							(literal ", ") (literal (substring(attribute-string "effrg") 21 24)) (literal "-") (literal (substring(attribute-string "effrg") 24 27))	
							(literal ", ") (literal (substring(attribute-string "effrg") 28 31)) (literal "-") (literal (substring(attribute-string "effrg") 31 34))	
							(literal ", ") (literal (substring(attribute-string "effrg") 35 38)) (literal "-") (literal (substring(attribute-string "effrg") 38 41))	
							(literal ", ") (literal (substring(attribute-string "effrg") 42 45)) (literal "-") (literal (substring(attribute-string "effrg") 45 48))	
							(literal ", ") (literal (substring(attribute-string "effrg") 49 52)) (literal "-") (literal (substring(attribute-string "effrg") 52 55)))	
						
						(process-children)					
						)))))))
					)
				)
		)
	)
)

;(element graphic
;	(make external-graphic
;		entity-system-id: "image.bmp"
;		display?: #t
;	)
;)


(element graphic
	(if (= 1 (child-number))

	(make sequence
		font-family-name: "Courier"
		font-size: 11pt
				
		(make paragraph 
		space-before: 0pt
		break-before: 'page
		font-weight: 'bold
		space-after: 12pt
		(literal "GRAPHIC ATTACHMENT/S: ")
		)
		
		(make paragraph 
		start-indent: 24pt
		space-after: 3pt
		(literal "Task:             ")
		(literal (attribute-string "CHAPNBR"))
		(literal "-")
		(literal (attribute-string "SECTNBR"))
		(literal "-")
		(literal (attribute-string "SUBJNBR"))
		(literal "-")
		(literal (attribute-string "FUNC"))
		(literal "-")
		(literal (attribute-string "SEQ"))
		)
		(process-children)
	)
	
	(make sequence
		font-family-name: "Courier"
		font-size: 11pt
			
		(make paragraph 
		start-indent: 24pt
		space-after: 3pt
		(literal "Task:             ")
		(literal (attribute-string "CHAPNBR"))
		(literal "-")
		(literal (attribute-string "SECTNBR"))
		(literal "-")
		(literal (attribute-string "SUBJNBR"))
		(literal "-")
		(literal (attribute-string "FUNC"))
		(literal "-")
		(literal (attribute-string "SEQ"))
		)
		(process-children)
	)
	)
	
	
	
)

(element pdfattach
	(make paragraph
	font-family-name: "Courier"
	font-size: 11pt
	space-before: 0pt
	font-weight: 'bold
	space-after: 6pt
	(literal "ADDITIONAL ATTACHMENT: ")
	(process-children)
	)
)

(element (graphic title)
	(empty-sosofo)
)

(element (graphic effect)
	(empty-sosofo)
)

(element sheet
	(make sequence start-indent: 24pt
		(make paragraph
		(make sequence
		(literal "Graphic:          ")
		(literal (attribute-string "GNBR"))
		(literal ".pdf")
		))
		
		(make paragraph space-before: 6pt
		(make sequence
		(literal "Sheet Number:     ")
		(literal (attribute-string "SHEETNBR"))
		))
		
		(process-children)
		
))

(element (sheet title)
	(make paragraph
		font-weight: 'bold
		start-indent: 24pt
		space-after: 12pt
	)
)

(element (topic subtask list1 l1item para csn)
	(empty-sosofo)
)

(element (topic subtask list1 l1item list2 l2item para csn)
	(empty-sosofo)
)

(element (topic subtask list1 l1item list2 l2item list3 l3item para csn)
	(empty-sosofo)
)

(element (topic subtask list1 l1item list2 l2item list3 l3item list4 l4item para csn)
	(empty-sosofo)
)

(element (topic subtask list1 l1item unlist unlitem para csn)
	(empty-sosofo)
)

(element (topic subtask list1 l1item list2 l2item unlist unlitem para csn)
	(empty-sosofo)
)

(element (topic subtask list1 l1item list2 l2item list3 l3item unlist unlitem para csn)
	(empty-sosofo)
)

(element (topic subtask list1 l1item list2 l2item list3 l3item list4 l4item unlist unlitem para csn)
	(empty-sosofo)
)




(element (pretopic list1 l1item para csn)
	(process-children)
)

(element (pretopic list1 l1item list2 l2item para csn)
	(process-children)
)

(element (pretopic list1 l1item list2 l2item list3 l3item para csn)
	(process-children)
)

(element (pretopic list1 l1item list2 l2item list3 l3item list4 l4item para csn)
	(process-children)
)

(element (pretopic para csn)
	(process-children)
)	

(element cblst
	(make sequence
	(make table
		start-indent: 0pt
		space-before: 12pt
		space-after: 0pt
		display-alignment: 'center
		table-border: (make table-border line-thickness: 2pt)
	
	(make table-column
	column-number: 1
	width: 50pt
	)
	
	(make table-cell
	column-number: 1
	cell-before-row-border: #t
	cell-before-column-border: #t
	cell-after-row-border: #t
	cell-after-column-border: #t
	(make paragraph
	start-indent: 4pt
	quadding: 'center
	font-weight: 'bold
	space-before: 3pt
	space-after: 3pt
	(literal "PANEL")
	))
	
	(make table-column
	column-number: 2
	width: 275pt
	)
	
	(make table-cell
	column-number: 2
	cell-before-row-border: #t
	cell-before-column-border: #t
	cell-after-row-border: #t
	cell-after-column-border: #t
	(make paragraph
	start-indent: 4pt
	quadding: 'center
	font-weight: 'bold
	space-before: 3pt
	space-after: 3pt
	(literal "DESIGNATION")
	))
	
	(make table-column
	column-number: 3
	width: 60pt
	)
	
	(make table-cell
	column-number: 3
	cell-before-row-border: #t
	cell-before-column-border: #t
	cell-after-row-border: #t
	cell-after-column-border: #t
	(make paragraph
	start-indent: 4pt
	quadding: 'center
	font-weight: 'bold
	space-before: 3pt
	space-after: 3pt
	(literal "FIN")
	))
	
	(make table-column
	column-number: 4
	width: 70pt
	)
	
	(make table-cell
	column-number: 4
	cell-before-row-border: #t
	cell-before-column-border: #t
	cell-after-row-border: #t
	cell-after-column-border: #t
	(make paragraph
	start-indent: 4pt
	quadding: 'center
	font-weight: 'bold
	space-before: 3pt
	space-after: 3pt
	(literal "LOCATION")
	))		

	)
	
	(process-children)	
	)
)

(element cbsublst
	(make table
	start-indent: 0pt
	space-before: 0pt
	space-after: 0pt
	display-alignment: 'center
	table-border: (make table-border line-thickness: 2pt)
	
	(make table-column
	column-number: 1
	width: 50pt
	)
	(make table-column
	column-number: 2
	width: 275pt
	)
	(make table-column
	column-number: 3
	width: 60pt
	)
	(make table-column
	column-number: 4
	width: 70pt
	)
	
	(process-children)
	)
)

(element (cbsublst ein)

(if (< 1 (child-number))
	(make table-row
	(make table-cell
	column-number: 1
	n-columns-spanned: 4
	cell-before-row-border: #t
	cell-before-column-border: #t
	cell-after-row-border: #t
	cell-after-column-border: #t
	(make sequence
	(literal " ")
	(process-children)
	)
	)
	)
	
	(make sequence
	(literal "FOR FIN ")
	(process-children)
	)
)	
)

(element (cbsublst equname)
	(make sequence
	(literal " (")
	(process-children)
	(literal ")")
	)
)


(element cbdata
	(make table-row
		(process-children)
	)
)


(element pan
	(make sequence
;	(make table-column
;	column-number: 1
;	width: 50pt
;	)
	
	(make table-cell
	column-number: 1
	cell-before-row-border: #t
	cell-before-column-border: #t
	cell-after-row-border: #t
	cell-after-column-border: #t
	(make paragraph
	start-indent: 4pt
	quadding: 'start
	space-before: 3pt
	space-after: 3pt
	(process-children)
	))
	
	)
)

(element cbname
	(make sequence
;	(make table-column
;	column-number: 2
;	width: 300pt
;	)
	
	(make table-cell
	column-number: 2
	cell-before-row-border: #t
	cell-before-column-border: #t
	cell-after-row-border: #t
	cell-after-column-border: #t
	(make paragraph
	start-indent: 4pt
	quadding: 'start
	space-before: 3pt
	space-after: 3pt
	(process-children)
	))
	)
)

(element cb
	(make sequence
;	(make table-column
;	column-number: 3
;	width: 60pt
;	)
	
	(make table-cell
	column-number: 3
	cell-before-row-border: #t
	cell-before-column-border: #t
	cell-after-row-border: #t
	cell-after-column-border: #t
	(make paragraph
	start-indent: 4pt
	quadding: 'start
	space-before: 3pt
	space-after: 3pt
	(process-children)
	))
	)
)

(element cbloc
	(make sequence
;	(make table-column
;	column-number: 4
;	width: 50pt
;	)
	
	(make table-cell
	column-number: 4
	cell-before-row-border: #t
	cell-before-column-border: #t
	cell-after-row-border: #t
	cell-after-column-border: #t
	(make paragraph
	start-indent: 4pt
	quadding: 'start
	space-before: 3pt
	space-after: 3pt
	(process-children)
	))
	)
)

(element (para pan)
	(make sequence 
	font-weight: 'semi-bold
	(process-children)
	(literal " ")
	)
)

(element torvalue
	(make sequence
		(if (= 1 (child-number))
	
			(make sequence
			font-weight: 'bold
			(literal "to between ")
			(literal (attribute-string "MIN"))
			(literal " and ")
			(literal (attribute-string "MAX"))
			(literal " ")
			(literal (attribute-string "UNIT"))
			)
			
			(make sequence
			font-weight: 'bold
			(literal " (")
			(literal (attribute-string "MIN"))
			(literal " and ")
			(literal (attribute-string "MAX"))
			(literal " ")
			(literal (attribute-string "UNIT"))
			(literal ")")
			)
		)
	)
)

(element (einlst eindata)
	(if (= 1 (child-number))
	(make sequence
	(literal "FIN: ")
	(process-children)
	(literal ", ")
	)
	
	(make sequence
	(process-children)
	)
	
	)	
)

<!--
</style-specification-body>
</style-specification>
<external-specification id="html-stylesheet"  document="html-ss">
-->


</style-sheet>
