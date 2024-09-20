class playerDTO:
    def __init__(self, playerID, playerName, teamName, teamID, goals, assists, position, DOB, nationality):
        self.playerID = playerID
        self.playerName = playerName
        self.teamName = teamName #Derived from contracts table by matching teamID to playerID
        self.teamID = teamID #Derived from contracts table by matching teamID to playerID
        self.goals = goals #Dervied from scorer table by matching playerID's from player table to match table
        self.assists = assists #Dervied from scorer table by matching playerID's from player table to match table
        self.position = position
        self.DOB = DOB
        self.nationality = nationality
