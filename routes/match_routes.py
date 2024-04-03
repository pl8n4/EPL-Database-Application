from models.match import Match
from flask import jsonify

#GET endpoint for Match
def setup_match_routes(app):
    @app.route('/matches', methods=['GET'])
    def get_matches():
        matches = Match.query.all()
        return jsonify([match.to_dict() for match in matches])
