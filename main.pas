unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Grids, {EditBtn,} fyLib, Types;

type

  { TFMain }

  TFMain = class(TForm)
    BScrReset: TButton;
    BtnSerStart: TButton;
    BWaveLoad: TButton;
    BScrRun: TButton;
    BScrLoad: TButton;
    BScrSave: TButton;
    BScrStep: TButton;
    BScrPause: TButton;
    ComboBoxSerPort: TComboBox;
    EScriptFile: TEdit;
    EStepTime: TEdit;
    GBScriptFile: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    LblConnect: TLabel;
    LStep: TLabel;
    LStepTime: TLabel;

   OpenDialog1: TOpenDialog;
   SaveDialog1: TSaveDialog;
   PageControl1: TPageControl;
   SGScript: TStringGrid;

   TabSheet1: TTabSheet;   //control
     GBCh1: TGroupBox;
      CBWaveform1: TComboBox;
      EAmp1: TEdit;
      EOfs1: TEdit;
      EPulseWidth: TEdit;
      CBTScale: TComboBox;
      EFreq1: TEdit;
      CBFscale1: TComboBox;
      EDC1: TEdit;
      LAmp1: TLabel;
      LFreq1: TLabel;
      LOfs1: TLabel;
      LDutyCycle1: TLabel;
      LWaveform1: TLabel;

     GBCh2: TGroupBox;
      CBWaveform2: TComboBox;
      EAmp2: TEdit;
      EOfs2: TEdit;
      EFreq2: TEdit;
      CBFscale2: TComboBox;
      EDC2: TEdit;
      EPhz: TEdit;
      LAmp2: TLabel;
      LFreq2: TLabel;
      LOfs2: TLabel;
      LPhz: TLabel;
      LDutyCycle2: TLabel;
      LWaveform2: TLabel;

      GBSweep: TGroupBox;
      BSweepPause: TButton;
      BSweepStart: TButton;
      CBMode: TComboBox;
      CBStartFreq: TComboBox;
      CBStopFreq: TComboBox;
      EStartFreq: TEdit;
      EStopFreq: TEdit;
      ESweepTIme: TEdit;
      LMode: TLabel;
      LStartFreq: TLabel;
      LStopFreq: TLabel;
      LSweepTime1: TLabel;

     GBTrigger: TGroupBox;
      CBTrigSource: TComboBox;
      ETrigCycles: TEdit;
      LCount: TLabel;
      LTrigSource: TLabel;


     GBCounter: TGroupBox;
      BCtrClr: TButton;
      BCtrExtCnt: TButton;
      BCtrExtF: TButton;
      BCtrCh1F: TButton;
      ECounter: TEdit;

     GBSaveLoad: TGroupBox;
      PM0: TPanel;
      PM1: TPanel;
      PM10: TPanel;
      PM11: TPanel;
      PM12: TPanel;
      PM13: TPanel;
      PM14: TPanel;
      PM15: TPanel;
      PM16: TPanel;
      PM17: TPanel;
      PM18: TPanel;
      PM19: TPanel;
      PM2: TPanel;
      PM3: TPanel;
      PM4: TPanel;
      PM5: TPanel;
      PM6: TPanel;
      PM7: TPanel;
      PM8: TPanel;
      PM9: TPanel;
      PMF: TPanel;


   TabSheet2: TTabSheet; //ARB Wave
    RGMemory: TRadioGroup;
    GBFileSelect: TGroupBox;
     EARBFile: TEdit;
    BArbRun: TButton;
    SGArb: TStringGrid;

   TabSheet3: TTabSheet; //script

     Label2: TLabel;
     Timer1: TTimer;
     TreeView1: TTreeView;

    procedure BArbStoreClick(Sender: TObject);
    procedure BCtrClrClick(Sender: TObject);
    procedure BCtrExtCntClick(Sender: TObject);
    procedure BCtrExtFClick(Sender: TObject);
    procedure BCtrCh1FClick(Sender: TObject);
    procedure BScrLoadClick(Sender: TObject);
    procedure BScrPauseClick(Sender: TObject);
    procedure BScrResetClick(Sender: TObject);
    procedure BScrRunClick(Sender: TObject);
    procedure BScrSaveClick(Sender: TObject);
    procedure BScrStepClick(Sender: TObject);
    procedure BtnSerStartClick(Sender: TObject);
    procedure BWaveLoadClick(Sender: TObject);
    procedure ComboBoxSerPortChange(Sender: TObject);
    procedure EFreq1Change(Sender: TObject);

    procedure EFreq1MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);

    procedure EFreq2MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);

     procedure EAmp1MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
     procedure EOfs1MouseWheel(Sender: TObject; Shift: TShiftState;
       WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);


    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);

    procedure CBWaveform1Change(Sender: TObject);
    procedure EFreq1KeyPress(Sender: TObject; var Key: char);
    procedure CBFscale1Change(Sender: TObject);
    procedure EAmp1KeyPress(Sender: TObject; var Key: char);
    procedure EDC1KeyPress(Sender: TObject; var Key: char);
    procedure EOfs1KeyPress(Sender: TObject; var Key: char);
    procedure EPhzKeyPress(Sender: TObject; var Key: char);

    procedure BSweepPauseClick(Sender: TObject);
    procedure BSweepStartClick(Sender: TObject);
    procedure CBModeChange(Sender: TObject);
    procedure ESweepTImeKeyPress(Sender: TObject; var Key: char);

    procedure CBTrigSourceChange(Sender: TObject);
    procedure ETrigCyclesKeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
    procedure GBCh1Click(Sender: TObject);
    procedure GBCh2Click(Sender: TObject);

    procedure HandlePWChange(Sender: TObject);
    procedure EPulseWidthKeyPress(Sender: TObject; var Key: char);
    procedure LOfs1Click(Sender: TObject);
    procedure LOfs2Click(Sender: TObject);

    procedure PM0Click(Sender: TObject);
    {Handles all instrument memory load/save actions.}
    procedure PMFClick(Sender: TObject);
    {Handles load/save instrument state from PC disk file.}

    procedure Timer1Timer(Sender: TObject);


  private
    { private declarations }
    procedure HandleFChange(ChannelTag: integer);
    procedure UpdateDisplayState(M: integer);
  public
    { public declarations }

  end;

