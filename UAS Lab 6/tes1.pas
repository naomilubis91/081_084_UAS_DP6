uses crt;

type
    TTask = record
        nama      : string[50];
        deadline  : integer;
        status    : string[20];
    end;

var
    tasks : array[1..100] of TTask;
    jumlah : integer;

procedure InputTugas; // Procedure untuk menginput tugas
var
    i : integer;
begin
    clrscr;
    write('Masukkan jumlah tugas: ');
    readln(jumlah);

    for i := 1 to jumlah do
    begin
        writeln;
        writeln(' Tugas ', i);
        write('Nama tugas: '); readln(tasks[i].nama);
        write('Deadline (hari lagi): '); readln(tasks[i].deadline);
        write('Status (belum/sudah): '); readln(tasks[i].status);
    end;
end;

function CariTerdekat: integer; // Function untuk mencari deadline terdekat
var
    i, idxMin : integer;
begin
    clrscr;
    idxMin := 1; // anggap tugas pertama yang paling dekat
    for i := 2 to jumlah do
    begin
        if tasks[i].deadline < tasks[idxMin].deadline then
            idxMin := i; // update jika ada deadline lebih kecil
    end;
    CariTerdekat := idxMin; // mengembalikan index
end;

procedure TampilData; // Procedure untuk menampilkan data
var
    i: integer;
begin
    clrscr;
    writeln(' DAFTAR TUGAS ');
    for i := 1 to jumlah do
    begin
        writeln(i, '. ', tasks[i].nama);
        writeln('Deadline: ', tasks[i].deadline, ' hari lagi');
        writeln('Status: ', tasks[i].status);
        writeln;
    end;
end;

procedure TugasPalingDekat; // Procedure untuk menandai tugas paling mendesak
var
    idx : integer;
begin
    clrscr;
    idx := CariTerdekat; // ambil index tugas terdekat
    writeln;
    writeln('TUGAS PALING MENDESAK: ', tasks[idx].nama);
    writeln('Deadline tersisa HANYA ', tasks[idx].deadline, ' hari lagi!');
    writeln('Status: ', tasks[idx].status);
    writeln;
end;

procedure Menu; // Program Utama
var
    pilihan : integer;
begin
    repeat
        writeln;
        writeln(' MENU ');
        writeln('1. Input Tugas');
        writeln('2. Tampilkan Semua Tugas');
        writeln('3. Tampilkan Tugas Dengan Deadline Terdekat');
        writeln('4. Keluar');
        write('Pilih menu: ');
        readln(pilihan);

        case pilihan of
            1: InputTugas;
            2: TampilData;
            3: TugasPalingDekat;
            4: writeln('Program selesai.');
        else
            writeln('Pilihan tidak valid!');
        end;

    until pilihan = 4;
end;

begin
    clrscr;
    writeln(' PROGRAM TASK DEADLINE TRACKER ');
    Menu;
end.