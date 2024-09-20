class teamDTO:
    def __init__(self, teamID, teamName, stadiumName, matchesPlayed, wins, draws, losses, points, scoredGoals, concededGoals):
        self.teamID = teamID
        self.teamName = teamName
        self.stadiumName = stadiumName
        self.matchesPlayed = matchesPlayed #Derived from matches table by interpreting how many matches a team appears in
        self.wins = wins #Derived from matches table by interpreting match result
        self.draws = draws #Derived from matches table by interpreting match result
        self.losses = losses #Derived from matches table by interpreting match result
        self.points = points #Derived from matches table by interpreting wins, draws, and losses
        self.scoredGoals = scoredGoals #Derived from matches table by interpreting result scoreline
        self.concededGoals = concededGoals #Derived from matches table by interpreting result scoreline