var
  FMain: TFMain;
  sRangeError: shortstring = ' out of range!';

  SStep: integer = 1;  //Current script step

  ScaleIndex1: integer = 1;  // by JG current ScaleIndex (0=Hz..2=MHz)


const
  sNEXTSTEP = 'Next Step: ';

implementation

{ TFMain }

procedure TFMain.FormCreate(Sender: TObject);
var i: integer;
begin
  UpdateDisplayState(0);
  SGArb.Cells[0,0] := 'x';
  SGArb.Cells[1,0] := 'Y';
  for i := 1 to 2048 do SGArb.Cells[0,i] := IntToStr(i);
  SGArb.AutoSizeColumn(0);
  SGScript.Cells[0,0] := 'Line';
  SGScript.Cells[1,0] := 'Instruction';
  for i := 1 to 500 do SGScript.Cells[0,i] := IntToStr(i);
  SGScript.AutoSizeColumn(0);
  SaveDialog1.InitialDir := GetCurrentDir;
  OpenDialog1.InitialDir := GetCurrentDir;
end;

procedure TFMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction := caFree
end;

procedure TFMain.FormShow(Sender: TObject);
var S: string;
{The instrument returns a line-feed terminated model type string if one
 is connected to /dev/ttyUSBx, otherwise response times out.}
begin
 if bTTYPortvalid then
 begin
  FMain.BtnSerStart.Enabled := false;
 end
 else begin
   ShowMessage('Ser-Port ' + sTTYPort + ' not valid');
   FMain.BtnSerStart.Enabled := true;
   Exit;    { by JG }
 end;
 S := SendWithResponse('a');
 if S = '' then
  begin
   ShowMessage('FY32XXS not connected to ' + sTTYPort);
    FMain.BtnSerStart.Enabled := true;
   Exit;    { by JG }
  end
 else
 begin
     FMain.LblConnect.Caption := 'connected';
     FMain.LblConnect.Color := clMoneyGreen;
  end;

   S[length(S)] := ' ';
   FMain.Caption := S + 'Control'
end;

procedure TFMain.GBCh1Click(Sender: TObject);
begin

end;

