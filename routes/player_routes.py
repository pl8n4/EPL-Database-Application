from models.player import Player
from flask import jsonify

#GET endpoint for Player
def setup_player_routes(app):
    @app.route('/players', methods=['GET'])
    def get_players():
        players = Player.query.all()
        return jsonify([player.to_dict() for player in players])
