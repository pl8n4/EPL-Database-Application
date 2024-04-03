from models.team import Team
from flask import jsonify

#GET endpoints for Team
def setup_team_routes(app):
    @app.route('/teams', methods=['GET'])
    def get_teams():
        teams = Team.query.all()
        return jsonify([team.to_dict() for team in teams])
