from extensions import db

#Defines the Stadium model according to the STADIUM table structure from SQL DB
class Stadium(db.Model):
    __tablename__ = 'STADIUM'
    StadiumName = db.Column(db.String(50), primary_key=True)
    Country = db.Column(db.String(50), nullable=False)
    City = db.Column(db.String(50), nullable=False)
    CAPACITY = db.Column(db.Integer)

    def to_dict(self):
        return {
            'StadiumName': self.StadiumName,
            'Country': self.Country,
            'City': self.City,
            'Capacity': self.CAPACITY
        }