procedure TFMain.GBCh2Click(Sender: TObject);
begin

end;


{============================================================================
 Handle Waveform Changes
=============================================================================}
procedure TFMain.CBWaveform1Change(Sender: TObject);
begin
  if  TComboBox(Sender).tag = 0 then
   begin
    WaveformSet(CH1,CBWaveform1.ItemIndex);

    // by JG  disable/enable ununsed controls
    if (CBWaveform1.ItemIndex = 1) then
      EDC1.Enabled := true
    else begin
      EDC1.Enabled := false;
    end;

    if (CBWaveform1.ItemIndex = 2) then
    begin
       EPulseWidth.Enabled := true;
       CBTScale.Enabled  := true;
    end
    else begin
       EPulseWidth.Enabled := false;
       CBTScale.Enabled  := false;
    end;
  end
  else begin
    WaveformSet(CH2,CBWaveform2.ItemIndex);
  end;
end;

{============================================================================
 Handle Frequency Changes
=============================================================================}
procedure TFMain.HandleFChange(ChannelTag: integer);
Var F: double;
    sF: shortstring;
    Channel: TChannels;
    Scale: integer;
begin
 case ChannelTag of
  0: begin sF := EFreq1.text; Channel := CH1; Scale := CBFScale1.ItemIndex end;
  1: begin sF := EFreq2.Text; Channel := CH2; Scale := CBFScale2.ItemIndex end;
  2: begin sF := EStartFreq.Text; Channel := STARTF; Scale := CBStartFreq.ItemIndex end;
  3: begin sF := EStopFreq.Text;  Channel := STOPF; Scale := CBStopFreq.ItemIndex end;
 end; {case}
 F := StrToFloat(sF);
 case Scale of
  1: F := F*1e3;
  2: F := F*1e6;
 end; {case}
 if not(FrequencySet(Channel,F)) then SHowMessage('Frequency'+sRangeError);
end;

procedure TFMain.CBFscale1Change(Sender: TObject);
var F: double;
begin
 F :=  StrToFloat(EFreq1.text);
 case CBFScale1.ItemIndex of
  0: if (ScaleIndex1=1) then F:= F*1000;
  1: begin
   if (ScaleIndex1=2) then F:= F*1000;
   if (ScaleIndex1=0)  then F:= F/1000;
  end;
  2: if (ScaleIndex1=1)  then F:= F/1000;
 end;
 EFreq1.Text := FloatToStr(F);
 HandleFChange(TComboBox(Sender).tag);
 ScaleIndex1 := CBFScale1.ItemIndex;
end;

procedure TFMain.EFreq1KeyPress(Sender: TObject; var Key: char);
begin
 if (Key = #13) then  HandleFChange(TEdit(Sender).tag);
end;
procedure TFMain.EFreq1Change(Sender: TObject);
begin
  // do nothing by JG
end;

// by JG: mouse wheel support for Amp CH1
procedure TFMain.EAmp1MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);

var A : double;
    fac : double;
    pos : integer;
    len : integer;
    s   : string;
begin
    pos :=  EAmp1.SelStart;
    s :=  EAmp1.Text;
    len := s.Length;

    A := StrToFloat(EAmp1.text);
    if ((len-pos) = 0)
    then begin
      fac := 0.01;
    end
    else if ((len-pos) =1) then begin
      fac := 0.1;
    end
     else begin
       fac := 1;
     end;

    if (WheelDelta > 0) and (A < 20)then begin
    A := A + fac;
    end
    else begin
      if (A > 0.01) then
       A:= A-fac;
    end;

    if (A <= 0) then A:= 0.01;

    EAmp1.Text := FloatToStrF(A,ffFixed,10,2);
    EAmp1.SelStart := pos;
    if not(AmplitudeSet(CH1,A)) then ShowMessage('Amplitude: '+sRangeError);
end;

// by JG mouse wheel support for  Offest CH1
procedure TFMain.EOfs1MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);

var A : double;
    fac : double;
    pos : integer;
    len : integer;
    s   : string;
