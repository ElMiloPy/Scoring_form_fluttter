import 'package:flutter/material.dart';
import 'package:quiver/time.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';

int mes = DateTime.now().month;
int dia = DateTime.now().day;
int edad = 18 + Random().nextInt((65 + 1) - 18);
int sexo = 1 + Random().nextInt((2 + 1) - 1);
int estadoCivil = 1 + Random().nextInt((estadosCiviles.length + 1) - 1);
int nivelAcademico = 1 + Random().nextInt((nivelesAcademicos.length + 1) - 1);
int ocupacion = 1 + Random().nextInt((ocupaciones.length + 1) - 1);
bool viviendaPropia = Random().nextDouble() <= 0.5;
bool tieneAuto = Random().nextDouble() <= 0.5;
int ingresoDelCliente = 0;
int faja = 1 + Random().nextInt((fajas.length + 1) - 1);
int departamento = 1 + Random().nextInt((departamentos.length + 1) - 1);
bool tieneCuentaCorriente = Random().nextDouble() <= 0.5;
bool tieneCuentaDeAhorro = Random().nextDouble() <= 0.5;
bool tieneTarjetaDeCredito = Random().nextDouble() <= 0.5;
int montoEnGuaranies = 0;
int plazoEnMeses = 0 + Random().nextInt((60 + 1) - 0);
int tasaAnualNominal = 0 + Random().nextInt((60 + 1) - 0);
int destinoDelCredito = 1 + Random().nextInt((destinosDelCredito.length + 1) - 1);
bool refuerzo = Random().nextDouble() <= 0.5;
int maximoAtrasoPrevio = 0;
int antiguedadDelCliente = 0;
int cantidadDeAtrasosDe30DiasPrevios = 0;
int cantidadDeAtrasosDe60DiasPrevios = 0;

dynamic responseText = 'Esperando...';

Map meses = {
  1: 'Enero',
  2: 'Febrero',
  3: 'Marzo',
  4: 'Abril',
  5: 'Mayo',
  6: 'Junio',
  7: 'Julio',
  8: 'Agosto',
  9: 'Septiembre',
  10: 'Octubre',
  11: 'Noviembre',
  12: 'Diciembre',
};

Map sexos = {
  1: 'Hombre',
  2: 'Mujer',
};

Map estadosCiviles = {
  1: "Soltero/a",
  2: "Casado/a",
  3: "Divorciado/a",
  4: "Viudo/a",
  5: "Separado/a"
};

Map nivelesAcademicos = {
  1: "Secundaria",
  2: "Universitaria",
  3: "Técnica",
  4: "Primaria",
  5: "Postgrado"
};

Map ocupaciones = {
  1: "Dependiente",
  2: "Independiente",
  3: "Jubilado"
};

Map fajas = {
  1: "C",
  2: "F",
  3: "G",
  4: "H",
  5: "I",
  6: "J",
  7: "K",
  8: "L",
  9: "M",
  10: "N",
  11: "X"
};

Map departamentos = {
  1: "Central",
  2: "Alto Parana",
  3: "Canindeyu",
  4: "Amambay",
  5: "Neembucu",
  6: "Presidente Hayes",
  7: "Boqueron"
};

Map destinosDelCredito = {
  1: "Consumo",
  2: "Mejora de vivienda",
  3: "electrodomesticos",
  4: "Vehiculos",
  5: "Muebles",
  6: "Viajes",
  7: "lotes",
  8: "Salud",
  9: "Consolidacion de deudas",
  10: "Deuda de Tarjeta de Cr.",
  11: "Compra de bienes",
  12: "Compra de vivienda",
  13: "Alquiler",
  14: "Adquisicion de servicios"
};

