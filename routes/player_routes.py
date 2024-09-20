#from models.player import Player
#from flask import jsonify

#GET endpoint for Player
#def setup_player_routes(app):
#    @app.route('/players', methods=['GET'])
#    def get_players():
#        players = Player.query.all()
#        return jsonify([player.to_dict() for player in players])

from flask import jsonify
from services.player_service import get_players_with_stats

def setup_player_routes(app):
    @app.route('/players', methods=['GET'])
    def get_players():
        player_dtos = get_players_with_stats()
        return jsonify([player.__dict__ for player in player_dtos])
