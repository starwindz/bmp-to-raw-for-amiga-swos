unit bmp2raw_set_image_editor_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ShellAPI;

type
  TfrmSetImageEditor = class(TForm)
    panEditorName: TPanel;
    btnSetEditor: TButton;
    btnOk: TButton;
    btnCancel: TButton;
    lblDownloadGIMP: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSetEditorClick(Sender: TObject);
    procedure lblDownloadGIMPClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetImageEditor: TfrmSetImageEditor;
  _path, _filename : string;

implementation
uses bmp2raw_main_u, Math;

{$R *.dfm}

procedure TfrmSetImageEditor.FormActivate(Sender: TObject);
begin
  dlg_res := 'cancel';
  _path := edt_path;
  _filename := edt_filename;
  panEditorName.Caption := edt_Path + edt_Filename;
end;

procedure TfrmSetImageEditor.btnOkClick(Sender: TObject);
begin
  edt_path := _path;
  edt_filename := _filename;
  dlg_res := 'ok';
  frmMain.SaveEditorOption;
  close;
end;

procedure TfrmSetImageEditor.btnCancelClick(Sender: TObject);
begin
  dlg_res := 'cancel';
  close;
end;

procedure TfrmSetImageEditor.btnSetEditorClick(Sender: TObject);
var
  openDialog : TOpenDialog;    // Open dialog variable
  i, n : integer;
begin
  // Create the open dialog object - assign to our open dialog variable
  openDialog := TOpenDialog.Create(self);

  // Set up the starting directory to be the current one
  openDialog.InitialDir := edt_path;

  // Only allow existing files to be selected
  openDialog.Options := [ofFileMustExist];

  // Allow only .dpr and .pas files to be selected
  openDialog.Filter :=
    'Image editor executable|*.exe';

  // Select pascal files as the starting filter type
  openDialog.FilterIndex := 2;

  // Display the open file dialog
  if openDialog.Execute then begin
    ShowMessage('Selected file is ' + openDialog.FileName + '.');
    _path := ExtractFilePath( openDialog.FileName );
    _filename := ExtractFileName( openDialog.FileName );
    panEditorName.Caption := _path + _filename;
  end
  else begin
    //ShowMessage('File selction was canceled.');
  end;

  // Free up the dialog
  openDialog.Free;
end;

procedure TfrmSetImageEditor.lblDownloadGIMPClick(Sender: TObject);
begin
  ShellExecute(
      0, 'open',
      pchar('http://www.gimp.org/downloads'),
      pchar(''),
      NIL,
      SW_SHOW
  );
end;

end.
