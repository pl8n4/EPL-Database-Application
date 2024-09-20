class fixtureDTO:
    def __init__(self, fixtureID, homeTeam, awayTeam, date, played, result):
        self.fixtureID = fixtureID
        self.homeTeam = homeTeam #Match home/away team with those on match table
        self.awayTeam = awayTeam
        self.date = date
        self.played = played #Derived from checking wether or not the match has been played which can be done by checking if result is NULL in db
        self.result = result #Can be null if game has not been played

