program bmp2raw_p;

uses
  Forms,
  bmp2raw_main_u in 'bmp2raw_main_u.pas' {frmMain},
  bmp2raw_copy_to_winuae_u in 'bmp2raw_copy_to_winuae_u.pas' {frmCopyOutputToWinUAE},
  bmp2raw_set_image_editor_u in 'bmp2raw_set_image_editor_u.pas' {frmSetImageEditor};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Bitmap to Raw Converter for SWOS V1.01';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmCopyOutputToWinUAE, frmCopyOutputToWinUAE);
  Application.CreateForm(TfrmSetImageEditor, frmSetImageEditor);
  Application.Run;
end.