begin
    pos :=  EOfs1.SelStart;
    s :=  EOfs1.Text;
    len := s.Length;

    A := StrToFloat(EOfs1.text);
    if ((len-pos) = 0)
    then begin
      fac := 0.01;
    end
    else if ((len-pos) =1) then begin
      fac := 0.1;
    end
     else begin
       fac := 1;
     end;

    if (WheelDelta > 0)and (A < 10) then begin
      A := A + fac;
    end
    else if (WheelDelta < 0) and (A > -10) then begin
       A:= A-fac;
    end;

    EOfs1.Text := FloatToStrF(A,ffFixed,10,2);
    EOfs1.SelStart := pos;
    if not(OffsetSet(CH1,A)) then ShowMessage('Offset: '+sRangeError);

end;


// by JG mouse wheel support for Freq. CH1
procedure TFMain.EFreq1MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);

var F : double;
    fac : integer;
    pos : integer;
    s : string;
    lenNew, lenOld : integer;
begin
    pos :=  FMain.EFreq1.SelStart;

    s := EFreq1.Text;
    lenOld := s.Length;
    F := StrToFloat(EFreq1.text);
    fac := 1;

    if F >= 100000 then
    begin
      case pos of
       1 : fac := 100000;
       2 : fac := 10000;
       3 : fac := 1000;
       4 : fac := 100;
       5 : fac := 10;
      end;
    end
    else
    if F >= 10000 then
    begin
      case pos of
       1 : fac := 10000;
       2 : fac := 1000;
       3 : fac := 100;
       4 : fac := 10;
      end;
    end
    else
    if F >= 1000 then
    begin
      case pos of
       1 : fac := 1000;
       2 : fac := 100;
       3 : fac := 10;
      end;
    end
    else
    if F >= 100 then
    begin
      case pos of
       1 : fac := 100;
       2 : fac := 10;
      end;
    end
    else
    if f >= 10 then
    begin
     case pos of
       0 : fac := 10;
       1 : fac := 10;
     end;
    end;

    if (WheelDelta > 0) then begin
    F := F + fac;
    end
    else begin
      if (F >1) then
       F:= F-fac;
    end;

    if (F < 0) then F:=1;
    EFreq1.Text := FloatToStr(F);
    s := EFreq1.Text;
    lenNew := s.Length;

    if (lenOld < lenNew) and (pos <= 6) then
     EFreq1.SelStart := pos +1
    else
    if (lenOld > lenNew) and (pos >= 1)  then
     EFreq1.SelStart := pos-1
    else
     EFreq1.SelStart := pos;
    HandleFChange(TEdit(Sender).tag);
end;

// by JG
procedure TFMain.EFreq2MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
    // todo by JG
end;


{============================================================================
 Handle Pulse-Width Changes
=============================================================================}
procedure TFMain.HandlePWChange(Sender: TObject);
var PW: double;
begin
 PW := StrToFloat(EPulseWidth.Text);
 {Convert to nS}
 Case CBTScale.ItemIndex of
  1: PW := PW*1e3;
  2: PW := PW*1e6;
  3: PW := PW*1e9;
 end;
 if not(PulseWidthSet(PW)) then SHowMessage('Pulse width'+sRangeError);
end;

