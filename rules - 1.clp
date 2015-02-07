;;; Defines a global variable
(defglobal
	?*recommended* = ""
)

;;; Prints a message
(deffunction logmsg (?msg $?args)
		(printout t ?msg ?args crlf))

;;; Asks a question and reads the answer
(deffunction ask-question (?question)
	(printout t ?question crlf)
	(read)
)

;;; Asks a multiple-choice-question; uses the upper two functions
(deffunction ask-multiple-choice-question (?question $?allowed-values)
   (logmsg "Allowed values are: " $?allowed-values)
   (bind ?answer (ask-question ?question))	
   (while (eq (member$ ?answer ?allowed-values) FALSE) do
      (bind ?answer (ask-question ?question))
      (logmsg "Bad answer: " ?answer  " Allowed values are: " ?allowed-values)
	  )
   ?answer)

;;; Bind global variable with a class to be recommended

(defrule CompiledMobile (declare (salience 70))
	(compiled yes)
	(platform mobile)
	(easy no)
=>
	(printout t "You should try some of the following compiled mobile languages:" crlf)
	(bind ?*recommended* Mobile)
)

(defrule CompiledSystem (declare (salience 70))
	(compiled yes)
	(platform system)
	(easy no)
=>
	(printout t "You should try some of the following compiled system languages:" crlf)
	(bind ?*recommended* System)
)

(defrule CompiledWeb (declare (salience 70))
	(compiled yes)
	(platform web)
	(easy no)
=>
	(printout t "You should try some of the following compiled web languages:" crlf)
	(bind ?*recommended* Web)
)

(defrule InterpretedSystem (declare (salience 70))
	(compiled no)
	(platform system)
	(easy no)
	
=>
	(printout t "You should try some of the following interpreted system languages:" crlf)
	(bind ?*recommended* Interpreted_System)
)

(defrule InterpretedWeb (declare (salience 70))
	(compiled no)
	(platform web)
	(easy no)
=>
	(printout t "You should try some of the following interpreted web languages:" crlf)
	(bind ?*recommended* Interpreted_Web)
)

;;; Print easy languages

(defrule CompiledMobileEasy (declare (salience 70))
	(compiled yes)
	(platform mobile)
	(easy yes)
=>
	(printout t "This is the easiest compiled mobile language:" crlf)
	(printout t "Android Java" crlf)
)

(defrule CompiledSystemEasy (declare (salience 70))
	(compiled yes)
	(platform system)
	(easy yes)
=>
	(printout t "This is the easiest compiled system language:" crlf)
	(printout t "C#" crlf)
)

(defrule CompiledWebEasy (declare (salience 70))
	(compiled yes)
	(platform web)
	(easy yes)
=>
	(printout t "This is the easiest compiled web language:" crlf)
	(printout t "ASP .NET" crlf)
)

(defrule InterpretedSystemEasy (declare (salience 70))
	(compiled no)
	(platform system)
	(easy yes)
	
=>
	(printout t "This is the easiest interpreted system language:" crlf)
	(printout t "Pascal" crlf)
)

(defrule InterpretedWebEasy (declare (salience 70))
	(compiled no)
	(platform web)
	(easy yes)
=>
	(printout t "This is the easiest interpreted web language:" crlf)
	(printout t "HTML" crlf)
)

;;; No language found
(defrule No_Language_Found (declare (salience 70))
	(compiled no)
	(platform mobile)
=>
	(printout t "Sorry, can't find language with these criteria" crlf)
)
 
;;; Print the name of the recommended language
(defrule Get_Language (declare (salience 65))
	(object (is-a ?instance) (Language_Name ?name))
=>
	(if (eq ?instance ?*recommended*)
		then (printout t crlf ?name crlf))
)

;;; Ask questions, which will help determine recommended languages
(defrule Input (declare (salience 100))
=>
	(bind ?compiled_question (ask-multiple-choice-question "Do you prefer compiled language?" yes no ))
	(assert (compiled ?compiled_question))
	(bind ?platform_question (ask-multiple-choice-question "What platform?" web mobile system ))
	(assert (platform ?platform_question))
	(bind ?easy_question (ask-multiple-choice-question "Do you prefer less difficult language?" yes no ))
	(assert (easy ?easy_question))
)