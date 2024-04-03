from extensions import db

#Defines the Scorer and Assister models
class Scorer(db.Model):
    __tablename__ = 'SCORERS'
    MatchID = db.Column(db.Integer, db.ForeignKey('MATCH.MatchID'), primary_key=True)
    PlayerID = db.Column(db.Integer, db.ForeignKey('PLAYER.PlayerID'), primary_key=True)
    NumOfGoals = db.Column(db.Integer, nullable=False)

    def to_dict(self):
        return {
            'MatchID': self.MatchID,
            'PlayerID': self.PlayerID,
            'NumOfGoals': self.NumOfGoals
        }

class Assister(db.Model):
    __tablename__ = 'ASSISTERS'
    MatchID = db.Column(db.Integer, db.ForeignKey('MATCH.MatchID'), primary_key=True)
    PlayerID = db.Column(db.Integer, db.ForeignKey('PLAYER.PlayerID'), primary_key=True)
    NumOfAssists = db.Column(db.Integer, nullable=False)

    def to_dict(self):
        return {
            'MatchID': self.MatchID,
            'PlayerID': self.PlayerID,
            'NumOfAssists': self.NumOfAssists
        }
