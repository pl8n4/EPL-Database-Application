from flask import jsonify
from services.fixture_service import get_fixture_data

#GET endpoint for Match
def setup_match_routes(app):
    @app.route('/fixtures', methods=['GET'])
    def get_fixtures():
        fixture_dtos = get_fixture_data()
        return jsonify([fixture.__dict__ for fixture in fixture_dtos])
