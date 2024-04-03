from extensions import db

#Defines the Manager model
class Manager(db.Model):
    __tablename__ = 'MANAGER'
    ManagerID = db.Column(db.Integer, primary_key=True, autoincrement=True)
    Fname = db.Column(db.String(15), nullable=False)
    Mname = db.Column(db.String(15))
    Lname = db.Column(db.String(15), nullable=False)
    Nationality = db.Column(db.String(20), nullable=False)
    
    #TeamID = db.Column(db.Integer, db.ForeignKey('TEAM.TeamID'))  # ForeignKey to Team
    #team = db.relationship('Team', backref='manager')  # Relationship to Team