Map form = {
  "id": "94920003518",
  "mes": mes,
  "dia": dia,
  "edad": edad,
  "sexo": formOptions["sexo"][sexo - 1],
  "estado_civil": formOptions["estado_civil"][estadoCivil - 1],
  "nivel_academico": formOptions["nivel_academico"][nivelAcademico - 1],
  "ocupacion": formOptions["ocupacion"][ocupacion - 1],
  "vivienda_propia": viviendaPropia == true ? 1 : 0,
  "tiene_auto": tieneAuto == true ? 1 : 0,
  "ingreso_cliente": ingresoDelCliente,
  "faja": formOptions["faja"][faja - 1],
  "departamento": formOptions["departamento"][departamento - 1],
  "tiene_cta_cte": tieneCuentaCorriente == true ? 1 : 0,
  "tiene_cta_ahorro": tieneCuentaDeAhorro == true ? 1 : 0,
  "tiene_tarjeta_credito": tieneTarjetaDeCredito == true ? 1 : 0,
  "monto_en_guaranies": montoEnGuaranies,
  "plazo_meses": plazoEnMeses,
  "tasa_anual_nom": tasaAnualNominal,
  "destino_del_credito": formOptions["destino_del_credito"][destinoDelCredito - 1],
  "refuerzo": refuerzo == true ? 1 : 0,
  "max_atraso_prev": maximoAtrasoPrevio,
  "antiguedad_cliente_meses": antiguedadDelCliente,
  "cant_atraso_30_prev": cantidadDeAtrasosDe30DiasPrevios,
  "cant_atraso_60_prev": cantidadDeAtrasosDe60DiasPrevios
};

