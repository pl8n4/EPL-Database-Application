from extensions import db

# Defines the Team model
class Team(db.Model):
    __tablename__ = 'TEAM'
    TeamID = db.Column(db.Integer, primary_key=True, autoincrement=True)
    TeamName = db.Column(db.String(50), nullable=False)
    StadiumName = db.Column(db.String(50), nullable=False)
    # Relationships
    #contracts = db.relationship('Contract', backref='team', lazy=True)
    #home_matches = db.relationship('Match', foreign_keys='Match.HomeTeamID', backref='home_team', lazy='dynamic')
    #away_matches = db.relationship('Match', foreign_keys='Match.AwayTeamID', backref='away_team', lazy='dynamic')
    #manager = db.relationship('Manager', backref='team', lazy=True)

    def to_dict(self):
        return {
            'TeamID': self.TeamID,
            'TeamName': self.TeamName,
            'StadiumName': self.StadiumName
        }