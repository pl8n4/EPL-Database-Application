from extensions import db

#Defines the Match model
class Match(db.Model):
    __tablename__ = 'MATCH'
    MatchID = db.Column(db.Integer, primary_key=True, autoincrement=True)
    Date = db.Column(db.Date)
    HomeTeamID = db.Column(db.Integer, db.ForeignKey('TEAM.TeamID'), nullable=False)
    AwayTeamID = db.Column(db.Integer, db.ForeignKey('TEAM.TeamID'), nullable=False)
    Result = db.Column(db.String(5))
    
    # Relationships
    #assisters = db.relationship('Assister', backref='match', lazy=True)
    #scorers = db.relationship('Scorer', backref='match', lazy=True)
    

    def to_dict(self):
        return {
            'MatchID': self.MatchID,
            'Date': self.Date,
            'HomeTeamID': self.HomeTeamID,
            'AwayTeamID': self.AwayTeamID,
            'Result': self.Result
        }
