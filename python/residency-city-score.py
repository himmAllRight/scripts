


inputFile = "../../../anesthesiology-city-list.txt"

def getCityList(inputSRC):
    """Converts file contents to list"""
    with open(inputSRC) as f:
        lines = f.read().splitlines()
    return(lines)

def placeCity(city, score, cityScores):
    """Places a city in the correct place of the table."""
    if city in cityScores:
        cityScores[city] = cityScores[city] + score
    else:
        cityScores[city] = score
    return(cityScores)
    
def parseCities(cityList):
    """Loop through cities"""
    number     = len(cityList)
    cityScores = {}

    ## loop through cities and calculate score
    for city in cityList:
        cityScores = placeCity(city, number, cityScores)
        number -= 1

    return(cityScores)

def cityScore(src):
    scoreList = parseCities(getCityList(src))
    return(scoreList)

scores = cityScore(inputFile)
sortedCities = sorted(scores, key= scores.get, reverse= True)

for city in sortedCities:
    print("{}: {}".format(city, scores[city]))
