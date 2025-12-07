unit bmp2raw_copy_to_winuae_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl;

type
  TfrmCopyOutputToWinUAE = class(TForm)
    edtPath: TEdit;
    Label1: TLabel;
    btnSelectQuakePath: TButton;
    btnOK: TButton;
    btnCancel: TButton;
    Label2: TLabel;
    chkCopyToAllPitch: TCheckBox;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSelectQuakePathClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCopyOutputToWinUAE: TfrmCopyOutputToWinUAE;
  _quakepath, _injectorpath : string;
  _engine : string;

implementation
uses bmp2raw_main_u, Math;

{$R *.dfm}

procedure TfrmCopyOutputToWinUAE.btnCancelClick(Sender: TObject);
begin
  dlg_res := 'cancel';
  Close;
end;

procedure TfrmCopyOutputToWinUAE.btnOKClick(Sender: TObject);
begin
  gSetup.FVirtualGrafFolder := edtPath.Text;
  if chkCopyToAllPitch.Checked = True then begin
    gSetup.FCopyToAllPitch := 1;
  end
  else begin
    gSetup.FCopyToAllPitch := 0;
  end;

  dlg_res := 'ok';

  frmMain.SaveOption;
  Close;
end;

procedure TfrmCopyOutputToWinUAE.btnSelectQuakePathClick(Sender: TObject);
const
  SELDIRHELP = 1000;
var
  dir: String;
begin
  dir := edtPath.Text;
  if SelectDirectory(
    dir,
    [sdAllowCreate, sdPerformCreate, sdPrompt],
    SELDIRHELP
  ) then begin
    //showmessage(dir);
    //Button1.Caption := dir;
  end;

  if copy(dir, length(dir), 1) <> '\' then begin
    dir := dir + '\';
  end;
  _quakepath := dir;
  edtPath.Text := dir;

  //SetCurrentDir(gCurDir);
end;

procedure TfrmCopyOutputToWinUAE.Button1Click(Sender: TObject);
const
  SELDIRHELP = 1000;
var
  dir: String;
begin
  dir := gSetup.FVirtualGrafFolder;
  if SelectDirectory(
    dir,
    [sdAllowCreate, sdPerformCreate, sdPrompt],
    SELDIRHELP
  ) then begin
    //showmessage(dir);
    //Button1.Caption := dir;
  end;

  if copy(dir, 1, length(dir)) <> '\' then begin
    dir := dir + '\';
  end;
  _injectorpath := dir;
end;

procedure TfrmCopyOutputToWinUAE.FormShow(Sender: TObject);
var
  s : string;
begin

  dlg_res := 'cancel';
end;

procedure TfrmCopyOutputToWinUAE.FormActivate(Sender: TObject);
begin
  edtPath.Text := gSetup.FVirtualGrafFolder;
  if gSetup.FCopyToAllPitch = 1 then begin
    chkCopyToAllPitch.Checked := True;
  end
  else begin
    chkCopyToAllPitch.Checked := False;
  end;

  if gSetup.FGraphicType = 0 then begin
    chkCopyToAllPitch.Visible := True;
  end
  else begin
    chkCopyToAllPitch.Visible := False;
  end;
end;

end.
