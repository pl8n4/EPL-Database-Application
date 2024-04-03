from extensions import db
from models.contract import Contract
# Define the Player model 
class Player(db.Model):
    __tablename__ = 'PLAYER'
    PlayerID = db.Column(db.Integer, primary_key=True, autoincrement=True)
    Fname = db.Column(db.String(15), nullable=False)
    Lname = db.Column(db.String(30))
    DOB = db.Column(db.Date)
    Nationality = db.Column(db.String(50))
    Position = db.Column(db.String(50))
    
    # Relationships
    #contracts = db.relationship('Contract', backref='player', lazy=True)
    #assists = db.relationship('Assister', backref='player', lazy=True)
    #goals = db.relationship('Scorer', backref='player', lazy=True)

    def to_dict(self):
        return {
            'PlayerID': self.PlayerID,
            'Fname': self.Fname,
            'Lname': self.Lname,
            'DOB': self.DOB.isoformat() if self.DOB else None,
            'Nationality': self.Nationality,
            'Position': self.Position
        }