from flask import Flask, request, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

# Simula base de datos en memoria
cites = []

@app.route('/api/cites', methods=['GET'])
def get_cites():
    return jsonify(cites)

@app.route('/api/cites', methods=['POST'])
def add_cita():
    data = request.get_json()
    cites.append(data)
    return jsonify({"message": "Cita afegida correctament"}), 201

if __name__ == '__main__':
    app.run(debug=True)
