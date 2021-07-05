unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SaveDialog1: TSaveDialog;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var f:text;
    filename,
    path:string;
    sr : TSearchRec;
    FileAttrs : Integer;
begin

  FileAttrs := faAnyFile;

  If SelectDirectoryDialog1.Execute Then Begin

    path := SelectDirectoryDialog1.Filename;

    filename := path +'\'+  Edit1.text;
    AssignFile(f,filename);
    //if fileexists(filename) then
    //  Reset(f)
    //else
    Rewrite(f);


    if FindFirst(path+'\'+Edit3.Text, FileAttrs, sr) = 0 then
    begin
      repeat
        if (sr.Attr and FileAttrs) = sr.Attr then
        begin
          writeln(f,edit2.text +' '+sr.name);
        end;
      until FindNext(sr) <> 0;
      FindClose(sr);
    end;

    CloseFile(f);

  end;
end;

end.

