from models.contract import Contract
from flask import jsonify

# GET endpoints for Contract
def setup_contract_routes(app):
    @app.route('/contracts', methods=['GET'])
    def get_contracts():
        contracts = Contract.query.all()
        return jsonify([contract.to_dict() for contract in contracts])
