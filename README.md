# socialJustice

TODO:
- alle selects auf Stored Procedures
- Trigger von Andre anwenden (auch errorhandling)
- Transaktionen wo?
- Code Conventions
- LOG wenn sich User ein und auslogged
- Comments-table: FK auf Users


- bei addnewprofiles.php:
	* formular existiert schon nur datenbank speicher noch nicht
	* wenn user nicht alle felder ausfüllt -> errormeldung - please fill in all fields (errorhandling?)
	* checken ob twitterhandle schon in db
	* checken ob twitterhandle exists auf twitterhttps://api.twitter.com/1.1/users/lookup.json?screen_name=xxx
- in profiles.php über posts: add new post button -> onlick im content addnewpost.php file anzeigen 
- addnewpost.php file:
	* formular wie bei addnewprofile.php (zwei felder -> twitterhandle, tweet link; dann noch alle tags die es auf db gibt auflisten (mit checkboxes) und tags anchecken, die man will)
	* checken ob twitterhandle schon in db (-> wenn nicht dann error - hateprofil existiert noch nicht)
	* checken ob post schon in db (-> wenn nicht dann error - post gibts schon)
	* checken ob post exists auf twitter (-> wenn nicht dann error - post gibts nicht auf twitter)
	* checken ob post mit angegebenem twitterhandle zusammenpasst (-> wenn nicht dann error - post passt nicht zu twitterhandle)
	* if successful hatelvlcounter für twitterhandle von post erhöhen
- unter einem post (in beiden files - profiles.php und posts.php):	
	* 
alle comments von post auflisten (mit username davor)

	* form mit comment submit (nur wenn logged in)
	* 
report button -> erhöht report counter am post (wenn counter auf 10 dann post löschen, nur wenn logged in)
	* alle tags von post anzeigen