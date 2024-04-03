from models.stadium import Stadium
from flask import jsonify

#GET endpoints for Stadium
def setup_stadium_routes(app):
    @app.route('/stadiums', methods=['GET'])
    def get_stadiums():
        stadiums = Stadium.query.all()
        return jsonify([stadium.to_dict() for stadium in stadiums])
