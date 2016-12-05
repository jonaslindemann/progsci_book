unit beambc;

// ------------------------------------------------------------------
//
//       Randvillkorsformul�r
//
//       Copyright (c) 2000 Division of Structural Mechanics
//
// ------------------------------------------------------------------
//
// Skrivet av Jonas Lindemann

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, BeamModel;

type
  TfrmBCs = class(TForm)
    grpNode: TGroupBox;
    cboNode: TComboBox;
    grpBC: TGroupBox;
    btnClose: TButton;
    chkDispl: TCheckBox;
    chkRot: TCheckBox;
    edtDisplValue: TEdit;
    edtRotValue: TEdit;
    procedure FormShow(Sender: TObject);
    procedure cboNodeChange(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FCurrentNode : integer;

    procedure FillListBoxes;
    procedure SetData;
    procedure GetData;
  public
    { Public declarations }
  end;

var
  frmBCs: TfrmBCs;

implementation

{$R *.DFM}

{ TfrmBCs }

// ------------------------------------------------------------------
// H�ndelser
// ------------------------------------------------------------------

procedure TfrmBCs.FormShow(Sender: TObject);
begin

  // Innan formul�ret visas m�ste listboxarna fyllas, efter
  // detta fyller vi �vriga kontroller.

  FillListBoxes;
  SetData;
end;

// ------------------------------------------------------------------

procedure TfrmBCs.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  // Innan formul�ret st�ngs m�ste data i kontrollerna h�mtas.

  GetData;
  Action:=caHide;
end;

// ------------------------------------------------------------------

procedure TfrmBCs.cboNodeChange(Sender: TObject);
begin

  // Vid byte av aktuellt st�d h�mtar vi data fr�n f�reg�ende
  // st�d (GetData), efter detta visas data fr�n det aktuella
  // st�det (SetData)

  GetData;
  SetData;
end;

// ------------------------------------------------------------------

procedure TfrmBCs.btnCloseClick(Sender: TObject);
begin

  // St�ng formul�r

  Self.Close;
end;

// ------------------------------------------------------------------
// Privata metoder
// ------------------------------------------------------------------

procedure TfrmBCs.FillListBoxes;
var
    i : integer;
begin

  // Fyll listbox med inneh�ll

  cboNode.Clear;
  for i:=1 to BeamModel.GetNumberOfBeams+1 do
    cboNode.Items.Add(IntToStr(i));
  cboNode.ItemIndex:=0;
end;

// ------------------------------------------------------------------

procedure TfrmBCs.GetData;
var
    BCType : integer;
    BCDisplValue : double;
    BCRotValue : double;
begin

  // H�mta data fr�n dialogruta och lagra i balkmodel

  BCType:=bcFixed;
  if chkDispl.Checked and chkRot.Checked then
    BCType:=bcFixed;
  if chkDispl.Checked and not chkRot.Checked then
    BCType:=bcFixedDispl;
  if not chkDispl.Checked and chkRot.Checked then
    BCType:=bcFixedRot;
  if not chkDispl.Checked and not chkRot.Checked then
    BCType:=bcFree;
  BCDisplValue:=StrToFloat(edtDisplValue.Text);
  BCRotValue:=StrToFloat(edtRotValue.Text);
  BeamModel.SetBC(FCurrentNode, BCType, BCDisplValue, BCRotValue);
end;

// ------------------------------------------------------------------

procedure TfrmBCs.SetData;
var
    BCType : integer;
    BCDisplValue : double;
    BCRotValue : double;
begin

  // H�mta data fr�n balkmodell och visa i dialogruta

  FCurrentNode:=cboNode.ItemIndex+1;
  BeamModel.GetBC(FCurrentNode, BCType, BCDisplValue, BCRotValue);
  chkDispl.Checked:=false;
  chkRot.Checked:=false;
  case BCType of
    bcFixedDispl : chkDispl.Checked:=true;
    bcFixedRot : chkrot.Checked:=true;
    bcFixed : begin
                chkDispl.Checked:=true;
                chkrot.Checked:=true;
              end;
  end;
  edtDisplValue.Text:=FloatToStr(BCDisplValue);
  edtRotValue.Text:=FloatToStr(BCRotValue);
end;


end.
