from extensions import db

#Defines the Contract model
class Contract(db.Model):
    __tablename__ = 'CONTRACT'
    ContractID = db.Column(db.Integer, primary_key=True, autoincrement=True)
    TeamID = db.Column(db.Integer, db.ForeignKey('TEAM.TeamID'), nullable=False)
    PlayerID = db.Column(db.Integer, db.ForeignKey('PLAYER.PlayerID'), nullable=False)
    Value = db.Column(db.Integer)
    StartDate = db.Column(db.Date)
    EndDate = db.Column(db.Date)

    def to_dict(self):
        return {
            'ContractID': self.ContractID,
            'TeamID': self.TeamID,
            'PlayerID': self.PlayerID,
            'Value': self.Value,
            'StartDate': self.StartDate,
            'EndDate': self.EndDate
        }
