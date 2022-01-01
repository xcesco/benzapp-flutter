class QRCodeData {
  QRCodeData(this.codiceFiscale, this.tesseraNumero, this.targa, this.veicolo,
      this.carburante);

  final String codiceFiscale;
  final String tesseraNumero;
  final String targa;
  final TipoVeicolo veicolo;
  final TipoCarburante carburante;

  QRCodeData.fromJson(Map<String, dynamic> json)
      : codiceFiscale = json['codiceFiscale'],
        tesseraNumero = json['tesseraNumero'],
        targa = json['targa'],
        veicolo = TipoVeicolo.values
            .firstWhere((element) => element.name == json['veicolo']),
        carburante = TipoCarburante.values
            .firstWhere((element) => element.name == json['carburante']);

  Map<String, dynamic> toJson() => {
        'codiceFiscale': codiceFiscale,
        'tesseraNumero': tesseraNumero,
        'targa': targa,
        'veicolo': veicolo.name,
        'carburante': carburante.name,
      };
}

enum TipoCarburante { BENZINA, DIESEL }

enum TipoVeicolo { AUTOVEICOLO, CICLOMOTORE, MOTOVEICOLO }
