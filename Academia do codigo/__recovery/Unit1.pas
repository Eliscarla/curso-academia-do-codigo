unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.ScrollBox, FMX.Memo, System.Classes,
  Generics.Collections;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Panel1: TPanel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    function retornarListaNumeroPrimo(aValorMaximo : Integer) : TList<Integer>;
    function verificarNumeroPrimo(aValue : Integer) : Boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation


{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
var
  I : integer;
  listaNrPrimos : TList<Integer>;
  valor, valorAux, valorAux2, valorASerDecomposto: Integer;
begin

  valorASerDecomposto := StrToInt(Edit1.Text);
  Memo1.Lines.Clear;
  Memo1.Lines.Add('Decompondo em Fatores Primos');

  listaNrPrimos := retornarListaNumeroPrimo(valorASerDecomposto);

  valorAux :=   valorASerDecomposto;

  for valor in listaNrPrimos do
  begin

   if valorAux mod valor <> 0 then
     continue;

    valorAux2 :=   valorAux div valor;

    Memo1.Lines.Add(IntToStr(valorAux) + ' | ' + IntToStr(valor) + ' = ' +
                    IntToStr(valorAux2) );
    valorAux :=  valorAux2;

    if valorAux = 0 then
      Break;

  end;

  listaNrPrimos.Free;
end;

function TForm1.retornarListaNumeroPrimo(aValorMaximo : Integer): TList<Integer>;
var
  i : Integer;
  listaNumerosPrimos: TList<Integer>;
begin

  listaNumerosPrimos := TList<Integer>.Create;
  if (aValorMaximo >= 2) then
    listaNumerosPrimos.Add(2);

  for I := 3 to aValorMaximo do
  begin
    if verificarNumeroPrimo(I) then
      listaNumerosPrimos.Add(I);
  end;

  Result := listaNumerosPrimos;

end;

function TForm1.verificarNumeroPrimo(aValue : Integer): Boolean;
var
  I: Integer;
begin

  Result := False;
  for I := 2 to Trunc(Sqrt(aValue)) do
  begin
    if aValue mod I = 0 then
      Exit;
  end;
  Result := True;
end;

end.