Map formOptions = {
"id": "94920003518",
"mes": [1,2,3,4,5,6,7,8,9,10,11,12],
"dia": [1],
"edad": [1],
"sexo": ['M','F'],
"estado_civil": ['SOLTERO','CASADO','DIVORCIADO','VIUDO','SEPARADO'],
"nivel_academico": ['PRIMARIA','SECUNDARIA','UNIVERSITARIA','TECNICA','POSTGRADO'],
"ocupacion": ['DEPENDIENTE','INDEPENDIENTE','JUBILADO'],
"vivienda_propia": [0,1],
"tiene_auto": [0,1],
"ingreso_cliente": 2192839.0,
"faja": ['C','F','G','H','I','J','K','L','M','N','X'],
"departamento": ['CENTRAL','ALTO PARANA','CANINDEYU','AMAMBAY','NEEMBUCU','PTE HAYES','BOQUERON'],
"tiene_cta_cte": [0,1],
"tiene_cta_ahorro": [0,1],
"tiene_tarjeta_credito": [0,1],
"monto_en_guaranies": [1],
"plazo_meses": [1],
"tasa_anual_nom": [1],
"destino_del_credito": ['PRESTAMOS DE CONSUMO','FINANCIAMIENTO PARA MEJORAS DE VIVIENDAS Y APARTAMENTOS','PRESTAMOS PARA LA COMPRA DE ELECTRODOMESTICOS','PRESTAMO PARA LA ADQUISICION DE VEHICULOS','PRESTAMOS PARA LA COMPRA DE MUEBLES','PRESTAMOS PARA GASTOS DE VIAJES TURISTICOS','FINANCIAMIENTO PARA LA ADQUISICION DE LOTES DE TERRENOS','PRESTAMOS PARA TRATAMIENTOS MEDICOS Y CLINICOS','PRESTAMOS PARA CONSOLIDACION Y CANCELACION DE DEUDAS','PRESTAMOS POR UTILIZACION DE TARJETAS DE CREDITOS','PRESTAMOS PARA COMPRA DE OTROS BIENES','FINANCIAMIENTO PARA COMPRA DE VIVIENDAS Y APARTAMENTOS','ADQUISICION DE OTROS LOCALES','PRESTAMOS PARA ADQUISICION DE OTROS SERVICIOS'],
"refuerzo": [0,1],
"max_atraso_prev": [1],
"antiguedad_cliente_meses": [1],
"cant_atraso_30_prev": [1],
"cant_atraso_60_prev": [1]
};

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController diaText = TextEditingController();
  TextEditingController edadText = TextEditingController();
  TextEditingController ingresoDelClienteText = TextEditingController();
  TextEditingController montoEnGuaraniesText = TextEditingController();
  TextEditingController plazoEnMesesText = TextEditingController();
  TextEditingController tasaAnualNominalText = TextEditingController();
  TextEditingController maximoAtrasoPrevioText = TextEditingController();
  TextEditingController antiguedadDelClienteText = TextEditingController();
  TextEditingController cantidadDeAtrasosDe30DiasPreviosText = TextEditingController();
  TextEditingController cantidadDeAtrasosDe60DiasPreviosText = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      diaText.text = dia.toString();
      edadText.text = edad.toString();
      ingresoDelClienteText.text = ingresoDelCliente.toString();
      montoEnGuaraniesText.text = montoEnGuaranies.toString();
      plazoEnMesesText.text = plazoEnMeses.toString();
      tasaAnualNominalText.text = tasaAnualNominal.toString();
      maximoAtrasoPrevioText.text = maximoAtrasoPrevio.toString();
      antiguedadDelClienteText.text = antiguedadDelCliente.toString();
      cantidadDeAtrasosDe30DiasPreviosText.text = cantidadDeAtrasosDe30DiasPrevios.toString();
      cantidadDeAtrasosDe60DiasPreviosText.text = cantidadDeAtrasosDe60DiasPrevios.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFDBD5F0),
        appBar: AppBar(
          backgroundColor: Color(0xFF6A3AAB),
          title: Text('Formulario'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(8),
                children: [
                  Card(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                            child: Text('Mes:'),
                          ),
                          DropdownButton(
                            value: mes,
                            onChanged: (dynamic value) {
                              print(value);
                              setState(() {
                                mes = value!;
                              });
                            },
                            items: [
                              DropdownMenuItem(
                                value: 1,
                                child: Text(meses[1]),
                              ),
                              DropdownMenuItem(
                                value: 2,
                                child: Text(meses[2]),
                              ),
                              DropdownMenuItem(
                                value: 3,
                                child: Text(meses[3]),
                              ),
                              DropdownMenuItem(
                                value: 4,
                                child: Text(meses[4]),
                              ),
                              DropdownMenuItem(
                                value: 5,
                                child: Text(meses[5]),
                              ),
                              DropdownMenuItem(
                                value: 6,
                                child: Text(meses[6]),
                              ),
                              DropdownMenuItem(
                                value: 7,
                                child: Text(meses[7]),
                              ),
                              DropdownMenuItem(
                                value: 8,
                                child: Text(meses[8]),
                              ),
                              DropdownMenuItem(
                                value: 9,
                                child: Text(meses[9]),
                              ),
                              DropdownMenuItem(
                                value: 10,
                                child: Text(meses[10]),
                              ),
                              DropdownMenuItem(
                                value: 11,
                                child: Text(meses[11]),
                              ),
                              DropdownMenuItem(
                                value: 12,
                                child: Text(meses[12]),
                              ),
                            ]
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                            child: Text('Día:'),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.redAccent,
                                  ),
                                  color: Colors.lightGreen,
                                  onPressed: () {
                                    setState(() {
                                      form['dia'] = form['dia'] < daysInMonth(DateTime.now().year, mes) ? form['dia'] + 1 : form['dia'];
                                      diaText.text = form['dia'].toString();
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 50,
                                  child: TextField(
                                    controller: diaText,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        form['dia'] = (int.tryParse(value) ?? 0) > daysInMonth(DateTime.now().year, mes) ? (int.tryParse(value) ?? 0) : daysInMonth(DateTime.now().year, mes);
                                      });
                                    },
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.lightGreen,
                                  ),
                                  color: Colors.lightGreen,
                                  onPressed: () {
                                    setState(() {
                                      form['dia'] = form['dia'] > 1 ? form['dia'] - 1 : form['dia'];
                                      diaText.text = form['dia'].toString();
                                    });
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                            child: Text('Edad:'),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.redAccent,
                                  ),
                                  color: Colors.lightGreen,
                                  onPressed: () {
                                    setState(() {
                                      form['edad'] = form['edad'] < 65 ? form['edad'] + 1 : form['edad'];
                                      edadText.text = form['edad'].toString();
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 50,
                                  child: TextField(
                                    controller: edadText,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        form['edad'] = int.tryParse(value) ?? 0;
                                      });
                                    },
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.lightGreen,
                                  ),
                                  color: Colors.lightGreen,
                                  onPressed: () {
                                    setState(() {
                                      form['edad'] = form['edad'] > 18 ? form['edad'] - 1 : form['edad'];
                                      edadText.text = form['edad'].toString();
                                    });
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                            child: Text('Sexo:'),
                          ),
                          DropdownButton(
                              value: sexo,
                              onChanged: (dynamic value) {
                                print(value);
                                setState(() {
                                  sexo = value!;
                                });
                              },
                              items: [
                                DropdownMenuItem(
                                  value: 1,
                                  child: Text(sexos[1]),
                                ),
                                DropdownMenuItem(
                                  value: 2,
                                  child: Text(sexos[2]),
                                ),
                              ]
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                            child: Text('Estado civil:'),
                          ),
                          DropdownButton(
                              value: estadoCivil,
                              onChanged: (dynamic value) {
                                print(value);
                                setState(() {
                                  estadoCivil = value!;
                                });
                              },
                              items: [
                                DropdownMenuItem(
                                  value: 1,
                                  child: Text(estadosCiviles[1]),
                                ),
                                DropdownMenuItem(
                                  value: 2,
                                  child: Text(estadosCiviles[2]),
                                ),
                                DropdownMenuItem(
                                  value: 3,
                                  child: Text(estadosCiviles[3]),
                                ),
                                DropdownMenuItem(
                                  value: 4,
                                  child: Text(estadosCiviles[4]),
                                ),
                                DropdownMenuItem(
                                  value: 5,
                                  child: Text(estadosCiviles[5]),
                                ),
                              ]
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                            child: Text('Nivel Académico:'),
                          ),
                          DropdownButton(
                              value: nivelAcademico,
                              onChanged: (dynamic value) {
                                print(value);
                                setState(() {
                                  nivelAcademico = value!;
                                });
                              },
                              items: [
                                DropdownMenuItem(
                                  value: 1,
                                  child: Text(nivelesAcademicos[1]),
                                ),
                                DropdownMenuItem(
                                  value: 2,
                                  child: Text(nivelesAcademicos[2]),
                                ),
                                DropdownMenuItem(
                                  value: 3,
                                  child: Text(nivelesAcademicos[3]),
                                ),
                                DropdownMenuItem(
                                  value: 4,
                                  child: Text(nivelesAcademicos[4]),
                                ),
                                DropdownMenuItem(
                                  value: 5,
                                  child: Text(nivelesAcademicos[5]),
                                ),
                              ]
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                            child: Text('Ocupación:'),
                          ),
                          DropdownButton(
                              value: ocupacion,
                              onChanged: (dynamic value) {
                                print(value);
                                setState(() {
                                  ocupacion = value!;
                                });
                              },
                              items: [
                                DropdownMenuItem(
                                  value: 1,
                                  child: Text(ocupaciones[1]),
                                ),
                                DropdownMenuItem(
                                  value: 2,
                                  child: Text(ocupaciones[2]),
                                ),
                                DropdownMenuItem(
                                  value: 3,
                                  child: Text(ocupaciones[3]),
                                ),
                              ]
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                            child: Text('Vivienda propia:'),
                          ),
                          Checkbox(
                            value: viviendaPropia,
                            onChanged: (value) {
                              setState(() {
                                viviendaPropia = !viviendaPropia;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                            child: Text('Tiene Auto:'),
                          ),
                          Checkbox(
                            value: tieneAuto,
                            onChanged: (value) {
                              setState(() {
                                tieneAuto = !tieneAuto;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                            child: Text('Ingreso del cliente:'),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.redAccent,
                                  ),
                                  color: Colors.lightGreen,
                                  onPressed: () {
                                    setState(() {
                                      form['ingreso_cliente'] = form['ingreso_cliente'] + 1;
                                      ingresoDelClienteText.text = form['ingreso_cliente'].toString();
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 50,
                                  child: TextField(
                                    controller: ingresoDelClienteText,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        form['ingreso_cliente'] = int.tryParse(value) ?? 0;
                                      });
                                    },
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.lightGreen,
                                  ),
                                  color: Colors.lightGreen,
                                  onPressed: () {
                                    setState(() {
                                      form['ingreso_cliente'] = form['ingreso_cliente'] > 0 ? form['ingreso_cliente'] - 1 : form['ingreso_cliente'];
                                      ingresoDelClienteText.text = form['ingreso_cliente'].toString();
                                    });
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                            child: Text('Faja:'),
                          ),
                          DropdownButton(
                              value: faja,
                              onChanged: (dynamic value) {
                                print(value);
                                setState(() {
                                  faja = value!;
                                });
                              },
                              items: [
                                DropdownMenuItem(
                                  value: 1,
                                  child: Text(fajas[1]),
                                ),
                                DropdownMenuItem(
                                  value: 2,
                                  child: Text(fajas[2]),
                                ),
                                DropdownMenuItem(
                                  value: 3,
                                  child: Text(fajas[3]),
                                ),
                                DropdownMenuItem(
                                  value: 4,
                                  child: Text(fajas[4]),
                                ),
                                DropdownMenuItem(
                                  value: 5,
                                  child: Text(fajas[5]),
                                ),
                                DropdownMenuItem(
                                  value: 6,
                                  child: Text(fajas[6]),
                                ),
                                DropdownMenuItem(
                                  value: 7,
                                  child: Text(fajas[7]),
                                ),
                                DropdownMenuItem(
                                  value: 8,
                                  child: Text(fajas[8]),
                                ),
                                DropdownMenuItem(
                                  value: 9,
                                  child: Text(fajas[9]),
                                ),
                                DropdownMenuItem(
                                  value: 10,
                                  child: Text(fajas[10]),
                                ),
                                DropdownMenuItem(
                                  value: 11,
                                  child: Text(fajas[11]),
                                ),
                              ]
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                            child: Text('Departamento:'),
                          ),
                          DropdownButton(
                              value: departamento,
                              onChanged: (dynamic value) {
                                print(value);
                                setState(() {
                                  departamento = value!;
                                });
                              },
                              items: [
                                DropdownMenuItem(
                                  value: 1,
                                  child: Text(departamentos[1]),
                                ),
                                DropdownMenuItem(
                                  value: 2,
                                  child: Text(departamentos[2]),
                                ),
                                DropdownMenuItem(
                                  value: 3,
                                  child: Text(departamentos[3]),
                                ),
                                DropdownMenuItem(
                                  value: 4,
                                  child: Text(departamentos[4]),
                                ),
                                DropdownMenuItem(
                                  value: 5,
                                  child: Text(departamentos[5]),
                                ),
                                DropdownMenuItem(
                                  value: 6,
                                  child: Text(departamentos[6]),
                                ),
                                DropdownMenuItem(
                                  value: 7,
                                  child: Text(departamentos[7]),
                                ),
                              ]
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                            child: Text('Cuenta corriente:'),
                          ),
                          Checkbox(
                            value: tieneCuentaCorriente,
                            onChanged: (value) {
                              setState(() {
                                tieneCuentaCorriente = !tieneCuentaCorriente;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                            child: Text('Cuenta de ahorro:'),
                          ),
                          Checkbox(
                            value: tieneCuentaDeAhorro,
                            onChanged: (value) {
                              setState(() {
                                tieneCuentaDeAhorro = !tieneCuentaDeAhorro;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                            child: Text('Tarjeta de crédito:'),
                          ),
                          Checkbox(
                            value: tieneTarjetaDeCredito,
                            onChanged: (value) {
                              setState(() {
                                tieneTarjetaDeCredito = !tieneTarjetaDeCredito;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                            child: Text('Monto en guaraníes:'),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.redAccent,
                                  ),
                                  color: Colors.lightGreen,
                                  onPressed: () {
                                    setState(() {
                                      form['monto_en_guaranies'] = form['monto_en_guaranies'] + 1;
                                      montoEnGuaraniesText.text = form['monto_en_guaranies'].toString();
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 50,
                                  child: TextField(
                                    controller: montoEnGuaraniesText,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        form['monto_en_guaranies'] = int.tryParse(value) ?? 0;
                                      });
                                    },
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.lightGreen,
                                  ),
                                  color: Colors.lightGreen,
                                  onPressed: () {
                                    setState(() {
                                      form['monto_en_guaranies'] = form['monto_en_guaranies'] > 0 ? form['monto_en_guaranies'] - 1 : form['monto_en_guaranies'];
                                      montoEnGuaraniesText.text = form['monto_en_guaranies'].toString();
                                    });
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                            child: Text('Plazo en meses:'),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.redAccent,
                                  ),
                                  color: Colors.lightGreen,
                                  onPressed: () {
                                    setState(() {
                                      form['plazo_meses'] = form['plazo_meses'] < 60 ? form['plazo_meses'] + 1 : form['plazo_meses'];
                                      plazoEnMesesText.text = form['plazo_meses'].toString();
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 50,
                                  child: TextField(
                                    controller: plazoEnMesesText,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        form['plazo_meses'] = int.tryParse(value) ?? 0;
                                      });
                                    },
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.lightGreen,
                                  ),
                                  color: Colors.lightGreen,
                                  onPressed: () {
                                    setState(() {
                                      form['plazo_meses'] = form['plazo_meses'] > 0 ? form['plazo_meses'] - 1 : form['plazo_meses'];
                                      plazoEnMesesText.text = form['plazo_meses'].toString();
                                    });
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                            child: Text('Tasa anual nominal:'),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.redAccent,
                                  ),
                                  color: Colors.lightGreen,
                                  onPressed: () {
                                    setState(() {
                                      form['tasa_anual_nom'] = form['tasa_anual_nom'] < 60 ? form['tasa_anual_nom'] + 1 : form['tasa_anual_nom'];
                                      tasaAnualNominalText.text = form['tasa_anual_nom'].toString();
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 50,
                                  child: TextField(
                                    controller: tasaAnualNominalText,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        form['plazo_meses'] = int.tryParse(value) ?? 0;
                                      });
                                    },
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.lightGreen,
                                  ),
                                  color: Colors.lightGreen,
                                  onPressed: () {
                                    setState(() {
                                      form['tasa_anual_nom'] = form['tasa_anual_nom'] > 0 ? form['tasa_anual_nom'] - 1 : form['tasa_anual_nom'];
                                      tasaAnualNominalText.text = form['tasa_anual_nom'].toString();
                                    });
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                            child: Text('Destino del crédito:'),
                          ),
                          DropdownButton(
                              value: destinoDelCredito,
                              onChanged: (dynamic value) {
                                print(value);
                                setState(() {
                                  destinoDelCredito = value!;
                                });
                              },
                              items: [
                                DropdownMenuItem(
                                  value: 1,
                                  child: Text(destinosDelCredito[1]),
                                ),
                                DropdownMenuItem(
                                  value: 2,
                                  child: Text(destinosDelCredito[2]),
                                ),
                                DropdownMenuItem(
                                  value: 3,
                                  child: Text(destinosDelCredito[3]),
                                ),
                                DropdownMenuItem(
                                  value: 4,
                                  child: Text(destinosDelCredito[4]),
                                ),
                                DropdownMenuItem(
                                  value: 5,
                                  child: Text(destinosDelCredito[5]),
                                ),
                                DropdownMenuItem(
                                  value: 6,
                                  child: Text(destinosDelCredito[6]),
                                ),
                                DropdownMenuItem(
                                  value: 7,
                                  child: Text(destinosDelCredito[7]),
                                ),
                                DropdownMenuItem(
                                  value: 8,
                                  child: Text(destinosDelCredito[8]),
                                ),
                                DropdownMenuItem(
                                  value: 9,
                                  child: Text(destinosDelCredito[9]),
                                ),
                                DropdownMenuItem(
                                  value: 10,
                                  child: Text(destinosDelCredito[10]),
                                ),
                                DropdownMenuItem(
                                  value: 11,
                                  child: Text(destinosDelCredito[11]),
                                ),
                                DropdownMenuItem(
                                  value: 12,
                                  child: Text(destinosDelCredito[12]),
                                ),
                                DropdownMenuItem(
                                  value: 13,
                                  child: Text(destinosDelCredito[13]),
                                ),
                                DropdownMenuItem(
                                  value: 14,
                                  child: Text(destinosDelCredito[14]),
                                ),
                              ]
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                            child: Text('Refuerzo:'),
                          ),
                          Checkbox(
                            value: refuerzo,
                            onChanged: (value) {
                              setState(() {
                                refuerzo = !refuerzo;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                            child: Text('Máximo atraso previo:'),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.redAccent,
                                  ),
                                  color: Colors.lightGreen,
                                  onPressed: () {
                                    setState(() {
                                      form['max_atraso_prev'] = form['max_atraso_prev'] + 1;
                                      maximoAtrasoPrevioText.text = form['max_atraso_prev'].toString();
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 50,
                                  child: TextField(
                                    controller: maximoAtrasoPrevioText,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        form['max_atraso_prev'] = int.tryParse(value) ?? 0;
                                      });
                                    },
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.lightGreen,
                                  ),
                                  color: Colors.lightGreen,
                                  onPressed: () {
                                    setState(() {
                                      form['max_atraso_prev'] = form['max_atraso_prev'] > 0 ? form['max_atraso_prev'] - 1 : form['max_atraso_prev'];
                                      maximoAtrasoPrevioText.text = form['max_atraso_prev'].toString();
                                    });
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                            child: Text('Antigüedad del cliente:'),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.redAccent,
                                  ),
                                  color: Colors.lightGreen,
                                  onPressed: () {
                                    setState(() {
                                      form['antiguedad_cliente_meses'] = form['antiguedad_cliente_meses'] + 1;
                                      antiguedadDelClienteText.text = form['antiguedad_cliente_meses'].toString();
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 50,
                                  child: TextField(
                                    controller: antiguedadDelClienteText,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        form['antiguedad_cliente_meses'] = int.tryParse(value) ?? 0;
                                      });
                                    },
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.lightGreen,
                                  ),
                                  color: Colors.lightGreen,
                                  onPressed: () {
                                    setState(() {
                                      form['antiguedad_cliente_meses'] = form['antiguedad_cliente_meses'] > 0 ? form['antiguedad_cliente_meses'] - 1 : form['antiguedad_cliente_meses'];
                                      antiguedadDelClienteText.text = form['antiguedad_cliente_meses'].toString();
                                    });
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                            child: Text('Atraso de 30 días prev:'),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.redAccent,
                                  ),
                                  color: Colors.lightGreen,
                                  onPressed: () {
                                    setState(() {
                                      form['cant_atraso_30_prev'] = form['cant_atraso_30_prev'] + 1;
                                      cantidadDeAtrasosDe30DiasPreviosText.text = form['cant_atraso_30_prev'].toString();
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 50,
                                  child: TextField(
                                    controller: cantidadDeAtrasosDe30DiasPreviosText,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        form['cant_atraso_30_prev'] = int.tryParse(value) ?? 0;
                                      });
                                    },
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.lightGreen,
                                  ),
                                  color: Colors.lightGreen,
                                  onPressed: () {
                                    setState(() {
                                      form['cant_atraso_30_prev'] = form['cant_atraso_30_prev'] > 0 ? form['cant_atraso_30_prev'] - 1 : form['cant_atraso_30_prev'];
                                      cantidadDeAtrasosDe30DiasPreviosText.text = form['cant_atraso_30_prev'].toString();
                                    });
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                            child: Text('Atraso de 60 días prev:'),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.redAccent,
                                  ),
                                  color: Colors.lightGreen,
                                  onPressed: () {
                                    setState(() {
                                      form['cant_atraso_60_prev'] = form['cant_atraso_60_prev'] + 1;
                                      cantidadDeAtrasosDe60DiasPreviosText.text = form['cant_atraso_60_prev'].toString();
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 50,
                                  child: TextField(
                                    controller: cantidadDeAtrasosDe60DiasPreviosText,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        form['cant_atraso_60_prev'] = int.tryParse(value) ?? 0;
                                      });
                                    },
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.lightGreen,
                                  ),
                                  color: Colors.lightGreen,
                                  onPressed: () {
                                    setState(() {
                                      form['cant_atraso_60_prev'] = form['cant_atraso_60_prev'] > 0 ? form['cant_atraso_60_prev'] - 1 : form['cant_atraso_60_prev'];
                                      cantidadDeAtrasosDe60DiasPreviosText.text = form['cant_atraso_60_prev'].toString();
                                    });
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Color(0xFF6A3AAB)),
                ),
                child: Text('Evaluar'),
                onPressed: () async {
              var url = Uri.parse('http://150.136.130.132:9999/predict');
              var headers = {'Content-Type': 'application/json'};
              var body = jsonEncode(form);

              var response = await http.post(url, headers: headers, body: body);

              if (response.statusCode == 200) {
              print(response.body);
              } else {
              print('Error: ${response.statusCode}');
              }
              setState(() {
                responseText = jsonDecode(response.body)['predict'] < 1 ? 'Aceptado' : 'Denegado';
              });
              },
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF37C5CF),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Respuesta: $responseText',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}