# socialJustice

TODO:
- alle selects auf Stored Procedures
- Trigger von Andre anwenden (auch errorhandling) done
- Transaktionen wo?
- Code Conventions done
- LOG wenn sich User ein und auslogged done
- Comments-table: FK auf Users done


- bei addnewprofiles.php:
	* formular existiert schon nur datenbank speicher noch nicht done
	* wenn user nicht alle felder ausfüllt -> errormeldung - please fill in all fields (errorhandling?) done
	* checken ob twitterhandle schon in db done
	* checken ob twitterhandle exists auf twitterhttps://api.twitter.com/1.1/users/lookup.json?screen_name=xxx done
- in profiles.php über posts: add new post button -> onlick im content addnewpost.php file anzeigen 
- addnewpost.php file:
	* formular wie bei addnewprofile.php (zwei felder -> twitterhandle, tweet link; dann noch alle tags die es auf db gibt auflisten (mit checkboxes) und tags anchecken, die man will)
	* checken ob twitterhandle schon in db (-> wenn nicht dann error - hateprofil existiert noch nicht)
	* checken ob post schon in db (-> wenn nicht dann error - post gibts schon)
	* checken ob post exists auf twitter (-> wenn nicht dann error - post gibts nicht auf twitter) done
	* checken ob post mit angegebenem twitterhandle zusammenpasst (-> wenn nicht dann error - post passt nicht zu twitterhandle) done
	* if successful hatelvlcounter für twitterhandle von post erhöhen
- unter einem post (in beiden files - profiles.php und posts.php):	
	* 
alle comments von post auflisten (mit username davor) done

	* form mit comment submit (nur wenn logged in) done
	* 
report button -> erhöht report counter am post (wenn counter auf 10 dann post löschen, nur wenn logged in)
	* alle tags von post anzeigen
	
	OPTIONAL : user blockieren wenns einmal reported