procedure TFMain.EPulseWidthKeyPress(Sender: TObject; var Key: char);
begin
 if (Key = #13) then  HandlePWChange(self);
end;

procedure TFMain.LOfs1Click(Sender: TObject);
begin

end;

procedure TFMain.LOfs2Click(Sender: TObject);
begin

end;

{============================================================================
 Handle Amplitude Changes
=============================================================================}
procedure TFMain.EAmp1KeyPress(Sender: TObject; var Key: char);
var A: double;
    sA: shortstring;
    Channel: TChannels;
begin
 if (Key = #13) then
  begin
   if TEdit(Sender).tag = 0 then
     begin sA := EAmp1.text; Channel := CH1 end
   else
     begin sA := EAmp2.Text; Channel := CH2 end;
   A := StrToFloat(sA);
   if not(AmplitudeSet(Channel,A)) then ShowMessage('Amplitude'+sRangeError);
  end;
end;

{============================================================================
 Handle Offsete Changes
=============================================================================}
procedure TFMain.EOfs1KeyPress(Sender: TObject; var Key: char);
var Ofs: double;
    sOfs: shortstring;
    Channel: TChannels;
begin
 if (Key = #13) then
  begin
   if TEdit(Sender).tag = 0 then
     begin sOfs := EOfs1.text; Channel := CH1 end
   else
     begin sOfs := EOfs2.Text; Channel := CH2 end;
   Ofs := StrToFloat(sOfs);
   if not(OffsetSet(Channel,Ofs)) then ShowMessage('Offset'+sRangeError);
  end;
end;


{============================================================================
 Handle Duty Cycle Changes
=============================================================================}
procedure TFMain.EDC1KeyPress(Sender: TObject; var Key: char);
var DC: double;
    sDC: shortstring;
    Channel: TChannels;
begin
 if (Key = #13) then
  begin
   if TEdit(Sender).tag = 0 then
     begin sDC := EDC1.text; Channel := CH1 end
   else
     begin sDC := EDC2.Text; Channel := CH2 end;
   DC := StrToFloat(sDC);
   if not(DutyCycleSet(Channel,DC)) then ShowMessage('Duty cycle'+sRangeError);
  end;
end;

{============================================================================
 Handle Phase Changes
=============================================================================}
procedure TFMain.EPhzKeyPress(Sender: TObject; var Key: char);
var Phz: integer;
    sPhz: shortstring;
begin
 if (Key = #13) then
  begin
   sPhz := EPhz.text;
   Phz := StrToInt(sPhz);
   if not(PhaseSet(Phz)) then ShowMessage('Phase'+sRangeError);
  end;
end;

{============================================================================
 Handle Sweep Changes
=============================================================================}
procedure TFMain.ESweepTImeKeyPress(Sender: TObject; var Key: char);
var SwpTime: integer;
    sSwpTime: shortstring;
begin
 if (Key = #13) then
  begin
   sSwpTime := ESweepTIme.text;
   SwpTime :=  StrToInt(sSwpTime);
   if not(SweepTimeSet(SwpTime)) then ShowMessage('Sweep time'+sRangeError);
  end;
end;

procedure TFMain.CBModeChange(Sender: TObject);
begin
 if not(SweepModeSet(TComboBox(Sender).ItemIndex)) then ShowMessage('Sweep mode'+sRangeError);
end;

procedure TFMain.BSweepStartClick(Sender: TObject);
begin
  StartSweep
end;

procedure TFMain.BSweepPauseClick(Sender: TObject);
begin
  PauseSweep
end;

{============================================================================
 Handle Trigger Changes
=============================================================================}
procedure TFMain.CBTrigSourceChange(Sender: TObject);
begin
 if not(TriggerSourceSet(TComboBox(Sender).ItemIndex)) then ShowMessage('Trigger mode'+sRangeError);
end;

procedure TFMain.ETrigCyclesKeyPress(Sender: TObject; var Key: char);
var Count: integer;
    sCount: shortstring;
begin
 if (Key = #13) then
  begin
   sCount := ETrigCycles.text;
   Count  :=  StrToInt(sCount);
   if not(TrigCountSet(Count)) then ShowMessage('Trig cycles'+sRangeError);
   CBTrigSource.ItemIndex := 0;
  end;
end;


{============================================================================
 Handle Save/Load/Update System State
=============================================================================}
procedure TFMain.UpdateDisplayState(M: integer);
{Update the Control Tab GUI to represent the current instrument control state.}

  function DisplayFreq(F: double): shortstring;
  begin
   If (F >= 1e6) then
    begin Scale := 2; {MHz}; result := FloatToStrF(F/1e6,ffFixed,10,8) end
   else
   if (F >= 1e3) then
    begin Scale := 1; {KHz}; result := FloatToStrF(F/1e3,ffFixed,10,5) end
   else
    begin Scale := 0; {Hz}; result := FloatToStrF(F,ffFixed,10,2) end


  end;

begin
 if (M <20) then LoadState(M);
  {If not, assume CState has been filled from a disk file.}
 CBWaveForm1.ItemIndex := CState.C1Wave;
 EAmp1.Text := FloatToStrF(CState.C1Amp,ffFixed,6,2);
 EOfs1.Text := FloatToStrF(CState.C1Ofs,ffFixed,6,2);
 EFreq1.Text := DisplayFreq(CState.C1freq);
 CBFScale1.ItemIndex := scale;
 ScaleIndex1 := scale;
 EDC1.Text  := FloatToStrF(CState.C1Duty,ffFixed,6,2);

 CBWaveForm2.ItemIndex := CState.C2Wave;
 EAmp2.Text := FloatToStrF(CState.C2Amp,ffFixed,6,2);
 EOfs2.Text := FloatToStrF(CState.C2Ofs,ffFixed,6,2);
 EFreq2.Text := DisplayFreq(CState.C2freq);
 CBFScale2.ItemIndex := scale;
 EDC2.Text  := FloatToStrF(CState.C2Duty,ffFixed,6,2);
 EPhz.Text  := IntToStr(CState.C2Phase);

 CBMode.ItemIndex := CState.SweepMode;
 SweepModeSet(CState.SweepMode);
 Sleep(10);
 ESweepTime.Text := IntToStr(CState.SweepTime);
 SweepTimeSet(CState.SweepTime);
 Sleep(10);
 EStartFreq.Text := DisplayFreq(CState.SwStartF);
 FrequencySet(StartF, CState.SwStartF);
 Sleep(10);
 EStopFreq.Text  := DisplayFreq(CState.SwStopF);
 FrequencySet(StopF, CState.SwStopF);
 Sleep(10);
 CBTrigSource.ItemIndex := CState.TrigSource;
 TriggerSourceSet(CState.TrigSource);
 Sleep(10);
 ETrigCycles.Text := IntToStr(CState.TrigCount);
 TrigCountSet(CState.TrigCount);

 EPulseWidth.Text := IntToStr(trunc(CState.PulseWidth));
 CBTScale.ItemIndex := 0;
 PulseWidthSet(CState.PulseWidth);
end;
procedure TFMain.PM0Click(Sender: TObject);
{Click to load, shift+click to save.}
var M: integer;
    ShiftState: TShiftState;
begin
  ShiftState:=GetKeyShiftState;
  M := TPanel(Sender).tag;
  TPanel(Sender).Color := clLime;
  Application.processmessages;
  if ssShift in ShiftState then
   {-------- Save an instrument state -------}
   begin
    if (M > 19) then
     {Save to a disk file.}
     begin
      if SaveDialog1.Execute then
       begin
        AssignFile(StateFile,SaveDialog1.FileName);
        ReWrite(StateFile);
        Write(StateFile,CState);
        CloseFile(StateFile);
       end;
     end
    else
     {Save to an instrument memory.}
     begin
      SaveState(M);
     end;
   end
  else
  {-------- Load an instrument state -------}
   begin
    if (M > 19) then
     {Load state from a disk file.}
     begin
      if OpenDialog1.Execute then
       begin
        AssignFile(StateFile,OpenDialog1.FileName);
        Reset(StateFile);
        Read(StateFile,CState);
        CloseFile(StateFile);
        UpdateDisplayState(20);
       end;
     end
    else UpdateDisplayState(m);
   end;
  Application.ProcessMessages;
  Sleep(250);
  TPanel(Sender).Color := clSilver;
end;

procedure TFMain.PMFClick(Sender: TObject);
begin
 if SaveDialog1.Execute then
  begin
   AssignFile(StateFile,SaveDialog1.FileName);
   ReWrite(StateFile);
   Write(StateFile,CState);
   CloseFile(StateFile);
  end;
end;

{============================================================================
 Handle Loading a wave into one of the arbitrary waveform memories: 2nd tab.
=============================================================================}
procedure TFMain.BWaveLoadClick(Sender: TObject);
var
    i: integer;
begin
 if OpenDialog1.execute then
  if not(ArbWaveLoaded(OpenDialog1.FileName)) then
    ShowMessage('Invalid wave file: lenght or content.')
  else
   begin
    EArbFile.Text := OpenDialog1.FileName;
    for i := 1 to 2048 do SGArb.Cells[1,i] := IntToStr(bhi[i] shl 8 + blo[i]);
   end;
end;

procedure TFMain.ComboBoxSerPortChange(Sender: TObject);
begin

end;


procedure TFMain.BArbStoreClick(Sender: TObject);
var i,j: integer;

 procedure waiting;
 begin
  j := 0;
  Repeat
     Sleep(10);
     Application.ProcessMessages;
     sleep(10);
     inc(j);
    until ((sReceived <> '') or (j > 50));
 end;

begin
 if WaveFileReady then
  begin
   ArbTarget := RGMemory.ItemIndex+1;
   Send('DDS_WAVE'+char($A5));
   sleep(200);
   //Waiting;
   //if (sReceived <> 'X') then exit;
   label2.caption := sReceived;
   //Application.ProcessMessages;
   sleep(200);
   Send('DDS_WAVE'+char($F0+ArbTarget));
   sleep(200);
   //Waiting;
   //if (sReceived <> 'SE') then exit;
   label2.caption := sReceived;
   //Application.ProcessMessages;
   sleep(200);
   Send('DDS_WAVE'+char(ArbTarget));
   sleep(200);
   //Waiting;
   //if (sReceived <> 'W') then exit;
   label2.caption := sReceived;
   //Application.ProcessMessages;
   sleep(200);
    for i := 1 to 2048 do
    begin
     label2.caption := IntToStr(i);
     application.ProcessMEssages;
     Ser.SendByte(bhi[i]);
     sleep(5);
     Ser.SendByte(blo[i]);
     sleep(5);
    end;
   waiting;
   label2.caption := 'OK';
  end
 else ShowMessage('Please identify a waveform file.');
end;

{============================================================================
 Handle Counter and read-intrument functions
=============================================================================}
procedure TFMain.BCtrClrClick(Sender: TObject);
begin
 CounterClear;
end;

procedure TFMain.BCtrExtCntClick(Sender: TObject);
var
 i, len: integer;
 S: string;
begin
 S := GetCount;
 len := length(S);
 i := 1;
 while ((Not(S[i] in ['1','2','3','4','5','6','7','8','9']) and (i <= len))) do
    begin S[i] := ' '; inc(i) end;
 if i > len then S := '0';
 ECounter.Text := S
end;

function ToHz(S:string): string;
var
 i, len: integer;
 n: double;
begin
 len := length(S);
 i := 1;
 while ((Not(S[i] in ['1','2','3','4','5','6','7','8','9']) and (i <= len))) do
   begin S[i] := '0'; inc(i) end;
 n := StrToFloat(S)/100;
 if n >= 1e6 then result := FloatToStrF(n/1e6,ffFixed,11,8)+'MHz'
 else
 if n >= 1e3 then result := FloatToStrF(n/1e3,ffFixed,11,5)+'KHz'
 else result := FloatToStrF(n,ffFixed,11,2)+'Hz';
end;

procedure TFMain.BCtrExtFClick(Sender: TObject);
begin
 ECounter.Text := ToHz(GetExtF);
end;

procedure TFMain.BCtrCh1FClick(Sender: TObject);
begin
 ECounter.Text := ToHz(GetCh1F);
end;

{============================================================================
 Handle Loading, saving, executing a script
=============================================================================}
procedure TFMain.BScrLoadClick(Sender: TObject);
var ScriptFile: text;
 i: integer;
 S: string;
begin
  if (OpenDialog1.Execute) then
   begin
    EScriptFile.Text := OpenDialog1.FileName;
    AssignFile(ScriptFile,OpenDialog1.FileName);
    Reset(ScriptFile);
    i := 1;
    while ((i <= 500) and (Not(EOF(ScriptFile)))) do
     begin
      ReadLn(ScriptFile,S);
      SGScript.Cells[1,i] := S;
      inc(i);
     end;
    if (i > 500) then ShowMessage('Improper script file.')
    else
     SGScript.Cells[1,i] := '****';
     inc(i);
     while (i < 501) do
      begin
       SGScript.Cells[1,i] := '';
       inc(i)
      end;
    CloseFile(ScriptFile);
   end;
   sStep := 1;
   LStep.Caption := SNEXTSTEP+'1';
end;

procedure TFMain.BScrSaveClick(Sender: TObject);
var ScriptFile: text;
 i: integer;
begin
  if (SaveDialog1.Execute) then
   begin
    EScriptFile.Text := SaveDialog1.FileName;
    AssignFile(ScriptFile,SaveDialog1.FileName);
    ReWrite(ScriptFile);
    i := 1;
    while ((i <= 500) and (Not(SGScript.Cells[1,i] = ''))) do
     begin
      WriteLn(ScriptFile,SGScript.Cells[1,i]);
      SGScript.Cells[1,i] := '';
      inc(i);
     end;
    CloseFile(ScriptFile);
   end;
  sStep := 1;
  LStep.Caption := SNEXTSTEP+'1';
end;

function SLineExecuted(sLine: string): boolean;
var i,nInt: integer;
 nParm: double;
 sCode,sParm: shortstring;
 done, fail: boolean;
const NUMS = ['+','-','.','0','1','2','3','4','5','6','7','8','9'];
      ENDS = ['*',';',' '];
begin
 //len := length(sLine);
 done := false;
 fail := false;
 sLine := UpperCase(sLine) + '****';
 i:= 1;
 while (not(Done or fail)) do
  begin
   if not(sLine[i] in ENDS) then
    begin
     sCode := '';
     sParm := '';
     {get the code}
     sCode := sCode+sLine[i];
     inc(i);
     sCode := sCode+sLine[i]; //get the code
     inc(i);
     {get the parameter}
     while (sLine[i] in nums) do
      begin
       sParm := sParm+sLine[i];
       inc(i);
      end;
     inc(i);  //increment past "," or other seperator character.
     {convert parameter to a number}
     try
      nParm := StrToFloat(sParm)
     except
      ShowMessage('Invalid parmeter.');
      fail := true;
     end;
     if not(fail) then
      begin
       nInt := trunc(nParm);
       case sCode of
        'WP': fail := not(WaveformSet(CH1,nInt));
        'WS': fail := not(WaveformSet(CH2,nInt));
        'FP': fail := not(FrequencySet(CH1,nParm));
        'FS': fail := not(FrequencySet(CH2,nParm));
        'AP': fail := not(AmplitudeSet(CH1,nParm));
        'AS': fail := not(AmplitudeSet(CH2,nParm));
        'OP': fail := not(OffsetSet(CH1,nParm));
        'OS': fail := not(OffsetSet(CH2,nParm));
        'DP': fail := not(DutyCycleSet(CH1,nInt));
        'DS': fail := not(DutyCycleSet(CH2,nInt));
        'PH': fail := not(PhaseSet(nInt));
        'GT': SStep := nInt-1;
        'HL': Done := True;
        else
         begin
          ShowMessage('Invalid code');
          fail := true
         end;
       end;
      end;
    end
   else Done := True;
  end;
 result := not(fail);
end;

procedure TFMain.BScrStepClick(Sender: TObject);
var sSLine: string;
begin
 sSLine := SGScript.cells[1,SStep];
 if sSline <> '' then
 if (SLineExecuted(sSLine)) then
  begin
   inc(SStep);
   LStep.Caption := SNEXTSTEP+IntToStr(SStep);
  end
 else
  begin
   Timer1.Enabled := False;
  end;
end;

{ by JG: define and open Ser-Port from Form }
procedure TFMain.BtnSerStartClick(Sender: TObject);
var S: string;
begin
  bTTYPortvalid := SerPortOpen(ComboBoxSerPort.Caption);
  if bTTYPortvalid then begin
    FMain.BtnSerStart.Enabled := false;
    FMain.BtnSerStart.Caption := 'Port open';
  end
  else begin
      ShowMessage('No valid Ser-Port: ' + sTTYPort);
      Exit;
  end;

  S := SendWithResponse('a');
  if S = '' then
  begin
   ShowMessage('not connected to ' + sTTYPort);
    FMain.BtnSerStart.Enabled := true;
    Exit;
  end
 else
 begin
     FMain.LblConnect.Caption:= 'connected';
     FMain.LblConnect.Color:= clMoneyGreen;
  end;



end;

procedure TFMain.Timer1Timer(Sender: TObject);
begin
 BScrStepClick(Self);
end;

procedure TFMain.BScrResetClick(Sender: TObject);
begin
 Timer1.Enabled := False;
 SStep := 1;
 LStep.Caption := SNEXTSTEP+'1';
end;

procedure TFMain.BScrRunClick(Sender: TObject);
begin
 Timer1.Interval := StrToInt(EStepTime.Text);
 Timer1.Enabled := True;
end;

procedure TFMain.BScrPauseClick(Sender: TObject);
begin
 Timer1.Enabled := False;
end;


initialization
  {$I main.lrs}

end.


