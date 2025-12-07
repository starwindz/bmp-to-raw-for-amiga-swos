unit bmp2raw_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg, FileCtrl, ShellAPI;

type  
  TMapping = packed record
    b1, b2, b3, b4 : byte;
  end;

  TPitchBitmapItem = packed record
    bit_array : array[0..15, 0..15] of byte;
  end;
  TPitchBitmapsItem = packed record
    bit_map : array[0..54, 0..41] of TPitchBitmapItem;
  end;

  TfrmMain = class(TForm)
    edtWorkFolder: TEdit;
    edtPitchName: TEdit;
    btnMakeFullPitchBitmap: TButton;
    imgAdBoard: TImage;
    ScrollBox1: TScrollBox;
    imgWork: TImage;
    btnPCtoAmiga: TButton;
    imgPC: TImage;
    imgAmiga: TImage;
    Button1: TButton;
    edtAmigaMapFile: TEdit;
    memLog: TMemo;
    Button2: TButton;
    imgSpriteTest: TImage;
    edtSprNo: TEdit;
    btnShowSprite: TButton;
    btnSaveAllSpr: TButton;
    btnReconstruct: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    memNewLog: TMemo;
    btnBmpScreenOpen: TButton;
    btnBmpScreenClose: TButton;
    btnAbout: TButton;
    GroupBox1: TGroupBox;
    imgSprite: TImage;
    ScrollBox2: TScrollBox;
    imgBase: TImage;
    fileInput: TFileListBox;
    btnEditBMP: TButton;
    btnUpdateFileList: TButton;
    btnDeleteFile: TButton;
    Label2: TLabel;
    cmbGraphicType: TComboBox;
    btnOpenInputFolder: TButton;
    Label3: TLabel;
    cmbPlatform: TComboBox;
    btnCopyTo: TButton;
    btnRename: TButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    cmbOutputFilename: TComboBox;
    btnCopyOutputToWinUAE: TButton;
    GroupBox4: TGroupBox;
    Button3: TButton;
    cmdOpenOutputFolder: TButton;
    btnQuit: TButton;
    rgColorStyleView: TRadioGroup;
    radNormal: TRadioButton;
    radSoft: TRadioButton;
    radHard: TRadioButton;
    radDry: TRadioButton;
    radWet: TRadioButton;
    radFrozen: TRadioButton;
    radMuddy: TRadioButton;
    chkGridView: TCheckBox;
    btnEditorOption: TButton;
    btnChkNumTiles: TButton;
    btnVisitForum: TButton;
    Label4: TLabel;
    cmbPackingOption: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure btnMakeFullPitchBitmapClick(Sender: TObject);
    procedure btnMakeFixedAdBoardBitmapClick(Sender: TObject);
    procedure imgWorkMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgWorkMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgWorkMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnPCtoAmigaClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnShowSpriteClick(Sender: TObject);
    procedure btnSaveAllSprClick(Sender: TObject);
    procedure btnReconstructClick(Sender: TObject);
    procedure btnConvertClick(Sender: TObject);
    procedure fileInputClick(Sender: TObject);
    procedure btnOpenOutputFolderClick(Sender: TObject);
    procedure btnUpdateFileListClick(Sender: TObject);
    procedure btnEditBMPClick(Sender: TObject);
    procedure btnDeleteFileClick(Sender: TObject);
    procedure btnAboutClick(Sender: TObject);
    procedure btnOpenInputFolderClick(Sender: TObject);
    procedure cmdOpenOutputFolderClick(Sender: TObject);
    procedure btnCopyOutputToWinUAEClick(Sender: TObject);
    procedure fileInputChange(Sender: TObject);
    procedure cmbGraphicTypeChange(Sender: TObject);
    procedure btnQuitClick(Sender: TObject);
    procedure radNormalClick(Sender: TObject);
    procedure radSoftClick(Sender: TObject);
    procedure radHardClick(Sender: TObject);
    procedure radDryClick(Sender: TObject);
    procedure radWetClick(Sender: TObject);
    procedure radFrozenClick(Sender: TObject);
    procedure radMuddyClick(Sender: TObject);
    procedure chkGridViewClick(Sender: TObject);
    procedure btnEditorOptionClick(Sender: TObject);
    procedure btnChkNumTilesClick(Sender: TObject);
    procedure btnVisitForumClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LoadBasePitch;
    procedure CopySprite(imgSrc : TImage; imgTar : TImage; srcIdx : integer; srcCnt : integer; tarPosX : integer; tarPosY : integer);
    procedure GetMapping;

    procedure ShowFullPitch;
    procedure MakeSprites;

    procedure MakeAmigaMap;

    function PitchMatrixProcessing(zj : integer; zi : integer) : integer;
    function IsSameMatrix(za : TPitchBitmapItem; zb : TPitchBitmapItem) : boolean;

    function DEC2BIN(DEC: LONGINT; len : integer): string;
    function BIN2DEC(BIN: string): LONGINT;
    function DEC2HEX(DEC: LONGINT): string;
    function BIN2HEX(BIN: string): string;

    procedure ShowFullPitchFromBMP;
    procedure DrawGridOnWorkImage;

    procedure DC_MakeWord;
    procedure Test_DC_MakeWord;
    procedure DC_LoadBasePitch;
    procedure UI_ShowPitchBitmap;
    procedure DC_MakeAmigaMap;
    function DC_PitchMatrixProcessing(zj, zi: integer): integer;
    function DC_IsSameMatrix(za, zb: TPitchBitmapItem): boolean;

    Function RunExeAndWait(AFn, AParam: string; AVisi : Word) : integer;
    function WinExecAndWait32(FileName : PChar; CommandLine : PChar;
             Visibility : Integer) : DWORD;
    Function ShortFileName(Const FileName: String): String;

    procedure InitSetup;
    procedure LoadOption;
    procedure SaveOption;

    procedure CopyOutputToWinUAE;
    procedure CopyOutputToWinUAEForTest;

    procedure DC_MakeAmigaRaw_Old;   // Not used
    procedure DC_MakeAmigaRaw;
    procedure DC_MakeAmigaRaw_New;   // For title
    procedure DC_LoadBasePaletteForRaw;

    procedure DC_LoadAmigaPalettes;

    procedure LoadEditorOption;
    procedure SaveEditorOption;
  end;

  TSetup = packed record
    FPlatform : integer;
    FGraphicType : integer;

    FInputFolder : string;
    FOutputFolder : string;
    FRefOutputFolder : string;

    FInputFile : string;
    FOutputFile : string;

    FVirtualGrafFolder : string;
    FCopyToAllPitch : integer;
  end;

  //PRGBQuadArray = ^TRGBQuadArray;


var
  frmMain: TfrmMain;
  mapping : array[0..54, 0..41] of TMapping;
  pitch_bitmap : TPitchBitmapsItem;

  pitch_matrix_byte : array[0..54, 0..41] of integer;  // PREVIOUS: byte
  pitch_matrix : array[0..54, 0..41] of TMapping;
  pitch_sprite : array of TPitchBitmapItem;
  pitch_sprite_cnt : integer;

  // PANNING-BEGIN
  SX: Integer;
  SY: Integer;
  LX: Integer;
  LY: Integer;
  // PANNING-END

  StdPaletteA : TPaletteEntry;
  StdPaletteB : HPALETTE;
  LogicalPalette :  TMaxLogPalette;
  AmigaPalettes : array[0..4] of TMaxLogPalette;

  AmigaPal : array[0..4] of HPALETTE;
  AmigaPal_Normal : HPALETTE;
  AmigaPal_Soft : HPALETTE;
  AmigaPal_Hard : HPALETTE;
  AmigaPal_Dry : HPALETTE;
  AmigaPal_Wet : HPALETTE;

  DC_input_pixel : array[0..15] of byte;
  DC_output_byte : array[0..7] of byte;
  DC_proc_bin : string;

  DC_bmp_width, DC_bmp_height : integer;
  DC_input_file, DC_output_file : string;

  gCurDir : string;

  gSetup : TSetup;

  dlg_res : string;

  edt_path : string;
  edt_filename : string;

  DC_PitchCheckMode : string;

implementation

uses Math, DateUtils, bmp2raw_copy_to_winuae_u, bmp2raw_set_image_editor_u;

{$R *.dfm}
{===================================================}
Function TfrmMain.ShortFileName(Const FileName: String): String;
{===================================================}
Var
  aTmp: Array[0..255] Of Char;

Begin
    If GetShortPathName(PChar (FileName), aTmp, Sizeof (aTmp) - 1) = 0 Then
    Begin
      Result:= FileName;
    End
    Else
    Begin
      Result:= StrPas (aTmp);
    End;
End;

Function TfrmMain.RunExeAndWait(AFn, AParam: string; AVisi : Word) : integer;
var
  s : string;
begin
  //ShowMessage('Before: ' + AFn);
  s := ShortFileName(AFn);
  //ShowMessage('After: ' + s);

  WinExecAndWait32(PChar(s), PChar(AParam), AVisi);
end;

function TfrmMain.WinExecAndWait32(FileName : PChar; CommandLine : PChar;
                       Visibility : Integer) : DWORD;
var
    zAppName:array[0..512] of char;
    zCurDir:array[0..255] of char;
    WorkDir:ShortString;
    StartupInfo:TStartupInfo;
    ProcessInfo:TProcessInformation;
