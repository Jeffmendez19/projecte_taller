
from flask import Flask, request, jsonify
from flask_mysqldb import MySQL

app = Flask(__name__)
app.config['MYSQL_HOST'] = 'db'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'rootpass'
app.config['MYSQL_DB'] = 'taller'

mysql = MySQL(app)

@app.route('/vehicles', methods=['GET'])
def get_vehicles():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM Vehicle")
    rows = cur.fetchall()
    vehicles = [{'id': r[0], 'matricula': r[1], 'model': r[2], 'any': r[3], 'idClient': r[4]} for r in rows]
    return jsonify(vehicles)

@app.route('/appointments', methods=['POST'])
def create_appointment():
    data = request.json
    cur = mysql.connection.cursor()
    cur.execute("INSERT INTO Cites (data, servei, idClient, idVehicle) VALUES (%s, %s, %s, %s)",
                (data['data'], data['servei'], data['idClient'], data['idVehicle']))
    mysql.connection.commit()
    return jsonify({'message': 'Cita creada'}), 201

@app.route('/appointments', methods=['GET'])
def get_appointments():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM Cites")
    rows = cur.fetchall()
    appointments = [{'id': r[0], 'data': r[1], 'servei': r[2], 'idClient': r[3], 'idVehicle': r[4]} for r in rows]
    return jsonify(appointments)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
