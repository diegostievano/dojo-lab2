unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TResultArray = Array of Integer;
  //TArrayParam = Array of Integer;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
  private
    function retornaArray(pArray: Array of Integer): TResultArray;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

Const
  Lista: Array[0..4] of Integer = (1, 2, 3, 4, 5);
  Lista2: Array[0..2] of Integer = (3, 2, 1);

{$R *.dfm}

{This problem was asked by Uber.
Given an array of integers, return a new array such that each element
at index i of the new array is the product of all the numbers in the original
array except the one at i.
For example, if our input was [1, 2, 3, 4, 5], the expected output would be [120, 60, 40, 30, 24].
If our input was [3, 2, 1], the expected output would be [2, 3, 6].}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Label2.Caption := '';
  retornaArray(Lista2);
end;

function TForm1.retornaArray(pArray: Array of Integer): TResultArray;
var
  vIndex, vIndex2, vProduct, vArray2: Integer;
begin
  SetLength(Result, length(pArray));

  for vIndex := low(pArray) to High(pArray) do
  begin

    vProduct := 0;

    for vIndex2 := 0 to length(pArray) - 1 do
    begin
       if vIndex = vIndex2 then
       begin
          Continue;
       end
       else
       if vProduct = 0 then
         vProduct := pArray[vIndex2]
       else
         vProduct := vProduct * pArray[vIndex2];

       Result[vIndex] := vProduct;
    end;

    //Só pra exibir o resultado em tela.
    if Label2.Caption = '' then
      Label2.Caption := IntToStr(Result[vIndex])
    else
      Label2.Caption := Label2.Caption + ', ' + IntToStr(Result[vIndex]);

  end;

end;

end.
