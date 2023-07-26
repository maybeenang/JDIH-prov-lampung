class ProdukHukum {
  // prod_url_lampiran
  final String? url_lampiran;

  // ketegori.category + "No." + prod_no + "Tahun" + prod_tahun + "Tentang" + prod_judul
  final String? judul;

  // prod_deskripsi
  final String? deskripsi;

  // prod_url_abstrak
  final String? abstrak;

  // kategori.category
  final String? jenisPeraturan;

  // prod_no
  final String? noPeraturan;

  // prod_tahun
  final String? tahunTerbit;

  // prod_tanggal
  final String? tanggal;

  // prod_teu_pengarang
  final String? teuBadan;

  // prod_sumber
  final String? sumber;

  // prod_tempat
  final String? tempatTerbit;

  // prod_bidanghukum
  final String? bidangHukum;

  // prod_subjek
  final String? subjek;

  // prod_bahasa
  final String? bahasa;

  // prod_lokasi
  final String? lokasi;

  // prod_status
  final String? status;

  ProdukHukum({
    this.url_lampiran,
    this.judul,
    this.deskripsi,
    this.abstrak,
    this.jenisPeraturan,
    this.noPeraturan,
    this.tahunTerbit,
    this.tanggal,
    this.teuBadan,
    this.sumber,
    this.tempatTerbit,
    this.bidangHukum,
    this.subjek,
    this.bahasa,
    this.lokasi,
    this.status,
  });

  factory ProdukHukum.fromJson(Map<String, dynamic> json) {
    // return json['data'].map((e) => ProdukHukum.fromJson(e)).toList();

    return ProdukHukum(
      url_lampiran: json['prod_url_lampiran'],
      judul: json['kategori']['category'] +
          " No." +
          json['prod_no'] +
          " Tahun " +
          json['prod_tahun'] +
          " Tentang " +
          json['prod_judul'],
      deskripsi: json['prod_deskripsi'],
      abstrak: json['prod_url_abstrak'],
      jenisPeraturan: json['kategori']['category'],
      noPeraturan: json['prod_no'],
      tahunTerbit: json['prod_tahun'],
      tanggal: json['prod_tanggal'],
      teuBadan: json['prod_teu_pengarang'],
      sumber: json['prod_sumber'],
      tempatTerbit: json['prod_tempat'],
      bidangHukum: json['prod_bidanghukum'],
      subjek: json['prod_subjek'],
      bahasa: json['prod_bahasa'],
      lokasi: json['prod_lokasi'],
      status: json['prod_status'],
    );
  }
}
