program bmp2pitch_p;

uses
  Forms,
  bmp2pitch_main_u in 'bmp2pitch_main_u.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Bitmap to Pitch Converter for Amiga SWOS';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
