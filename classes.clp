; Mon Feb 02 22:48:09 EET 2015
; 
;+ (version "3.5")
;+ (build "Build 663")


(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
	(is-a USER)
	(role abstract)
	(single-slot Favourite_Language
		(type INSTANCE)
;+		(allowed-classes Languages)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot Similar_Purpose_Languages
		(type INSTANCE)
;+		(allowed-classes Languages)
		(create-accessor read-write))
	(single-slot Fullname
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Age
		(type INTEGER)
		(range 5 125)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Language_Name
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Experience_in_Years
		(type INTEGER)
		(range 0 125)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Difficulty
		(type INTEGER)
		(range 1 10)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Typing
		(type SYMBOL)
		(allowed-values dynamic static)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Garbage_Collection
		(type SYMBOL)
		(allowed-values yes no)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Preffers_Garbage_Collection
		(type SYMBOL)
		(allowed-values yes no)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Preffers_Dynamic_or_Static_Typing
		(type SYMBOL)
		(allowed-values dynamic static)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Languages
	(is-a USER)
	(role abstract)
	(single-slot Typing
		(type SYMBOL)
		(allowed-values dynamic static)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Garbage_Collection
		(type SYMBOL)
		(allowed-values yes no)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Difficulty
		(type INTEGER)
		(range 1 10)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot Similar_Purpose_Languages
		(type INSTANCE)
;+		(allowed-classes Languages)
		(create-accessor read-write))
	(single-slot Language_Name
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Compiled+or+Virtual+Machine
	(is-a Languages)
	(role abstract))

(defclass Web
	(is-a Compiled+or+Virtual+Machine)
	(role concrete)
    (pattern-match reactive)
	(multislot Similar_Purpose_Languages
		(type INSTANCE)
;+		(allowed-classes Web)
		(create-accessor read-write)))

(defclass Mobile
	(is-a Compiled+or+Virtual+Machine)
	(role concrete)
    (pattern-match reactive)
	(multislot Similar_Purpose_Languages
		(type INSTANCE)
;+		(allowed-classes Mobile)
		(create-accessor read-write)))

(defclass System
	(is-a Compiled+or+Virtual+Machine)
	(role concrete)
    (pattern-match reactive)
	(multislot Similar_Purpose_Languages
		(type INSTANCE)
;+		(allowed-classes System)
		(create-accessor read-write)))

(defclass Interpreted
	(is-a Languages)
	(role abstract))

(defclass Interpreted_Web
	(is-a Interpreted)
	(role concrete)
    (pattern-match reactive)
	(multislot Similar_Purpose_Languages
		(type INSTANCE)
;+		(allowed-classes Interpreted_Web)
		(create-accessor read-write)))

(defclass Interpreted_System
	(is-a Interpreted)
	(role concrete)
    (pattern-match reactive)
	(multislot Similar_Purpose_Languages
		(type INSTANCE)
;+		(allowed-classes Interpreted_System)
		(create-accessor read-write)))

(defclass Person
	(is-a USER)
	(role concrete)
    (pattern-match reactive)
	(single-slot Favourite_Language
		(type INSTANCE)
;+		(allowed-classes Languages)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Experience_in_Years
		(type INTEGER)
		(range 0 125)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Preffers_Dynamic_or_Static_Typing
		(type SYMBOL)
		(allowed-values dynamic static)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Preffers_Garbage_Collection
		(type SYMBOL)
		(allowed-values yes no)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Age
		(type INTEGER)
		(range 5 125)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Fullname
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write)))