program TransaksiBank;

uses crt;

type
  Nasabah = record
    Nama: string;
    NomorRekening: string;
    Saldo: real;
  end;

var
  DataNasabah: array[1..10] of Nasabah; // Maksimal 10 nasabah
  JumlahNasabah, Pilihan, i: integer;

// Prosedur untuk menambahkan nasabah baru
procedure TambahNasabah;
begin
  writeln('Masukkan jumlah nasabah yang ingin ditambahkan: ');
  readln(JumlahNasabah);
  for i := 1 to JumlahNasabah do
  begin
    writeln('Data Nasabah ke-', i);
    write('Nama: '); readln(DataNasabah[i].Nama);
    write('Nomor Rekening: '); readln(DataNasabah[i].NomorRekening);
    write('Saldo Awal: Rp. '); readln(DataNasabah[i].Saldo);
    writeln;
  end;
end;

// Prosedur untuk melakukan setoran
procedure Setoran;
var
  NoRekening: string;
  JumlahSetor, j: real;
  Ditemukan: boolean;
  k: integer;
begin
  write('Masukkan Nomor Rekening: ');
  readln(NoRekening);
  Ditemukan := False;
  
  for k := 1 to JumlahNasabah do
  begin
    if DataNasabah[k].NomorRekening = NoRekening then
    begin
      Ditemukan := True;
      write('Masukkan jumlah setoran: Rp. ');
      readln(JumlahSetor);
      DataNasabah[k].Saldo := DataNasabah[k].Saldo + JumlahSetor;
      writeln('Setoran berhasil! Saldo baru: Rp. ', DataNasabah[k].Saldo:0:2);
    end;
  end;

  if not Ditemukan then
    writeln('Nomor rekening tidak ditemukan!');
end;

// Prosedur untuk melakukan penarikan
procedure Penarikan;
var
  NoRekening: string;
  JumlahTarik: real;
  Ditemukan: boolean;
  k: integer;
begin
  write('Masukkan Nomor Rekening: ');
  readln(NoRekening);
  Ditemukan := False;

  for k := 1 to JumlahNasabah do
  begin
    if DataNasabah[k].NomorRekening = NoRekening then
    begin
      Ditemukan := True;
      write('Masukkan jumlah penarikan: Rp. ');
      readln(JumlahTarik);
      if JumlahTarik <= DataNasabah[k].Saldo then
      begin
        DataNasabah[k].Saldo := DataNasabah[k].Saldo - JumlahTarik;
        writeln('Penarikan berhasil! Saldo baru: Rp. ', DataNasabah[k].Saldo:0:2);
      end
      else
        writeln('Saldo tidak mencukupi!');
    end;
  end;

  if not Ditemukan then
    writeln('Nomor rekening tidak ditemukan!');
end;

// Prosedur untuk menampilkan semua data nasabah
procedure TampilkanDataNasabah;
var
  k: integer;
begin
  writeln('========================================');
  writeln('            DATA NASABAH               ');
  writeln('========================================');
  for k := 1 to JumlahNasabah do
  begin
    writeln('Nama            : ', DataNasabah[k].Nama);
    writeln('Nomor Rekening  : ', DataNasabah[k].NomorRekening);
    writeln('Saldo           : Rp. ', DataNasabah[k].Saldo:0:2);
    writeln('----------------------------------------');
  end;
end;

// Program utama
begin
  clrscr;
  JumlahNasabah := 0;
  repeat
    writeln('========== Menu Transaksi Bank ==========');
    writeln('1. Tambah Nasabah');
    writeln('2. Setoran');
    writeln('3. Penarikan');
    writeln('4. Tampilkan Data Nasabah');
    writeln('5. Keluar');
    writeln('=========================================');
    write('Pilih menu (1-5): '); readln(Pilihan);

    case Pilihan of
      1: TambahNasabah;
      2: Setoran;
      3: Penarikan;
      4: TampilkanDataNasabah;
      5: writeln('Terima kasih telah menggunakan program!');
    else
      writeln('Pilihan tidak valid!');
    end;

    writeln;
  until Pilihan = 5;
end.