begin
    StrCopy(zAppName, FileName);
    StrCat(zAppName, CommandLine);
    GetDir(0, WorkDir);
    StrPCopy(zCurDir, WorkDir);
    FillChar(StartupInfo, Sizeof(StartupInfo),#0);
    StartupInfo.cb := Sizeof(StartupInfo);
    StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
    StartupInfo.wShowWindow := Visibility;
    //StartupInfo.wShowWindow := sw_

    if not CreateProcess(nil,
        zAppName,              { pointer to command line string }
        nil,                   { pointer to process security attributes}
        nil,                   { pointer to thread security attributes }
        false,                 { handle inheritance flag }
        CREATE_NEW_CONSOLE or  { creation flags }
        HIGH_PRIORITY_CLASS, {NORMAL_PRIORITY_CLASS, ...}
        nil,                   { pointer to new environment block }
        nil,                   { pointer to current directory name }
        StartupInfo,           { pointer to STARTUPINFO }
        ProcessInfo) then      { pointer to PROCESS_INF }
        Result := 0
    else begin
        WaitforSingleObject(ProcessInfo.hProcess,INFINITE);
        GetExitCodeProcess(ProcessInfo.hProcess,Result);
    end;
end;

function TfrmMain.DEC2BIN(DEC: LONGINT; len : integer): string;
var
  BIN: string;
  I, J: LONGINT;
  ln : integer;
  z : string;
begin
  if DEC = 0 then
    BIN := '0'
  else
  begin
    BIN := '';
    I := 0;
    while (1 shl (I + 1)) <= DEC do
      I := I + 1;
    { (1 SHL (I + 1)) = 2^(I + 1) }
    for J := 0 to I do
    begin
      if (DEC shr (I - J)) = 1 then
        BIN := BIN + '1'
          { (DEC SHR (I - J)) = DEC DIV 2^(I - J) }
      else
        BIN := BIN + '0';
      DEC := DEC and ((1 shl (I - J)) - 1);
      { DEC AND ((1 SHL (I - J)) - 1) = DEC MOD 2^(I - J) }
    end;
  end;

  ln := length(trim(BIN));
  if ln >= len then begin
  end
  else begin
    for i := 1 to len - ln do begin
      BIN := '0' + BIN;
    end;
  end;
  DEC2BIN := BIN;
end;

function TfrmMain.BIN2DEC(BIN: string): LONGINT;
var
  J: LONGINT;
  Error: BOOLEAN;
  DEC: LONGINT;
begin
  DEC := 0;
  Error := False;
  for J := 1 to Length(BIN) do
  begin
    if (BIN[J] <> '0') and (BIN[J] <> '1') then
      Error := True;
    if BIN[J] = '1' then
      DEC := DEC + (1 shl (Length(BIN) - J));
    { (1 SHL (Length(BIN) - J)) = 2^(Length(BIN)- J) }
  end;
  if Error then
    BIN2DEC := 0
  else
    BIN2DEC := DEC;
end;

function TfrmMain.DEC2HEX(DEC: LONGINT): string;
const
  HEXDigts: string[16] = '0123456789ABCDEF';
var
  HEX: string;
  I, J: LONGINT;

begin
  if DEC = 0 then
    HEX := '0'
  else
  begin
    HEX := '';
    I := 0;
    while (1 shl ((I + 1) * 4)) <= DEC do
      I := I + 1;
    { 16^N = 2^(N * 4) }
    { (1 SHL ((I + 1) * 4)) = 16^(I + 1) }
    for J := 0 to I do
    begin
      HEX := HEX + HEXDigts[(DEC shr ((I - J) * 4)) + 1];
      { (DEC SHR ((I - J) * 4)) = DEC DIV 16^(I - J) }
      DEC := DEC and ((1 shl ((I - J) * 4)) - 1);
      { DEC AND ((1 SHL ((I - J) * 4)) - 1) = DEC MOD 16^(I - J) }
    end;
  end;
  DEC2HEX := HEX;
end;

function TfrmMain.BIN2HEX(BIN: string): string;
  function SetHex(St: string; var Error: BOOLEAN): CHAR;
  var
    Ch: CHAR;

  begin
    if St = '0000' then
      Ch := '0'
    else if St = '0001' then
      Ch := '1'
    else if St = '0010' then
      Ch := '2'
    else if St = '0011' then
      Ch := '3'
    else if St = '0100' then
      Ch := '4'
    else if St = '0101' then
      Ch := '5'
    else if St = '0110' then
      Ch := '6'
    else if St = '0111' then
      Ch := '7'
    else if St = '1000' then
      Ch := '8'
    else if St = '1001' then
      Ch := '9'
    else if St = '1010' then
      Ch := 'A'
    else if St = '1011' then
      Ch := 'B'
    else if St = '1100' then
      Ch := 'C'
    else if St = '1101' then
      Ch := 'D'
    else if St = '1110' then
      Ch := 'E'
    else if St = '1111' then
      Ch := 'F'
    else
      Error := True;
    SetHex := Ch;
  end;

var
  HEX: string;
  I: INTEGER;
  Temp: string[4];
  Error: BOOLEAN;

begin
  Error := False;
  if BIN = '0' then
    HEX := '0'
  else
  begin
    Temp := '';
    HEX := '';
    if Length(BIN) mod 4 <> 0 then
      repeat
        BIN := '0' + BIN;
      until Length(BIN) mod 4 = 0;
    for I := 1 to Length(BIN) do
    begin
      Temp := Temp + BIN[I];
      if Length(Temp) = 4 then
      begin
        HEX := HEX + SetHex(Temp, Error);
        Temp := '';
      end;
    end;
  end;
  if Error then
    BIN2HEX := '0'
  else
    BIN2HEX := HEX;
end;

procedure TfrmMain.CopySprite(imgSrc, imgTar: TImage; srcIdx, srcCnt,
  tarPosX, tarPosY: integer);
var
  src_x, src_y, src_w, src_h, tar_x, tar_y, offset : integer;
begin
  offset := 1155;
  src_x := 0; src_y := offset + 16 * srcIdx; src_w := 16; src_h := 16 * srcCnt;
  tar_x := 16 * tarPosX; tar_y := 16 * tarPosY;
  Bitblt(imgTar.Canvas.Handle, tar_x, tar_y, src_w, src_h,
         imgSrc.Canvas.Handle, src_x, src_y, SRCCOPY);
end;

procedure TfrmMain.GetMapping;
var
  fs : TFileStream;
  buffer : array[0..9240-1] of byte;
  src_file : string;
  buf_size : integer;
begin
  //src_file := GetCurrentDir + '\' + trim(edtWorkFolder.Text) + '\pitch\raw\swcpich1.map';
  //src_file := GetCurrentDir + '\' + trim(edtWorkFolder.Text) + '\pitch\raw\PITCH1.DAT';
  src_file := GetCurrentDir + '\' + trim(edtWorkFolder.Text) + '\pitch\raw\' +  trim(edtPitchName.Text) + '.map';
  buf_size := 9240;

  // Read Buffer
  fs := TFileStream.Create(src_file, fmOpenReadWrite);
  fs.Seek(0, soFromBeginning);
  fs.Read(buffer, buf_size);
  //fs.Read(mapping, buf_size);
  fs.Free;

  move(buffer, mapping, 9240);
end;

procedure TfrmMain.LoadBasePitch;
var
  base_bmp_file : string;
  bmp : TBitmap;
  //h : HP
begin
  bmp := TBitmap.Create;

  base_bmp_file := GetCurrentDir + '\' + trim(edtWorkFolder.Text) +
                   '\pitch\bmp\' + trim(edtPitchName.Text) + '.map.bmp';
  bmp.PixelFormat := pf4bit;
  bmp.LoadFromFile(base_bmp_file);
  imgBase.Picture.Graphic := bmp;
  StdPaletteB := bmp.Palette;

  bmp.Free;
  memLog.Lines.Add('Base Pitch File ' + base_bmp_file + ' loaded.')
end;

procedure TfrmMain.DC_LoadBasePitch;
var
  base_bmp_file : string;
  bmp : TBitmap;
  //h : HP
begin
  bmp := TBitmap.Create;

  //base_bmp_file := GetCurrentDir + '\' + trim(edtWorkFolder.Text) +
  //                 '\pitch\bmp\' + trim(edtPitchName.Text) + '.map.bmp';
  base_bmp_file := gCurDir + '\palette\' + 'base_palette.bmp';
  bmp.PixelFormat := pf4bit;
  bmp.LoadFromFile(base_bmp_file);
  imgBase.Picture.Graphic := bmp;
  StdPaletteB := bmp.Palette;

  bmp.Free;
  memLog.Lines.Add('Base Pitch File ' + base_bmp_file + ' loaded.')
end;

procedure TfrmMain.ShowFullPitch;
var
  x, y, x_st, x_en, y_st, y_en : integer;
  idx, a, b : integer;
  s : string;
  out_file : string;
  bmp : TBitmap;
  res : integer;
begin
  out_file := GetCurrentDir + '\' + trim(edtWorkFolder.Text) +
              '\pitch\bmp\' + '#' + trim(edtPitchName.Text) + '_full.bmp';
  if FileExists(out_file) then begin
    res := Application.MessageBox(
          PChar( '''' + out_file + ''' is already exist. Are you sure to overwrite?'),
          PChar( Application.Title ),
          MB_YESNO
    );
    if res = ID_YES then begin
      //imgWork.Picture.SaveToFile(out_file);
    end
    else begin
      exit;
    end;
  end
  else begin
    //imgWork.Picture.SaveToFile(out_file);
  end;

  bmp := TBitmap.Create;
  bmp.Width := 42 * 16;
  bmp.Height := 55 * 16;
  bmp.PixelFormat := pf4bit;

  imgWork.Picture.Graphic := bmp;
  imgWork.Picture.Graphic.Palette := StdPaletteB;

  //x_max := 42;
  //y_max := 55; 
  x_st := 0; x_en := 41;
  y_st := 0; y_en := 54;
  for y := y_st to y_en do begin
    for x := x_st to x_en do begin
      a := mapping[y, x].b3 * 2;
      if mapping[y, x].b4 = 128 then begin
        b := 1;
      end
      else begin
        b := 0;
      end;
      idx := a + b;
      //idx := mapping[y, x].b2;
      s := 'x = ' + inttostr(x) + ', ' + 'y = ' + inttostr(y) + chr(13) +
           'mapping[y, x].b3 = ' + inttostr(mapping[y, x].b3) + chr(13) +
           'mapping[y, x].b4 = ' + inttostr(mapping[y, x].b4) + chr(13) +
           'idx = ' + inttostr(idx);
      //showmessage(s);
      CopySprite(imgBase, imgWork, idx, 1, x, y);
    end;
  end;
  //imgWork.Refresh;
  //imgWork.Update;
  {
  out_file := GetCurrentDir + '\' + trim(edtWorkFolder.Text) +
              '\pitch\bmp\' + '#' + trim(edtPitchName.Text) + '_full.bmp';
  if FileExists(out_file) then begin
    res := Application.MessageBox(
          PChar( '''' + out_file + ''' is already exist. Are you sure to overwrite?'),
          PChar( Application.Title ),
          MB_YESNO
    );
    if res = ID_YES then begin
      imgWork.Picture.SaveToFile(out_file);
    end;
  end
  else begin
    imgWork.Picture.SaveToFile(out_file);
  end;
  }
  DrawGridOnWorkImage;
  imgWork.Picture.SaveToFile(out_file);
  bmp.Free;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  frmMain.Caption := Application.Title + ' : All-in-1 Create & Test Package for graphic editing of Amiga SWOS';

  gCurDir := GetCurrentDir;

  //DC_LoadAmigaPalettes;

  //LoadBasePitch;
  //MakeSprites;

  // PANNING-BEGIN
  ScrollBox1.DoubleBuffered := True;
  imgWork.Top := 0;
  ImgWork.Left := 0;

  LX := (imgWork.Width - ScrollBox1.ClientWidth) * -1;
  LY := (imgWork.Height - ScrollBox1.ClientHeight) * -1;
  // PANNING-END

  InitSetup;
  LoadEditorOption;
end;

procedure TfrmMain.MakeSprites;
var
  zz, z : string;
  i, n : integer;
  output_bmp_file : string;
  bmp : TBitmap;
begin
  bmp := TBitmap.Create;
  bmp.Width := 16;
  bmp.Height := 16;
  bmp.PixelFormat := pf4bit;
  imgSprite.Picture.Graphic := bmp;
  imgSprite.Picture.Graphic.Palette := StdPaletteB;

  if      trim(edtPitchName.Text) = 'swcpich1' then begin
    n := 284;
  end
  else if trim(edtPitchName.Text) = 'swcpich2' then begin
    n := 236;
  end
  else if trim(edtPitchName.Text) = 'swcpich3' then begin
    n := 264;
  end
  else if trim(edtPitchName.Text) = 'swcpich4' then begin
    n := 229;
  end
  else if trim(edtPitchName.Text) = 'swcpich5' then begin
    n := 274;
  end;

  for i := 0 to n-1 do begin
    if (i >= 0) and (i < 10) then begin
      zz := '00';
    end
    else if (i >= 10) and ( i < 100) then begin
      zz := '0';
    end
    else begin
      zz := '';
    end;
    z := zz + inttostr(i);

    CopySprite(imgBase, imgSprite, i, 1, 0, 0);
    output_bmp_file := GetCurrentDir + '\' + trim(edtWorkFolder.Text) +
                       '\pitch\bmp\' + '_' + trim(edtPitchName.Text) + '_' + z + '.bmp';
    imgSprite.Picture.SaveToFile(output_bmp_file);
  end;

  bmp.Free;
end;

procedure TfrmMain.btnMakeFullPitchBitmapClick(Sender: TObject);
begin
  LoadBasePitch;
  //MakeSprites;
  GetMapping;
  ShowFullPitch;
end;

procedure TfrmMain.btnMakeFixedAdBoardBitmapClick(Sender: TObject);
var
  i, n : integer;
  bmp : TBitmap;
  size : integer;
  fn : string;
begin
  size := 30;
  bmp := TBitmap.Create;
  bmp.Width := 16 * size;
  bmp.Height := 16;
  bmp.PixelFormat := pf4bit;
  imgAdBoard.Picture.Graphic := bmp;
  imgAdBoard.Picture.Graphic.Palette := StdPaletteB;

  if      trim(edtPitchName.Text) = 'swcpich1' then begin
    n := 0;
  end
  else if trim(edtPitchName.Text) = 'swcpich2' then begin
    n := -3;
  end
  else if trim(edtPitchName.Text) = 'swcpich3' then begin
    n := -2;
  end
  else if trim(edtPitchName.Text) = 'swcpich4' then begin
    n := -5;
  end
  else if trim(edtPitchName.Text) = 'swcpich5' then begin
    n := -1;
  end;
  //for i := 46 + n to 62 + n do begin
  for i := 46 + n to 46 + n + size do begin
    CopySprite(imgBase, imgAdBoard, i, 1, i - (46 + n), 0);
  end;
  bmp.Free;

  fn := GetCurrentDir + '\' + trim(edtWorkFolder.Text) +
        '\pitch\bmp\' + '@' + trim(edtPitchName.Text) + '_adboard.bmp';
  imgAdBoard.Picture.SaveToFile(fn);
end;

procedure TfrmMain.imgWorkMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  // PANNING-BEGIN
  SX := X;  // X start co-ordinate
  SY := Y;  // Y start co-ordinate
  // PANNING-END
end;

procedure TfrmMain.imgWorkMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
  // PANNING-BEGIN
var
  NX: Integer;
  NY: Integer;
begin
  if not (ssLeft in Shift) then
    Exit;

  NX := imgWork.Left + X - SX;
  NY := imgWork.Top + Y - SY;
  if (NX < 0) and (NX > LX) then
    imgWork.Left := NX;
  if (NY < 0) and (NY > LY) then
    imgWork.Top := NY;
  // PANNING-END
end;

procedure TfrmMain.imgWorkMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  //imgWork.Cursor := crDefault;
end;

procedure TfrmMain.btnPCtoAmigaClick(Sender: TObject);
var
  bmp1, bmp2 : TBitmap;
  w, h : integer;
  fn, fn1, fn2 : string;
  LogicalPalettePC : TMaxLogPalette;
  LogicalPaletteAmiga : TMaxLogPalette;
  r, b, g : integer;
  i : integer;
begin
  LoadBasePitch;

  // **
  fn := GetCurrentDir + '\' + trim(edtWorkFolder.Text) +
        '\pc_to_amiga\' + 'pitch1-normal.bmp';
  bmp1 := TBitmap.Create;
  //w := 42 * 16;
  //h := 53 * 16;
  //bmp.Width := w;
  //bmp.Height := h;
  bmp1.LoadFromFile(fn);
  //imgPC.Picture.Graphic := bmp;
  GetPaletteEntries(bmp1.Palette, 0, 256, LogicalPalettePC.palPalEntry);

  // **
  fn := GetCurrentDir + '\' + trim(edtWorkFolder.Text) +
        '\pc_to_amiga\' + 'pitch1-normal-amiga.bmp';
  bmp2 := TBitmap.Create;
  w := 42 * 16;
  h := 53 * 16;
  bmp2.Width := w;
  bmp2.Height := h;
  bmp2.PixelFormat := pf4bit;
  bmp2.Palette := StdPaletteB;
  //bmp2.Canvas.gr := bmp1.Canvas;
  bmp2.SaveToFile(fn);

  bmp2.Free;
  bmp1.Free;

  // **
  {
  fn := GetCurrentDir + '\' + trim(edtWorkFolder.Text) +
        '\pc_to_amiga\' + '#swcpich1_full.bmp';
  bmp := TBitmap.Create;
  //w := 42 * 16;
  //h := 55 * 16;
  //bmp.Width := w;
  //bmp.Height := h;
  bmp.LoadFromFile(fn);
  imgAmiga.Picture.Graphic := bmp;
  GetPaletteEntries(bmp.Palette, 0, 256, LogicalPaletteAmiga.palPalEntry);
  bmp.Free;
  }
  //fn1 := GetCurrentDir + '\' + trim(edtWorkFolder.Text) +
  //      '\pc_to_amiga\' + 'pitch2-normal-amiga1.bmp';
  //imgAmiga1.Picture.SaveToFile(fn1);
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  MakeAmigaMap;
  //ShowFullPitchFromBMP;
  LoadBasePitch;
  ShowFullPitchFromBMP;
  Screen.Cursor := crDefault;
end;

procedure TfrmMain.MakeAmigaMap;
var
  fs : TFileStream;
  fn : string;
  buf_size : integer;
  i, j, k, l, m, n : integer;
  mat, idx : integer;
  buffer : array[0..879, 0..671] of byte;
  bmp : TBitmap;
  c : integer;
  row   :  pByteArray;    // each pixel is a "nibble" (that is, a half byte)

  r, g, b : integer;
  _r, _g, _b : integer;
  cidx : integer;

  j_st, j_en, i_st, i_en, kj, ki, aj, ai : integer;
  p, p2, pr, h80 : integer;
  buffer256 : array[0..255] of byte;
  buffer128 : array[0..127] of byte;
  a1, a2, a3 : byte;

  ms : TMemoryStream;
  mis_match_cnt : integer;
begin
  ms := TMemoryStream.Create;
  ms.Clear;
  LoadBasePitch;

  // Read full pitch bitmap file
  fn := GetCurrentDir + '\' + trim(edtWorkFolder.Text) +
        '\pitch\bmp\' + '#' + trim(edtPitchName.Text) + '_full.bmp';
  bmp := TBitmap.Create;
  bmp.Width := 672;
  bmp.Height := 880;
  bmp.PixelFormat := pf4bit;
  bmp.Palette := StdPaletteB;
  bmp.LoadFromFile(fn);
  GetPaletteEntries(bmp.Palette, 0, 16, LogicalPalette.palPalEntry);

  mis_match_cnt := 0;
  for j := 0 to 879 do begin
    for i := 0 to 671 do begin
      c := bmp.Canvas.Pixels[i, j];
      r := GetRValue(c);
      g := GetGValue(c);
      b := GetBValue(c);

      cidx := -1;
      for k := 0 to 15 do begin
        _r := LogicalPalette.palPalEntry[k].peRed;
        _g := LogicalPalette.palPalEntry[k].peGreen;
        _b := LogicalPalette.palPalEntry[k].peBlue;

        if (r = _r) and (g = _g) and (b = _b) then begin
          //showmessage('matched ' + 'cidx = ' + inttostr(k));
          cidx := k;
          break;
        end;
      end;
      if cidx = -1 then begin
        //showmessage('xi = ' + inttostr(i) + ', ' + 'yj = ' + inttostr(j) + ', cidx = -1');
        inc(mis_match_cnt);
      end;
      buffer[j, i] := cidx;
    end;
  end;
  //ShowMessage('mismatch_cnt = ' + inttostr(mis_match_cnt) + ' of ' + inttostr(880 * 672));
  bmp.free;

  for j := 0 to 54 do begin
    j_st := j * 16;
    j_en := 15 + j * 16;
    for i := 0 to 41 do begin
      i_st := i * 16;
      i_en := 15 + i * 16;

      aj := -1;
      for kj := j_st to j_en do begin
        inc(aj);
        ai := -1;
        for ki := i_st to i_en do begin
          inc(ai);
          pitch_bitmap.bit_map[j, i].bit_array[aj, ai] := buffer[kj, ki];
        end;
      end;

    end;
  end;
  memLog.Lines.Add('Full Pitch Bitmap ' + fn + ' loaded.');

  // Make pitch matrix
  // - Init
  for j := 0 to 54 do begin
    for i := 0 to 41 do begin
      pitch_matrix_byte[j, i] := 0;
      pitch_matrix[j, i].b1 := 0;
      pitch_matrix[j, i].b2 := 0;
      pitch_matrix[j, i].b3 := 0;
      pitch_matrix[j, i].b4 := 0;
    end;
  end;
  pitch_sprite_cnt := 0;
  setlength(pitch_sprite, 0);
  //pitch_sprite := nil;

  // - Make pitch matrix...
  for j := 0 to 54 do begin
    for i := 0 to 41 do begin
      mat := PitchMatrixProcessing(j, i);
      pitch_matrix_byte[j, i] := mat;
      //if (mat < 0) or (mat > 255) then showmessage('aaa');
      //memLog.Lines.Add(inttostr(mat));
    end;
  end;
  memLog.Lines.Add('Pitch Matrix and Sprites of ' + fn + ' generated. (' + inttostr(pitch_sprite_cnt) + ')');

  // Amigarize pitch matrix
  for j := 0 to 54 do begin
    for i := 0 to 41 do begin
      p := pitch_matrix_byte[j, i];
      p2 := p div 2;
      pr := p mod 2;
      if pr = 0 then begin
        h80 := 0;
      end
      else begin
        h80 := 128;
      end;
      pitch_matrix[j, i].b1 := 0;
      pitch_matrix[j, i].b2 := 0;
      pitch_matrix[j, i].b3 := p2;
      pitch_matrix[j, i].b4 := h80;
    end;
  end;
  ms.Write(pitch_matrix, sizeof(pitch_matrix));

  // Amigarize pitch sprite
  for k := 0 to pitch_sprite_cnt - 1 do begin
    _b := -1;
    for j := 0 to 15 do begin
      for i := 0 to 15 do begin
        inc(_b);
        buffer256[_b] := pitch_sprite[k].bit_array[j, i];
      end;
    end;
    //showmessage(inttostr(_b));
    {
    for m := 0 to 127 do begin
      a1 := buffer256[m * 2];
      a2 := buffer256[m * 2 + 1];
      buffer128[m] := a1 * 16 + a2;
    end;
    ms.WriteBuffer(buffer128, 128);
    }
    for i := 0 to 15 do begin
      for j := 0 to 15 do begin
        DC_input_pixel[j] := buffer256[i * 16 + j];
      end;
      DC_MakeWord;
      ms.Write(DC_output_byte, sizeof(DC_output_byte));
    end;
  end;
  ms.SaveToFile('test.raw');

  ms.Free;
end;

procedure TfrmMain.DC_MakeAmigaMap;
var
  fs : TFileStream;
  fn : string;
  buf_size : integer;
  i, j, k, l, m, n : integer;
  mat, idx : integer;
  buffer : array[0..879, 0..671] of byte;
  bmp : TBitmap;
  c : integer;
  row   :  pByteArray;    // each pixel is a "nibble" (that is, a half byte)

  r, g, b : integer;
  _r, _g, _b : integer;
  cidx : integer;

  j_st, j_en, i_st, i_en, kj, ki, aj, ai : integer;
  p, p2, pr, h80 : integer;
  buffer256 : array[0..255] of byte;
  buffer128 : array[0..127] of byte;
  a1, a2, a3 : byte;

  ms : TMemoryStream;
  mis_match_cnt : integer;
  //idx : integer;
  exe, param, _output_filename : string;
  msg : string;
  
  src, tar : string;
begin
  idx := fileInput.ItemIndex;
  DC_input_file := gSetup.FInputFolder + fileInput.Items[idx];
  gSetup.FInputFile := DC_input_file;

  idx := cmbOutputFilename.ItemIndex;
  DC_output_file := gSetup.FOutputFolder + cmbOutputFilename.Items[idx];
  _output_filename := cmbOutputFilename.Items[idx];
  gSetup.FOutputFile := DC_output_file;

  //
  DC_LoadBasePitch;

  // Read full pitch bitmap file
  //fn := GetCurrentDir + '\' + trim(edtWorkFolder.Text) +
  //      '\pitch\bmp\' + '#' + trim(edtPitchName.Text) + '_full.bmp';
  fn := DC_input_file;

  bmp := TBitmap.Create;
  bmp.Width := 672;
  bmp.Height := 880;
  bmp.PixelFormat := pf4bit;
  //bmp.Palette := StdPaletteB;
  bmp.LoadFromFile(fn);
  GetPaletteEntries(bmp.Palette, 0, 16, LogicalPalette.palPalEntry);

  mis_match_cnt := 0;
  for j := 0 to 879 do begin
    for i := 0 to 671 do begin
      c := bmp.Canvas.Pixels[i, j];
      r := GetRValue(c);
      g := GetGValue(c);
      b := GetBValue(c);

      cidx := -1;
      for k := 0 to 15 do begin
        _r := LogicalPalette.palPalEntry[k].peRed;
        _g := LogicalPalette.palPalEntry[k].peGreen;
        _b := LogicalPalette.palPalEntry[k].peBlue;

        if (r = _r) and (g = _g) and (b = _b) then begin
          //showmessage('matched ' + 'cidx = ' + inttostr(k));
          cidx := k;
          break;
        end;
      end;
      if cidx = -1 then begin
        //showmessage('xi = ' + inttostr(i) + ', ' + 'yj = ' + inttostr(j) + ', cidx = -1');
        inc(mis_match_cnt);
      end;
      buffer[j, i] := cidx;
    end;
  end;
  //ShowMessage('mismatch_cnt = ' + inttostr(mis_match_cnt) + ' of ' + inttostr(880 * 672));
  bmp.free;

  for j := 0 to 54 do begin
    j_st := j * 16;
    j_en := 15 + j * 16;
    for i := 0 to 41 do begin
      i_st := i * 16;
      i_en := 15 + i * 16;

      aj := -1;
      for kj := j_st to j_en do begin
        inc(aj);
        ai := -1;
        for ki := i_st to i_en do begin
          inc(ai);
          pitch_bitmap.bit_map[j, i].bit_array[aj, ai] := buffer[kj, ki];
        end;
      end;

    end;
  end;
  memLog.Lines.Add('Full Pitch Bitmap ' + fn + ' loaded.');

  // Make pitch matrix
  // - Init
  for j := 0 to 54 do begin
    for i := 0 to 41 do begin
      pitch_matrix_byte[j, i] := 0;
      pitch_matrix[j, i].b1 := 0;
      pitch_matrix[j, i].b2 := 0;
      pitch_matrix[j, i].b3 := 0;
      pitch_matrix[j, i].b4 := 0;
    end;
  end;
  pitch_sprite_cnt := 0;
  setlength(pitch_sprite, 0);
  //pitch_sprite := nil;

  // - Make pitch matrix...
  for j := 0 to 54 do begin
    for i := 0 to 41 do begin
      mat := DC_PitchMatrixProcessing(j, i);
      pitch_matrix_byte[j, i] := mat;
      //if (mat < 0) or (mat > 255) then showmessage('aaa');
      //memLog.Lines.Add(inttostr(mat));
    end;
  end;
  memLog.Lines.Add('Pitch Matrix and Sprites of ' + fn + ' generated. (' + inttostr(pitch_sprite_cnt) + ')');

  if DC_PitchCheckMode = 'yes' then begin
    if pitch_sprite_cnt <= 284 then begin
      showmessage('Maximum allowed tiles number check: OK!' + chr(13) + 'Number of tiles: ' + inttostr(pitch_sprite_cnt) + chr(13) + 'Number of tiles is less than or equal to 284.');
    end
    else begin
      showmessage('Maximum allowed tiles number check: FAILED!' + chr(13) + 'Number of tiles: ' + inttostr(pitch_sprite_cnt) + chr(13) + 'It should be less than or equal to 284!');
    end;
    exit;
  end;

  // Amigarize pitch matrix
  ms := TMemoryStream.Create;
  ms.Clear;
  for j := 0 to 54 do begin
    for i := 0 to 41 do begin
      p := pitch_matrix_byte[j, i];
      p2 := p div 2;
      pr := p mod 2;
      if pr = 0 then begin
        h80 := 0;
      end
      else begin
        h80 := 128;
      end;
      pitch_matrix[j, i].b1 := 0;
      pitch_matrix[j, i].b2 := 0;
      pitch_matrix[j, i].b3 := p2;
      pitch_matrix[j, i].b4 := h80;
    end;
  end;
  ms.Write(pitch_matrix, sizeof(pitch_matrix));

  // Amigarize pitch sprite
  for k := 0 to pitch_sprite_cnt - 1 do begin
    _b := -1;
    for j := 0 to 15 do begin
      for i := 0 to 15 do begin
        inc(_b);
        buffer256[_b] := pitch_sprite[k].bit_array[j, i];
      end;
    end;
    //showmessage(inttostr(_b));
    {
    for m := 0 to 127 do begin
      a1 := buffer256[m * 2];
      a2 := buffer256[m * 2 + 1];
      buffer128[m] := a1 * 16 + a2;
    end;
    ms.WriteBuffer(buffer128, 128);
    }
    for i := 0 to 15 do begin
      for j := 0 to 15 do begin
        DC_input_pixel[j] := buffer256[i * 16 + j];
      end;
      DC_MakeWord;
      ms.Write(DC_output_byte, sizeof(DC_output_byte));
    end;
  end;
  fn := DC_output_file;
  ms.SaveToFile(fn);
  ms.Free;

  // Packing
  if cmbPackingOption.ItemIndex = 0 then begin
    exe := gCurDir + '\tool\ppibm.exe';
    param := ' p ' + gSetup.FRefOutputFolder + _output_filename;
    RunExeAndWait(exe, param, 0);
  end
  else begin
    src := gSetup.FRefOutputFolder + _output_filename;
    tar := gCurDir + '\tool\temp.dat';
    CopyFile(pchar(src), pchar(tar), false);

    exe := '.\tool\dosbox.exe';
    param := ' -conf .\tool\pack.conf -noconsole';
    RunExeAndWait(exe, param, 1);

    src := gCurDir + '\tool\temp.dat';
    tar := gSetup.FRefOutputFolder + _output_filename;
    CopyFile(pchar(src), pchar(tar), false);

    DeleteFile(gCurDir + '\stdout.txt');
    DeleteFile(gCurDir + '\stderr.txt')
  end;

  //msg := fn + ' created.' + chr(13) + 'Number of tiles: ' + inttostr(pitch_sprite_cnt);
  {
  if pitch_sprite_cnt > 284 then begin
    msg := msg + chr(13) + chr(13) + 'WARNING! Number of tiles exceeds 284. Pitch graphic will be broken or memory error will occur!' +
                                      chr(13) +  'Please reduce the number of tile to maximun 284.';
  end;
  }
  msg := '';
  if pitch_sprite_cnt <= 284 then begin
    msg := msg + 'Maximum allowed tiles number check: OK!' + chr(13) + 'Number of tiles: ' + inttostr(pitch_sprite_cnt) + chr(13) + 'Number of tiles is less than or equal to 284.';
  end
  else begin
    msg := msg + 'Maximum allowed tiles number check: FAILED!' + chr(13) + 'Number of tiles: ' + inttostr(pitch_sprite_cnt) + chr(13) + 'It should be less than or equal to 284!';
  end;
  msg := msg + chr(13) + fn + ' created.';

  Showmessage(msg);
end;

function TfrmMain.PitchMatrixProcessing(zj, zi: integer): integer;
var
  i, j : integer;
  find : boolean;
  a, b : TPitchBitmapItem;
  cnt, find_number : integer;
begin
  a := pitch_bitmap.bit_map[zj, zi];
  find := false;
  //find_number := 255;
  for i := 0 to pitch_sprite_cnt - 1 do begin
    b := pitch_sprite[i];
    if IsSameMatrix(a, b) = True then begin
      find := true;
      find_number := i;
      //if i = 30 then begin
      //  showmessage('30');
      //end;
      break;
    end;
  end;

  //if find_number = 255 then begin
  //  showmessage('Not found: 255');
  //end;

  if find = True then begin
    PitchMatrixProcessing := find_number;
  end
  else begin // New
    inc(pitch_sprite_cnt);
    setlength(pitch_sprite, pitch_sprite_cnt);
    pitch_sprite[pitch_sprite_cnt - 1] := a;
    find_number := pitch_sprite_cnt - 1;
    PitchMatrixProcessing := find_number;
  end;
end;

function TfrmMain.DC_PitchMatrixProcessing(zj, zi: integer): integer;
var
  i, j : integer;
  find : boolean;
  a, b : TPitchBitmapItem;
  cnt, find_number : integer;
begin
  a := pitch_bitmap.bit_map[zj, zi];
  find := false;
  //find_number := 255;
  for i := 0 to pitch_sprite_cnt - 1 do begin
    b := pitch_sprite[i];
    if IsSameMatrix(a, b) = True then begin
      find := true;
      find_number := i;
      //if i = 30 then begin
      //  showmessage('30');
      //end;
      break;
    end;
  end;

  //if find_number = 255 then begin
  //  showmessage('Not found: 255');
  //end;

  if find = True then begin
    DC_PitchMatrixProcessing := find_number;
  end
  else begin // New
    inc(pitch_sprite_cnt);
    setlength(pitch_sprite, pitch_sprite_cnt);
    pitch_sprite[pitch_sprite_cnt - 1] := a;
    find_number := pitch_sprite_cnt - 1;
    DC_PitchMatrixProcessing := find_number;
  end;
end;

function TfrmMain.IsSameMatrix(za, zb: TPitchBitmapItem): boolean;
var
  i, j, cnt : integer;
  ret : boolean;
begin
  ret := false;
  cnt := 0;
  for j := 0 to 15 do begin
    for i := 0 to 15 do begin
      if za.bit_array[j, i] = zb.bit_array[j, i] then begin
        inc(cnt);
      end;
    end;
  end;

  if cnt = 256 then begin
    ret := true;
  end
  else begin
    ret := false;
  end;

  IsSameMatrix := ret;
end;

function TfrmMain.DC_IsSameMatrix(za, zb: TPitchBitmapItem): boolean;
var
  i, j, cnt : integer;
  ret : boolean;
begin
  ret := false;
  cnt := 0;
  for j := 0 to 15 do begin
    for i := 0 to 15 do begin
      if za.bit_array[j, i] = zb.bit_array[j, i] then begin
        inc(cnt);
      end;
    end;
  end;

  if cnt = 256 then begin
    ret := true;
  end
  else begin
    ret := false;
  end;

  DC_IsSameMatrix := ret;
end;

procedure TfrmMain.Button2Click(Sender: TObject);
begin
  //showmessage(DEC2BIN(3, 4));
  //showmessage(DEC2HEX(114));
  Test_DC_MakeWord;
end;

procedure TfrmMain.DC_MakeWord;
var
  i : integer;
  b : string;
begin
  DC_proc_bin := '';
  for i := 0 to 15 do begin
     DC_proc_bin := DC_proc_bin + DEC2BIN(DC_input_pixel[i], 4);
  end;
  //showmessage(DC_proc_bin);

  b := '';
  for i := 0 to 7 do begin
    b := b + copy(DC_proc_bin,  3 + i * 4 + 1, 1);
  end;
  DC_output_byte[0] := BIN2DEC(b);

  b := '';
  for i := 0 to 7 do begin
    b := b + copy(DC_proc_bin, 35 + i * 4 + 1, 1);
  end;
  DC_output_byte[1] := BIN2DEC(b);

  b := '';
  for i := 0 to 7 do begin
    b := b + copy(DC_proc_bin,  2 + i * 4 + 1, 1);
  end;
  DC_output_byte[2] := BIN2DEC(b);

  b := '';
  for i := 0 to 7 do begin
    b := b + copy(DC_proc_bin,  34 + i * 4 + 1, 1);
  end;
  DC_output_byte[3] := BIN2DEC(b);

  b := '';
  for i := 0 to 7 do begin
    b := b + copy(DC_proc_bin, 1 + i * 4 + 1, 1);
  end;
  DC_output_byte[4] := BIN2DEC(b);

  b := '';
  for i := 0 to 7 do begin
    b := b + copy(DC_proc_bin, 33 + i * 4 + 1, 1);
  end;
  DC_output_byte[5] := BIN2DEC(b);

  b := '';
  for i := 0 to 7 do begin
    b := b + copy(DC_proc_bin, 0 + i * 4 + 1, 1);
  end;
  DC_output_byte[6] := BIN2DEC(b);

  b := '';
  for i := 0 to 7 do begin
    b := b + copy(DC_proc_bin, 32 + i * 4 + 1, 1);
  end;
  DC_output_byte[7] := BIN2DEC(b);

  for i := 0 to 7 do begin
    //memLog.Lines.Add( DEC2HEX( DC_output_byte[i] ) );
  end;
end;

procedure TfrmMain.Test_DC_MakeWord;
var
  ms : TMemoryStream;
begin
  DC_input_pixel[0] := 11;
  DC_input_pixel[1] := 4;
  DC_input_pixel[2] := 5;
  DC_input_pixel[3] := 4;
  DC_input_pixel[4] := 11;
  DC_input_pixel[5] := 11;
  DC_input_pixel[6] := 3;
  DC_input_pixel[7] := 4;
  DC_input_pixel[8] := 5;
  DC_input_pixel[9] := 4;
  DC_input_pixel[10] := 3;
  DC_input_pixel[11] := 3;
  DC_input_pixel[12] := 5;
  DC_input_pixel[13] := 6;
  DC_input_pixel[14] := 5;
  DC_input_pixel[15] := 5;

  DC_MakeWord;

  ms := TMemoryStream.Create;
  ms.Clear;
  ms.Write(DC_output_byte, sizeof(DC_output_byte));
  ms.SaveToFile('test.bin');

  ms.Free;

end;

procedure TfrmMain.btnShowSpriteClick(Sender: TObject);
var
  k, i, j, c, m, m1, m2 : integer;
  r, g, b, _r, _g, _b, cc : integer;
begin
  m := strtoint(edtSprNo.Text);
  for j := 0 to 15 do begin
    for i := 0 to 15 do begin
      c := pitch_sprite[m].bit_array[j, i];
      r := LogicalPalette.palPalEntry[c].peRed;
      g := LogicalPalette.palPalEntry[c].peGreen;
      b := LogicalPalette.palPalEntry[c].peBlue;
      cc := RGB(r, g, b);
      imgSpriteTest.Canvas.Pixels[i, j] := cc;
    end;
  end;


  //imgSpriteTest2.Picture.Bitmap := imgSpriteTest.Picture.Bitmap;
end;

procedure TfrmMain.btnSaveAllSprClick(Sender: TObject);
var
  k, i, j, c, m, m1, m2 : integer;
  r, g, b, _r, _g, _b, cc : integer;
  z, fn : string;
  bmp : TBitmap;
begin
  bmp := TBitmap.Create;
  bmp.Width := 16;
  bmp.Height := 16;
  bmp.PixelFormat := pf4bit;
  bmp.Palette := StdPaletteB;

  for m := 0 to pitch_sprite_cnt - 1 do begin
    for j := 0 to 15 do begin
      for i := 0 to 15 do begin
        c := pitch_sprite[m].bit_array[j, i];
        r := LogicalPalette.palPalEntry[c].peRed;
        g := LogicalPalette.palPalEntry[c].peGreen;
        b := LogicalPalette.palPalEntry[c].peBlue;
        cc := RGB(r, g, b);
        //bmp.Canvas.Pixels[i, j] := cc;
        imgSpriteTest.Canvas.Pixels[i, j] := cc;
      end;
    end;
    if m < 10 then begin
      z := '00';
    end
    else if m < 100 then begin
      z := '0';
    end
    else begin
      z := '';
    end;
    //imgSpriteTest.Picture.Graphic.Palette := StdPaletteB;
    //imgSpriteTest.Picture.Graphic := bmp;
    //imgSpriteTest.Picture.Graphic.Palette := StdPaletteB;
    fn := GetCurrentDir + '\sprite_test\' + z + trim(inttostr(m)) + '.bmp';
    imgSpriteTest.Picture.SaveToFile(fn);
  end;

  bmp.Free;
end;

procedure TfrmMain.ShowFullPitchFromBMP;
var
  k, i, j, c, m, m1, m2 : integer;
  r, g, b, _r, _g, _b, cc : integer;
  z, fn : string;
  bmp : TBitmap;
  p : integer;
begin
  LoadBasePitch;

  bmp := TBitmap.Create;
  bmp.Width := 16 * 42;
  bmp.Height := 16 * 55;
  bmp.PixelFormat := pf4bit;
  bmp.Palette := StdPaletteB;
  imgWork.Picture.Bitmap.Palette := StdPaletteB;
  imgWork.Picture.Graphic := nil;
  for j := 0 to 54 do begin
    for i := 0 to 41 do begin
      p := pitch_matrix_byte[j, i];
      for m1 := 0 to 15 do begin
        for m2 := 0 to 15 do begin
          c := pitch_sprite[p].bit_array[m1, m2];
          r := LogicalPalette.palPalEntry[c].peRed;
          g := LogicalPalette.palPalEntry[c].peGreen;
          b := LogicalPalette.palPalEntry[c].peBlue;
          cc := RGB(r, g, b);
          bmp.Canvas.Pixels[m2 + i * 16, m1 + j * 16] := cc;
        end;
      end;
    end;
  end;
  imgWork.Picture.Graphic := bmp;
  DrawGridOnWorkImage;

  fn := GetCurrentDir + '\test.bmp';
  imgWork.Picture.SaveToFile(fn);
  bmp.Free;
end;

procedure TfrmMain.btnReconstructClick(Sender: TObject);
begin
  LoadBasePitch;
  ShowFullPitchFromBMP;
end;

procedure TfrmMain.DrawGridOnWorkImage;
var
  x1, y1, x2, y2 : integer;
  c : TColor;
  i, j : integer;
begin
  if chkGridView.Checked = false then exit;

  //exit;
  c := clBlack;
  With imgWork.Canvas do begin
    for i := 0 to 42 do begin
      x1 := i * 16; y1 := 0;
      x2 := i * 16; y2 := 55 * 16;
      Pen.Color := c;
      MoveTo(x1, y1);
      LineTo(x2, y2);
    end;

    for i := 0 to 55 do begin
      x1 := 0;       y1 := i * 16;
      x2 := 42 * 16; y2 := i * 16;
      Pen.Color := c;
      MoveTo(x1, y1);
      LineTo(x2, y2);
    end;
  end;
end;

procedure TfrmMain.btnConvertClick(Sender: TObject);
var
  res : integer;
  exe, param : string;
  rom_file, fn1, fn2, msg : string;
  fp : textfile;
begin
  res := Application.MessageBox(
    PChar( 'Are you sure to start converting? Please check all settings out again.' + chr(13) + 'Previous Output Files will be overwritten.' ),
    PChar( Application.Title ),
    MB_YESNO
  );
  if res <> ID_YES then begin
    exit;
  end;

  Screen.Cursor := crHourGlass;
  gSetup.FGraphicType := cmbGraphicType.ItemIndex;
  if gSetup.FGraphicType = 0 then begin
    DC_PitchCheckMode := 'no';
    DC_MakeAmigaMap;
  end
  else if gSetup.FGraphicType = 1 then begin
    DC_MakeAmigaRaw;
  end
  else if gSetup.FGraphicType = 2 then begin
    DC_MakeAmigaRaw;
  end
  else if gSetup.FGraphicType = 3 then begin
    DC_MakeAmigaRaw_New;
  end
  else if gSetup.FGraphicType = 4 then begin
    DC_MakeAmigaRaw;
  end
  else if gSetup.FGraphicType = 5 then begin
    DC_MakeAmigaRaw;
  end
  else if gSetup.FGraphicType = 6 then begin
    DC_MakeAmigaRaw;
  end
  else if gSetup.FGraphicType = 7 then begin
    DC_MakeAmigaRaw;
  end
  else if gSetup.FGraphicType = 8 then begin
    DC_MakeAmigaRaw;
  end
  else if gSetup.FGraphicType = 9 then begin
    DC_MakeAmigaRaw;
  end;
  Screen.Cursor := crDefault;

  {
  frmCopyOutputToWinUAE.ShowModal;
  if dlg_res = 'ok' then begin
    if gSetup.FGraphicType = 0 then begin
      if DC_PitchCheckMode = 'no' then begin
        CopyOutputToWinUAE;
      end;
    end
    else begin
      CopyOutputToWinUAE;
    end;
  end;
  }

  // If pitch_sprite_cnt failed, test aborted
  if pitch_sprite_cnt > 284 then begin
    showmessage('Test via WinUAE aborted.');
    exit;
  end;

  //  WinUAE run param check
  // ' -f .\configurations\swos_hdf_file.uae -s gfx_width=672 -s gfx_height=544
  //   -s gfx_filter=null -s gfx_filter_mode=1x -s win32.statusbar=normal
  //   -s cachesize=8192 -s sound_output=exact -s gfx_api=directdraw
  //   -s sound_filter_type=enhanced -s collision_level=playfields
  //   -s floppy_speed=800 -s use_gui=no -s finegrain_cpu_speed=512'

  // Test or No Query
  res := Application.MessageBox(
    PChar( 'Are you sure to test ''' + cmbOutputFilename.Items[ cmbOutputFilename.ItemIndex ] + ''' via WinUAE?' ),
    PChar( Application.Title ),
    MB_YESNO
  );
  if res <> ID_YES then begin
    exit;
  end;

  // Kick Start Rom Check
  rom_file := 'Kickstart 3.1 (40.069) (A1200) (Commodore) (1993).rom';
  fn1 := gCurDir + '\test\Roms\' + rom_file;
  fn2 := gCurDir + '\tool\kick_rom.checked';
  if FileExists(fn1) = false then begin
    Showmessage('Kickstart rom file: ''' + rom_file + ''' not found. Test aborted.');
    exit;
  end
  else begin
    if FileExists(fn2) = false then begin
      msg := '''' + rom_file + ''' found.' + chr(13);
      msg := msg + 'Do you have permission to use this kickstart rom file?';
      res := Application.MessageBox(
        PChar( msg ),
        PChar( Application.Title ),
        MB_YESNO
      );
      if res <> ID_YES then begin
        exit;
      end
      else begin
        assignfile(fp, fn2);
        rewrite(fp);
        writeln(fp, 'checked');
        closefile(fp);
      end;
    end;
  end;

  // Copy Output File(s) to Test Folder
  CopyOutputToWinUAEForTest;

  // Run Test
  SetCurrentDir(gCurDir + '\test\');

  exe := 'winuae161.exe';
  param := '';
  param := param + ' -f .\configurations\swos_hdf_file.uae -s gfx_width=672 -s gfx_height=544';
  param := param + ' -s gfx_filter=null -s gfx_filter_mode=1x -s win32.statusbar=normal';
  param := param + ' -s cachesize=8192 -s sound_output=exact -s gfx_api=directdraw';
  param := param + ' -s sound_filter_type=enhanced -s collision_level=playfields';
  param := param + ' -s floppy_speed=800 -s use_gui=no -s finegrain_cpu_speed=512';

  RunExeAndWait(exe, param, 1);

  SetCurrentDir(gCurDir);
end;

procedure TfrmMain.fileInputClick(Sender: TObject);
begin
  UI_ShowPitchBitmap;
end;

procedure TfrmMain.UI_ShowPitchBitmap;
var
  i, j, idx : integer;
  c : byte;
  fn : string;
  rad : integer;

  bmp, bmp2 : TBitmap;
  pal : HPALETTE;

  palset : TMaxLogPalette;

  //ColorTable: PRGBQuadArray;
  buffer : array[0..63] of byte;
  buf_size : integer;
  src, tar, pal_file : string;

  fs : TFileStream;
begin
  idx := fileInput.ItemIndex;
  if idx < 0 then begin
    //showmessage('There is no Input bitmap file in input folder.');
    exit;
  end;
  buf_size := 64;

  //DC_LoadBasePitch;
//
{
  bmp.PixelFormat := pf4bit;
  bmp.LoadFromFile(base_bmp_file);
  imgBase.Picture.Graphic := bmp;
  StdPaletteB := bmp.Palette;
}
//
  {
  if radNormal.Checked then begin
    rad := 0; pal := AmigaPal_Normal;
  end
  else if radSoft.Checked then begin
    rad := 1; pal := AmigaPal_Soft;
  end
  else if radHard.Checked then begin
    rad := 2; pal := AmigaPal_Hard;
  end
  else if radDry.Checked then begin
    rad := 3; pal := AmigaPal_Dry;
  end
  else if radWet.Checked then begin
    rad := 4; pal := AmigaPal_Wet;
  end;

  for i := 0 to 15 do begin
    palset.palPalEntry[i].peRed   := AmigaPalettes[rad].palPalEntry[i].peRed;
    palset.palPalEntry[i].peGreen := AmigaPalettes[rad].palPalEntry[i].peGreen;
    palset.palPalEntry[i].peBlue  := AmigaPalettes[rad].palPalEntry[i].peBlue;
    //palset.palPalEntry[i].peFlags := PC_EXPLICIT;
  end;
  }
  //showmessage(inttostr(rad));
{
  bmp.PixelFormat := pf4bit;
  bmp.LoadFromFile(base_bmp_file);
  imgBase.Picture.Graphic := bmp;
  StdPaletteB := bmp.Palette;

  bmp.Palette := StdPaletteB;
  bmp.LoadFromFile(fn);
}
  bmp := TBitmap.Create;
  bmp.PixelFormat := pf4bit;

  fn := gSetup.FInputFolder + fileInput.Items[idx];
  src := fn;
  tar := gCurDir + '\' + '_temp.bmp';
  CopyFile(pchar(src), pchar(tar), false);

  if radNormal.Checked then begin
    pal_file := 'normal.bmp';
  end
  else if radSoft.Checked then begin
    pal_file := 'soft.bmp';
  end
  else if radHard.Checked then begin
    pal_file := 'hard.bmp';
  end
  else if radDry.Checked then begin
    pal_file := 'dry.bmp';
  end
  else if radWet.Checked then begin
    pal_file := 'wet.bmp';
  end
  else if radFrozen.Checked then begin
    pal_file := 'frozen.bmp';
  end
  else if radMuddy.Checked then begin
    pal_file := 'muddy.bmp';
  end;
  pal_file := gCurDir + '\' + 'palette\' + pal_file;

  if gSetup.FGraphicType = 0 then begin
    // Read palette from palette file
    fs := TFileStream.Create(pal_file, fmOpenReadWrite);
    fs.Seek(54, soFromBeginning);
    fs.Read(buffer, buf_size);
    //fs.Read(mapping, buf_size);
    fs.Free;

    // Write palette to target file
    fs := TFileStream.Create(tar, fmOpenReadWrite);
    fs.Seek(54, soFromBeginning);
    fs.Write(buffer, buf_size);
    //fs.Read(mapping, buf_size);
    fs.Free;
  end;

  bmp.LoadFromFile(tar);

  if gSetup.FGraphicType = 0 then begin
    CopyFile(pchar(tar), pchar(src), false);
  end;
  {
  for j := 0 to 879 do begin
    for i := 0 to 671 do begin
      c := bmp.Canvas.Pixels[i, j];
      buffer[j, i] := c;
    end;
  end;
  }
  //SetPaletteEntries(bmp.Palette, 0, 16, palset.palPalEntry);
  //bmp.PaletteModified := True;
  //bmp.Palette := pal;

  //imgWork.Picture.Graphic := bmp;
  //imgWork.Picture.Bitmap.PixelFormat := pf4bit;
  imgWork.Picture.Bitmap := bmp;
  DrawGridOnWorkImage;
  //imgWork.Picture.Bitmap.Palette := pal;
//SetDIBColorTable(imgWork.Picture.Bitmap.Canvas.Handle, 0, 16, palset.palPalEntry);
  //SetPaletteEntries(imgWork.Picture.Bitmap.Palette, 0, 15, palset.palPalEntry);
  //imgWork.Picture.Graphic.PaletteModified := True;
  {
  for j := 0 to 879 do begin
    for i := 0 to 671 do begin
      imgWork.Picture.Bitmap.Canvas.Pixels[i, j] := clRed; //buffer[j, i];
    end;
  end;
  }
  //imgWork.Picture.Graphic.PaletteModified := True;
  //imgWork.Picture.Bitmap.Palette := pal;

  //imgWork.Picture.Bitmap.Palette := pal;

  //imgWork.Picture.Graphic.Palette := pal;

  {
  fn := gSetup.FInputFolder + fileInput.Items[idx];
  imgWork.Picture.LoadFromFile(fn);
  imgWork.Picture.Graphic.Palette := AmigaPal[rad];
  }

  //bmp2.Free;
  bmp.Free;
end;

procedure TfrmMain.btnOpenOutputFolderClick(Sender: TObject);
var
  path : string;
begin
  path := gSetup.FOutputFolder;

  ShellExecute(
      0, 'explore',
      pchar(path),
      NIL,
      NIL,
      SW_SHOWNORMAL
  );
end;

procedure TfrmMain.btnUpdateFileListClick(Sender: TObject);
begin
  fileInput.Update;
  fileInput.Refresh;
  fileInput.ItemIndex := 0;
  UI_ShowPitchBitmap;  
end;

procedure TfrmMain.btnEditBMPClick(Sender: TObject);
var
  exe, param : string;
  i, n, idx : integer;
  fn : string;
begin
  idx := fileInput.ItemIndex;
  if idx < 0 then exit;

  exe := edt_path + edt_filename;
  param := ' ' + gSetup.FInputFolder + fileInput.Items[idx];
  fn :=  fileInput.Items[idx];

  RunExeAndWait(exe, param, 1);
  btnUpdateFileListClick(nil);

  fileInput.ItemIndex := idx;
  UI_ShowPitchBitmap;

  //n := fileInput.Count;
  //for i := 0 to n - 1 do begin

end;

procedure TfrmMain.btnDeleteFileClick(Sender: TObject);
var
  res, idx : integer;
  fn : string;
begin
  idx := fileInput.ItemIndex;
  if idx < 0 then exit;

  fn := gSetup.FInputFolder + fileInput.Items[idx];

  res := Application.MessageBox(
    PChar( 'Are you sure to delete ''' + fileInput.Items[idx] + '''?'),
    PChar( Application.Title ),
    MB_YESNO
  );
  if res = ID_YES then begin
    DeleteFile(fn);
    btnUpdateFileListClick(nil);
  end;
end;

procedure TfrmMain.btnAboutClick(Sender: TObject);
var
  msg : string;
begin
  msg := Application.Title + ' : All-in-1 Create && Test Package for graphic editing of Amiga SWOS' + chr(13) +
         'Written by starwindz' + chr(13) +
         'Special thanks to EreWeGo && Hungry Horace (Alphabetic order)';
  showmessage(msg);
end;

procedure TfrmMain.InitSetup;
var
  _plat, _plat_r, _gt : string;
  rg : boolean;
begin
  gSetup.FPlatform := cmbPlatform.ItemIndex;
  gSetup.FGraphicType := cmbGraphicType.ItemIndex;

  if gSetup.FPlatform = 0 then begin
    _plat   := gCurDir + '\' + 'AMIGA\';
    _plat_r := '.\' + 'AMIGA\';
  end;

  if gSetup.FGraphicType = 0 then begin
    _gt := 'PITCH\';
  end
  else if gSetup.FGraphicType = 1 then begin
    _gt := 'GOALNET\';
  end
  else if gSetup.FGraphicType = 2 then begin
    _gt := 'ADBOARD\';
  end
  else if gSetup.FGraphicType = 3 then begin
    _gt := 'MAIN_TIT\';
  end
  else if gSetup.FGraphicType = 4 then begin
    _gt := 'MENU_TIT\';
  end
  else if gSetup.FGraphicType = 5 then begin
    _gt := 'COACHREF\';
  end
  else if gSetup.FGraphicType = 6 then begin
    _gt := 'TEAM1\';
  end
  else if gSetup.FGraphicType = 7 then begin
    _gt := 'TEAM2\';
  end
  else if gSetup.FGraphicType = 8 then begin
    _gt := 'TEAM3\';
  end
  else if gSetup.FGraphicType = 9 then begin
    _gt := 'TEAMG\';
  end;

  gSetup.FInputFolder := _plat + _gt + 'INPUT\';
  gSetup.FOutputFolder := _plat + _gt + 'OUTPUT\';
  gSetup.FRefOutputFolder := _plat_r + _gt + 'OUTPUT\';

  fileInput.Mask := gSetup.FInputFolder + '*.bmp';
  fileInput.Update;

  cmbOutputFilename.Clear;
  if gSetup.FGraphicType = 0 then begin
    cmbOutputFilename.Items.Add('SWCPICH1.MAP');
    cmbOutputFilename.Items.Add('SWCPICH2.MAP');
    cmbOutputFilename.Items.Add('SWCPICH3.MAP');
    cmbOutputFilename.Items.Add('SWCPICH4.MAP');
    cmbOutputFilename.Items.Add('SWCPICH5.MAP');
    btnChkNumTiles.Enabled := True;
    rgColorStyleView.Enabled := True;
    rg := True;
  end
  else if gSetup.FGraphicType = 1 then begin
    cmbOutputFilename.Items.Add('CJCBITS.RAW');
    btnChkNumTiles.Enabled := False;
    rgColorStyleView.Enabled := True;
    rg := False;
  end
  else if gSetup.FGraphicType = 2 then begin
    cmbOutputFilename.Items.Add('CJCGRAFS.RAW');
    btnChkNumTiles.Enabled := False;
    rgColorStyleView.Enabled := True;
    rg := False;
  end
  else if gSetup.FGraphicType = 3 then begin
    cmbOutputFilename.Items.Add('LOADER1.RAW');
    btnChkNumTiles.Enabled := False;
    rgColorStyleView.Enabled := False;
    rg := False;
  end
  else if gSetup.FGraphicType = 4 then begin
    cmbOutputFilename.Items.Add('MENUS2.RAW');
    btnChkNumTiles.Enabled := False;
    rgColorStyleView.Enabled := True;
    rg := False;
  end
  else if gSetup.FGraphicType = 5 then begin
    cmbOutputFilename.Items.Add('CJCBENCH.RAW');
    btnChkNumTiles.Enabled := False;
    rgColorStyleView.Enabled := True;
    rg := False;
  end
  else if gSetup.FGraphicType = 6 then begin
    cmbOutputFilename.Items.Add('CJCTEAM1.RAW');
    btnChkNumTiles.Enabled := False;
    rgColorStyleView.Enabled := True;
    rg := False;
  end
  else if gSetup.FGraphicType = 7 then begin
    cmbOutputFilename.Items.Add('CJCTEAM2.RAW');
    btnChkNumTiles.Enabled := False;
    rgColorStyleView.Enabled := True;
    rg := False;
  end
  else if gSetup.FGraphicType = 8 then begin
    cmbOutputFilename.Items.Add('CJCTEAM3.RAW');
    btnChkNumTiles.Enabled := False;
    rgColorStyleView.Enabled := True;
    rg := False;
  end
  else if gSetup.FGraphicType = 9 then begin
    cmbOutputFilename.Items.Add('CJCTEAMG.RAW');
    btnChkNumTiles.Enabled := False;
    rgColorStyleView.Enabled := True;
    rg := False;
  end;
  radNormal.Enabled := rg;
  radSoft.Enabled := rg;
  radHard.Enabled := rg;
  radDry.Enabled := rg;
  radWet.Enabled := rg;
  radFrozen.Enabled := rg;
  radMuddy.Enabled := rg;

  cmbOutputFilename.ItemIndex := 0;

  //LoadOption;

  fileInput.ItemIndex := 0;
  UI_ShowPitchBitmap;
end;

procedure TfrmMain.btnOpenInputFolderClick(Sender: TObject);
var
  path : string;
begin
  path := gSetup.FInputFolder;

  ShellExecute(
      0, 'explore',
      pchar(path),
      NIL,
      NIL,
      SW_SHOWNORMAL
  );
end;

procedure TfrmMain.cmdOpenOutputFolderClick(Sender: TObject);
var
  path : string;
begin
  path := gSetup.FOutputFolder;

  ShellExecute(
      0, 'explore',
      pchar(path),
      NIL,
      NIL,
      SW_SHOWNORMAL
  );
end;

procedure TfrmMain.LoadOption;
var
  fp : textfile;
  fn : string;
  s : string;
begin
  fn := gCurDir + '\' + 'option.ini';

  if FileExists(fn) = false then begin
    gSetup.FVirtualGrafFolder := '.\';
    gSetup.FCopyToAllPitch := 0;
    SaveOption;
    exit;
  end;

  assignfile(fp, fn);
  reset(fp);

  readln(fp, s); gSetup.FVirtualGrafFolder := s;
  readln(fp, s); gSetup.FCopyToAllPitch := strtoint(s);

  closefile(fp);
end;

procedure TfrmMain.SaveOption;
var
  fp : textfile;
  fn : string;
  s : string;
begin
  fn := gCurDir + '\' + 'option.ini';
  assignfile(fp, fn);
  rewrite(fp);

  s := gSetup.FVirtualGrafFolder; writeln(fp, s);
  s := inttostr(gSetup.FCopyToAllPitch); writeln(fp, s);

  closefile(fp);
end;

procedure TfrmMain.btnCopyOutputToWinUAEClick(Sender: TObject);
begin
  frmCopyOutputToWinUAE.ShowModal;
  if dlg_res = 'ok' then begin
    CopyOutputToWinUAE;
  end;
end;

procedure TfrmMain.fileInputChange(Sender: TObject);
begin
  try
  UI_ShowPitchBitmap;
  except
  end;
end;

procedure TfrmMain.CopyOutputToWinUAE;
var
  src_f : string;
  tar_f : array[0..4] of string;
  src, tar : string;
  i, n : integer;
begin
  src_f := gSetup.FOutputFile;

  if gSetup.FGraphicType = 0 then begin
    if gSetup.FCopyToAllPitch = 0 then begin
      n := 1;
      tar_f[0] := cmbOutputFilename.Items[ cmbOutputFilename.itemindex ];
    end
    else begin
      n := 5;
      for i := 0 to n - 1 do begin
        tar_f[i] := cmbOutputFilename.Items[i];
      end;
    end;
  end
  else begin
    n := 1;
    tar_f[0] := cmbOutputFilename.Items[ cmbOutputFilename.itemindex ];
  end;

  for i := 0 to n - 1 do begin
    src := src_f;
    tar := gSetup.FVirtualGrafFolder + tar_f[i];
    CopyFile(pchar(src), pchar(tar), false);
  end;
  //ShowMessage(src + ' has been to copied to Amiga virtual hard disk folder');

end;

procedure TfrmMain.CopyOutputToWinUAEForTest;
var
  src_f : string;
  tar_f : array[0..4] of string;
  src, tar : string;
  i, n : integer;
  _folder : string;
begin
  src_f := gSetup.FOutputFile;
  gSetup.FCopyToAllPitch := 1;
  if gSetup.FGraphicType = 0 then begin
    if gSetup.FCopyToAllPitch = 0 then begin
      n := 1;
      tar_f[0] := cmbOutputFilename.Items[ cmbOutputFilename.itemindex ];
    end
    else begin
      n := 5;
      for i := 0 to n - 1 do begin
        tar_f[i] := cmbOutputFilename.Items[i];
      end;
    end;
  end
  else begin
    n := 1;
    tar_f[0] := cmbOutputFilename.Items[ cmbOutputFilename.itemindex ];
  end;

  _folder := '.\test\CUSTOM\#GAME_IMAGE\grafs\';
  for i := 0 to n - 1 do begin
    src := src_f;
    tar := _folder + tar_f[i];
    CopyFile(pchar(src), pchar(tar), false);
  end;
end;

procedure TfrmMain.cmbGraphicTypeChange(Sender: TObject);
begin
  InitSetup;
end;

procedure TfrmMain.btnQuitClick(Sender: TObject);
begin
  DeleteFile(gCurDir + '\_temp.bmp');
  Halt;
end;

procedure TfrmMain.DC_MakeAmigaRaw_Old;
var
  fs : TFileStream;
  fn : string;
  buf_size : integer;
  i, j, k, l, m, n : integer;
  mat, idx : integer;
  buffer : array[0..255, 0..319] of byte;
  bmp : TBitmap;
  c : integer;
  row   :  pByteArray;    // each pixel is a "nibble" (that is, a half byte)

  r, g, b : integer;
  _r, _g, _b : integer;
  cidx : integer;

  j_st, j_en, i_st, i_en, kj, ki, aj, ai : integer;
  p, p2, pr, h80 : integer;
  buffer256 : array[0..255] of byte;
  buffer128 : array[0..127] of byte;
  a1, a2, a3 : byte;

  ms : TMemoryStream;
  mis_match_cnt : integer;
  //idx : integer;
  exe, param, _output_filename : string;
  msg : string;

  bpp : array[0..3] of string;
  bin40 : array[0..39] of string;
  array40 : array[0..39] of byte;
  bin : string;
  x, y : integer;
  _temp : integer;
begin
  idx := fileInput.ItemIndex;
  DC_input_file := gSetup.FInputFolder + fileInput.Items[idx];
  gSetup.FInputFile := DC_input_file;

  idx := cmbOutputFilename.ItemIndex;
  DC_output_file := gSetup.FOutputFolder + cmbOutputFilename.Items[idx];
  _output_filename := cmbOutputFilename.Items[idx];
  gSetup.FOutputFile := DC_output_file;

  // Load Base Palette
  DC_LoadBasePaletteForRaw;

  // Read full input bitmap file
  fn := DC_input_file;

  bmp := TBitmap.Create;
  bmp.Width := 320;
  bmp.Height := 256;
  bmp.PixelFormat := pf4bit;
  //bmp.Palette := StdPaletteB;
  bmp.LoadFromFile(fn);
  GetPaletteEntries(bmp.Palette, 0, 16, LogicalPalette.palPalEntry);

  mis_match_cnt := 0;
  for j := 0 to 255 do begin
    for i := 0 to 319 do begin
      c := bmp.Canvas.Pixels[i, j];
      r := GetRValue(c);
      g := GetGValue(c);
      b := GetBValue(c);

      cidx := -1;
      for k := 0 to 15 do begin
        _r := LogicalPalette.palPalEntry[k].peRed;
        _g := LogicalPalette.palPalEntry[k].peGreen;
        _b := LogicalPalette.palPalEntry[k].peBlue;

        if (r = _r) and (g = _g) and (b = _b) then begin
          //showmessage('matched ' + 'cidx = ' + inttostr(k));
          cidx := k;
          break;
        end;
      end;
      if cidx = -1 then begin
        //showmessage('xi = ' + inttostr(i) + ', ' + 'yj = ' + inttostr(j) + ', cidx = -1');
        inc(mis_match_cnt);
      end;
      buffer[j, i] := cidx;
    end;
  end;
  //ShowMessage('mismatch_cnt = ' + inttostr(mis_match_cnt) + ' of ' + inttostr(880 * 672));
  bmp.free;

  // Create memory
  ms := TMemoryStream.Create;
  ms.Clear;

  // Amigarize pitch sprite
  {
  for j := 0 to 255 do begin
    bin := '';
    for i := 0 to 319 do begin
      bin := bin + dec2bin(buffer[j, i], 4);
    end;

    for b := 0 to 3 do begin
      bpp[b] := '';
      for i := 0 to 319 do begin
        bpp[b] := bpp[b] + copy(bin, b + i * 4 + 1, 1);
      end;
    end;

    for b := 0 to 3 do begin
      for x := 0 to 39 do begin
        bin40[x] := '';
        for y := 0 to 7 do begin
          bin40[x] := bin40[x] + copy(bpp[b], y + x * 8 + 1, 1);
        end;
      end;
      for x := 0 to 39 do begin
        array40[x] := bin2dec(bin40[x]);
      end;
      ms.write(array40, 40);
    end;
  end;
  }
  for k := 0 to 255 do begin
    for i := 0 to 19 do begin
      for j := 0 to 15 do begin
        DC_input_pixel[j] := buffer[k, j + i * 16];
      end;
      DC_MakeWord;
      ms.Write(DC_output_byte, sizeof(DC_output_byte));
    end;
  end;

  fn := DC_output_file;
  ms.SaveToFile(fn);
  ms.Free;

  exit;

  // Packing
  exe := gCurDir + '\tool\ppibm.exe';
  param := ' p ' + gSetup.FRefOutputFolder + _output_filename;
  RunExeAndWait(exe, param, 0);

  msg := fn + ' created.';
  // + chr(13) + 'Number of tiles: ' + inttostr(pitch_sprite_cnt);
  //if pitch_sprite_cnt > 284 then begin
  //  msg := msg + chr(13) + chr(13) + 'WARNING! Number of tiles exceeds 284. Pitch graphic will be broken or memory error will occur!' + chr(13) +  'Please reduce the number of tile to maximun 284.';
  //end;

  Showmessage(msg);
end;

//
procedure TfrmMain.DC_MakeAmigaRaw;
var
  fs : TFileStream;
  fn : string;
  buf_size : integer;
  i, j, k, l, m, n : integer;
  mat, idx : integer;
  buffer : array[0..255, 0..319] of byte;
  bmp : TBitmap;
  c : integer;
  row   :  pByteArray;    // each pixel is a "nibble" (that is, a half byte)

  r, g, b : integer;
  _r, _g, _b : integer;
  cidx : integer;

  j_st, j_en, i_st, i_en, kj, ki, aj, ai : integer;
  p, p2, pr, h80 : integer;
  buffer256 : array[0..255] of byte;
  buffer128 : array[0..127] of byte;
  a1, a2, a3 : byte;

  ms : TMemoryStream;
  mis_match_cnt : integer;
  //idx : integer;
  exe, param, _output_filename : string;
  msg : string;

  bpp : array[0..3] of string;
  bin40 : array[0..39] of string;
  array40 : array[0..39] of byte;
  bin : string;
  x, y : integer;
  _temp : integer;

  src, tar : string;
begin
  idx := fileInput.ItemIndex;
  DC_input_file := gSetup.FInputFolder + fileInput.Items[idx];
  gSetup.FInputFile := DC_input_file;

  idx := cmbOutputFilename.ItemIndex;
  DC_output_file := gSetup.FOutputFolder + cmbOutputFilename.Items[idx];
  _output_filename := cmbOutputFilename.Items[idx];
  gSetup.FOutputFile := DC_output_file;

  // Load Base Palette
  DC_LoadBasePaletteForRaw;

  // Read full input bitmap file
  fn := DC_input_file;

  bmp := TBitmap.Create;
  bmp.Width := 320;
  bmp.Height := 256;
  bmp.PixelFormat := pf4bit;
  bmp.Palette := StdPaletteB;
  bmp.LoadFromFile(fn);
  GetPaletteEntries(bmp.Palette, 0, 16, LogicalPalette.palPalEntry);

  mis_match_cnt := 0;
  for j := 0 to 255 do begin
    for i := 0 to 319 do begin
      c := bmp.Canvas.Pixels[i, j];
      r := GetRValue(c);
      g := GetGValue(c);
      b := GetBValue(c);

      cidx := -1;
      for k := 0 to 15 do begin
        _r := LogicalPalette.palPalEntry[k].peRed;
        _g := LogicalPalette.palPalEntry[k].peGreen;
        _b := LogicalPalette.palPalEntry[k].peBlue;

        if (r = _r) and (g = _g) and (b = _b) then begin
          //showmessage('matched ' + 'cidx = ' + inttostr(k));
          cidx := k;
          break;
        end;
      end;
      if cidx = -1 then begin
        //showmessage('xi = ' + inttostr(i) + ', ' + 'yj = ' + inttostr(j) + ', cidx = -1');
        inc(mis_match_cnt);
      end;
      buffer[j, i] := cidx;
    end;
  end;
  //ShowMessage('mismatch_cnt = ' + inttostr(mis_match_cnt) + ' of ' + inttostr(880 * 672));
  bmp.free;

  // Create memory
  ms := TMemoryStream.Create;
  ms.Clear;

  // Amigarize pitch sprite
  for j := 0 to 255 do begin
    bin := '';
    for i := 0 to 319 do begin
      bin := bin + dec2bin(buffer[j, i], 4);
    end;

    for b := 0 to 3 do begin
      bpp[b] := '';
      for i := 0 to 319 do begin
        bpp[b] := bpp[b] + copy(bin, 3 - b + i * 4 + 1, 1);
      end;
    end;

    for b := 0 to 3 do begin
      for x := 0 to 39 do begin
        bin40[x] := '';
        for y := 0 to 7 do begin
          bin40[x] := bin40[x] + copy(bpp[b], y + x * 8 + 1, 1);
        end;
      end;
      for x := 0 to 39 do begin
        array40[x] := bin2dec(bin40[x]);
      end;
      ms.write(array40, sizeof(array40));
    end;
  end;

  fn := DC_output_file;
  ms.SaveToFile(fn);
  ms.Free;

  //exit;

  // Packing
  if cmbPackingOption.ItemIndex = 0 then begin
    exe := gCurDir + '\tool\ppibm.exe';
    param := ' p ' + gSetup.FRefOutputFolder + _output_filename;
    RunExeAndWait(exe, param, 0);
  end
  else begin
    src := gSetup.FRefOutputFolder + _output_filename;
    tar := gCurDir + '\tool\temp.dat';
    CopyFile(pchar(src), pchar(tar), false);

    exe := '.\tool\dosbox.exe';
    param := ' -conf .\tool\pack.conf -noconsole';
    RunExeAndWait(exe, param, 1);

    src := gCurDir + '\tool\temp.dat';
    tar := gSetup.FRefOutputFolder + _output_filename;
    CopyFile(pchar(src), pchar(tar), false);

    DeleteFile(gCurDir + '\stdout.txt');
    DeleteFile(gCurDir + '\stderr.txt')
  end;

  msg := fn + ' created.';
  // + chr(13) + 'Number of tiles: ' + inttostr(pitch_sprite_cnt);
  //if pitch_sprite_cnt > 284 then begin
  //  msg := msg + chr(13) + chr(13) + 'WARNING! Number of tiles exceeds 284. Pitch graphic will be broken or memory error will occur!' + chr(13) +  'Please reduce the number of tile to maximun 284.';
  //end;

  Showmessage(msg);
end;

procedure TfrmMain.DC_MakeAmigaRaw_New;
var
  fs : TFileStream;
  fn : string;
  buf_size : integer;
  i, j, k, l, m, n : integer;
  mat, idx : integer;
  buffer : array[0..272-1, 0..352-1] of byte;
  bmp : TBitmap;
  c : integer;
  row   :  pByteArray;    // each pixel is a "nibble" (that is, a half byte)

  r, g, b : integer;
  _r, _g, _b : integer;
  cidx : integer;

  j_st, j_en, i_st, i_en, kj, ki, aj, ai : integer;
  p, p2, pr, h80 : integer;
  buffer256 : array[0..255] of byte;
  buffer128 : array[0..127] of byte;
  a1, a2, a3 : byte;

  ms : TMemoryStream;
  mis_match_cnt : integer;
  //idx : integer;
  exe, param, _output_filename : string;
  msg : string;

  bpp : array[0..3] of string;
  bin40 : array[0..39] of string;
  array40 : array[0..39] of byte;
  bin44 : array[0..44-1] of string;
  array44 : array[0..44-1] of byte;
  bin : string;
  x, y : integer;
  _temp : integer;

  src, tar : string;
begin
  for j := 0 to 272-1 do begin
    for i := 0 to 352-1 do begin
      buffer[j, i] := 0;
    end;
  end;

  idx := fileInput.ItemIndex;
  DC_input_file := gSetup.FInputFolder + fileInput.Items[idx];
  gSetup.FInputFile := DC_input_file;

  idx := cmbOutputFilename.ItemIndex;
  DC_output_file := gSetup.FOutputFolder + cmbOutputFilename.Items[idx];
  _output_filename := cmbOutputFilename.Items[idx];
  gSetup.FOutputFile := DC_output_file;

  // Load Base Palette
  DC_LoadBasePaletteForRaw;

  // Read full input bitmap file
  fn := DC_input_file;

  bmp := TBitmap.Create;
  bmp.Width := 345;
  bmp.Height := 272;
  bmp.PixelFormat := pf4bit;
  bmp.Palette := StdPaletteB;
  bmp.LoadFromFile(fn);
  GetPaletteEntries(bmp.Palette, 0, 16, LogicalPalette.palPalEntry);

  mis_match_cnt := 0;
  for j := 0 to 272-1 do begin
    for i := 0 to 345-1 do begin
      c := bmp.Canvas.Pixels[i, j];
      r := GetRValue(c);
      g := GetGValue(c);
      b := GetBValue(c);

      cidx := -1;
      for k := 0 to 15 do begin
        _r := LogicalPalette.palPalEntry[k].peRed;
        _g := LogicalPalette.palPalEntry[k].peGreen;
        _b := LogicalPalette.palPalEntry[k].peBlue;

        if (r = _r) and (g = _g) and (b = _b) then begin
          //showmessage('matched ' + 'cidx = ' + inttostr(k));
          cidx := k;
          break;
        end;
      end;
      if cidx = -1 then begin
        //showmessage('xi = ' + inttostr(i) + ', ' + 'yj = ' + inttostr(j) + ', cidx = -1');
        inc(mis_match_cnt);
      end;
      buffer[j, i] := cidx;
    end;
  end;
  //ShowMessage('mismatch_cnt = ' + inttostr(mis_match_cnt) + ' of ' + inttostr(880 * 672));
  bmp.free;

  // Create memory
  ms := TMemoryStream.Create;
  ms.Clear;

  // Amigarize pitch sprite
  for j := 0 to 272-1 do begin
    bin := '';
    for i := 0 to 352-1 do begin
      bin := bin + dec2bin(buffer[j, i], 4);
    end;

    for b := 0 to 3 do begin
      bpp[b] := '';
      for i := 0 to 352-1 do begin
        bpp[b] := bpp[b] + copy(bin, 3 - b + i * 4 + 1, 1);
      end;
    end;

    for b := 0 to 3 do begin
      for x := 0 to 44-1 do begin
        bin44[x] := '';
        for y := 0 to 7 do begin
          bin44[x] := bin44[x] + copy(bpp[b], y + x * 8 + 1, 1);
        end;
      end;
      for x := 0 to 44-1 do begin
        array44[x] := bin2dec(bin44[x]);
      end;
      ms.write(array44, sizeof(array44));
    end;
  end;

  fn := DC_output_file;
  ms.SaveToFile(fn);
  ms.Free;

  //exit;

  // Packing
  if cmbPackingOption.ItemIndex = 0 then begin
    exe := gCurDir + '\tool\ppibm.exe';
    param := ' p ' + gSetup.FRefOutputFolder + _output_filename;
    RunExeAndWait(exe, param, 0);
  end
  else begin
    src := gSetup.FRefOutputFolder + _output_filename;
    tar := gCurDir + '\tool\temp.dat';
    CopyFile(pchar(src), pchar(tar), false);

    exe := '.\tool\dosbox.exe';
    param := ' -conf .\tool\pack.conf -noconsole';
    RunExeAndWait(exe, param, 1);

    src := gCurDir + '\tool\temp.dat';
    tar := gSetup.FRefOutputFolder + _output_filename;
    CopyFile(pchar(src), pchar(tar), false);

    DeleteFile(gCurDir + '\stdout.txt');
    DeleteFile(gCurDir + '\stderr.txt')
  end;

  msg := fn + ' created.';
  // + chr(13) + 'Number of tiles: ' + inttostr(pitch_sprite_cnt);
  //if pitch_sprite_cnt > 284 then begin
  //  msg := msg + chr(13) + chr(13) + 'WARNING! Number of tiles exceeds 284. Pitch graphic will be broken or memory error will occur!' + chr(13) +  'Please reduce the number of tile to maximun 284.';
  //end;

  Showmessage(msg);
end;

procedure TfrmMain.DC_LoadBasePaletteForRaw;
var
  base_bmp_file : string;
  bmp : TBitmap;
  //h : HP
begin
  bmp := TBitmap.Create;

  base_bmp_file := DC_input_file;
  bmp.PixelFormat := pf4bit;
  bmp.LoadFromFile(base_bmp_file);
  imgBase.Picture.Graphic := bmp;
  StdPaletteB := bmp.Palette;

  bmp.Free;
  //memLog.Lines.Add('Base Pitch File ' + base_bmp_file + ' loaded.')
end;

procedure TfrmMain.DC_LoadAmigaPalettes;
var
  base_bmp_file : string;
  bmp : TBitmap;
  //h : HP
begin
  bmp := TBitmap.Create;
  base_bmp_file := GetCurrentDir + '\' + 'amiga_pal_normal.dat';
  //base_bmp_file := GetCurrentDir + '\' + 'base_palette.dat';
  bmp.PixelFormat := pf4bit;
  bmp.LoadFromFile(base_bmp_file);
  AmigaPal_Normal := bmp.Palette;
  GetPaletteEntries(bmp.Palette, 0, 16, AmigaPalettes[0].palPalEntry);
  bmp.Free;

  bmp := TBitmap.Create;
  base_bmp_file := GetCurrentDir + '\' + 'amiga_pal_soft.dat';
  bmp.PixelFormat := pf4bit;
  bmp.LoadFromFile(base_bmp_file);
  AmigaPal_Soft := bmp.Palette;
  GetPaletteEntries(bmp.Palette, 0, 16, AmigaPalettes[1].palPalEntry);
  bmp.Free;

  bmp := TBitmap.Create;
  base_bmp_file := GetCurrentDir + '\' + 'amiga_pal_hard.dat';
  bmp.PixelFormat := pf4bit;
  bmp.LoadFromFile(base_bmp_file);
  AmigaPal_Hard := bmp.Palette;
  GetPaletteEntries(bmp.Palette, 0, 16, AmigaPalettes[2].palPalEntry);
  bmp.Free;

  bmp := TBitmap.Create;
  base_bmp_file := GetCurrentDir + '\' + 'amiga_pal_dry.dat';
  bmp.PixelFormat := pf4bit;
  bmp.LoadFromFile(base_bmp_file);
  AmigaPal_Dry := bmp.Palette;
  GetPaletteEntries(bmp.Palette, 0, 16, AmigaPalettes[3].palPalEntry);
  bmp.Free;

  bmp := TBitmap.Create;
  base_bmp_file := GetCurrentDir + '\' + 'amiga_pal_wet.dat';
  bmp.PixelFormat := pf4bit;
  bmp.LoadFromFile(base_bmp_file);
  AmigaPal_Wet := bmp.Palette;
  GetPaletteEntries(bmp.Palette, 0, 16, AmigaPalettes[4].palPalEntry);
  bmp.Free;
end;

procedure TfrmMain.radNormalClick(Sender: TObject);
begin
  UI_ShowPitchBitmap;
end;

procedure TfrmMain.radSoftClick(Sender: TObject);
begin
  UI_ShowPitchBitmap;
end;

procedure TfrmMain.radHardClick(Sender: TObject);
begin
  UI_ShowPitchBitmap;
end;

procedure TfrmMain.radDryClick(Sender: TObject);
begin
  UI_ShowPitchBitmap;
end;

procedure TfrmMain.radWetClick(Sender: TObject);
begin
  UI_ShowPitchBitmap;
end;

procedure TfrmMain.radFrozenClick(Sender: TObject);
begin
  UI_ShowPitchBitmap;
end;

procedure TfrmMain.radMuddyClick(Sender: TObject);
begin
  UI_ShowPitchBitmap;
end;

procedure TfrmMain.chkGridViewClick(Sender: TObject);
begin
  UI_ShowPitchBitmap;
end;

procedure TfrmMain.LoadEditorOption;
var
  fp : textfile;
  fn : string;
begin
  fn := gCurDir + '\' + 'editor.ini';
  if FileExists(fn) = false then begin
    edt_path := '.\tool\';
    edt_filename := 'mspaint_xp.exe';
    SaveEditorOption;
    exit;
  end;

  assignfile(fp, fn);
  reset(fp, fn);

  readln(fp, edt_path);
  readln(fp, edt_filename);

  closefile(fp);
end;

procedure TfrmMain.SaveEditorOption;
var
  fp : textfile;
  fn : string;
begin
  fn := gCurDir + '\' + 'editor.ini';
  assignfile(fp, fn);
  rewrite(fp, fn);

  writeln(fp, edt_path);
  writeln(fp, edt_filename);

  closefile(fp);
end;

procedure TfrmMain.btnEditorOptionClick(Sender: TObject);
begin
  frmSetImageEditor.ShowModal;
end;

procedure TfrmMain.btnChkNumTilesClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  DC_PitchCheckMode := 'yes';
  DC_MakeAmigaMap;
  Screen.Cursor := crDefault;
end;

procedure TfrmMain.btnVisitForumClick(Sender: TObject);
begin
  ShellExecute(
      0, 'open',
      pchar('http://www.sensiblesoccer.info/forum/index.php?topic=21289.0'),
      pchar(''),
      NIL,
      SW_SHOW
  );
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  DeleteFile(gCurDir + '\_temp.bmp');
end;

end.



