(defrule Recommend_Other_Language (declare (salience 100))
	(object (is-a Person) (Fullname ?Fullname) (Preffers_Dynamic_or_Static_Typing ?typing1) (Preffers_Garbage_Collection ?gc1))
	(object (is-a Languages) (Language_Name ?lname) (Typing ?typing2)  (Garbage_Collection ?gc2))
	(test (eq ?gc1 ?gc2))
	(test (eq ?typing1 ?typing2))
=>	
	(printout t "For " ?Fullname " recommendations based on preferences are: " ?lname crlf)
)
(defrule Print (declare (salience 95))
=>
	(printout t "Easy language recommendations are :" crlf)
)

(defrule Recommend_Easy_Language (declare (salience 90))
	(object (is-a Languages) (Language_Name ?lname) (Difficulty ?difficulty))
	(test (< ?difficulty 5))
=>	
	(printout t ?lname crlf)
)
(defrule Print1 (declare (salience 85))
=>
	(printout t "Hard language recommendations are :" crlf)
)
(defrule Recommend_Hard_Language (declare (salience 80))
	(object (is-a Languages) (Language_Name ?lname) (Difficulty ?difficulty))
	(test (> ?difficulty 6))
=>	
	(printout t ?lname crlf)
)