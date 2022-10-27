# COMP3311 20T3 Ass3 ... Python helper functions
# add here any functions to share between Python scripts 

# prints list of movies given list
def printMovieList(partialName, movies, year):
	if year == None:
		print(f"Movies matching '{partialName}'")
	else:
		print(f"Movies matching '{partialName}' {year}")
	print("===============")
	for tup in movies:
		print(f"{tup[0]} ({tup[1]})")

# prints list of people given list
def printPeopleList(people):
	for tup in people:
		name, birth_year, death_year = tup
		if birth_year == None:
			print(f"{name} (???)")
		elif birth_year != None and death_year == None:
			print(f"{name} ({birth_year}-)")
		else:
			print(f"{name} ({birth_year}-{death_year})")

# prints alias information for relevant movies
def aliasInfo(tup):
	order, title, region, language, extra_info = tup
	alias = f"'{title}' ("
	if region != None:
		alias = alias + f"region: {region.strip()}"
		if language != None:
			alias = alias + f", language: {language.strip()})"
		else:
			alias = alias + ")"
	elif language != None:
		alias = alias + f"language: {language.strip()})"
	elif extra_info != None:
		alias = alias + extra_info.strip() + ")"
	else:
		alias = f"'{title}'"
	
	print(alias)
	return
	
# prints bio given info
def printBio(bio):
	movie1, year, role, rType, order = bio.pop(0)
	
	#print first movie and role
	print(f"{movie1} ({year})")
	if (rType == 'a'):
		print(f" playing {role}")
	else:
		role = role.capitalize()
		role = role.replace("_", " ")
		print(f" as {role}")
	
	for tup in bio:
		movie2, year, role, rType, order = tup
		if (movie1 == movie2):
			if (rType == 'a'):
				print(f" playing {role}")
			else:
				role = role.capitalize()
				role = role.replace("_", " ")
				print(f" as {role}")
		else:
			movie1 = movie2
			print(f"{movie1} ({year})")
			if (rType == 'a'):
				print(f" playing {role}")
			else:
				role = role.capitalize()
				role = role.replace("_", " ")
				print(f" as {role}")
		
def isInt(string):
    try: 
        int(string)
        return True
    except ValueError:
        return False
