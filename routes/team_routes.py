from services.team_service import get_team_data
from flask import jsonify

#GET endpoints for Team
def setup_team_routes(app):
    @app.route('/teams', methods=['GET'])
    def get_teams():
        team_dtos = get_team_data()
        return jsonify([team.__dict__ for team in team_dtos])
