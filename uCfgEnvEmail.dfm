object uFrmCfgEnvEmail: TuFrmCfgEnvEmail
  Left = 0
  Top = 0
  Caption = 'Configura'#231#227'o de Envio de Email'
  ClientHeight = 254
  ClientWidth = 306
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 96
    Width = 73
    Height = 13
    Caption = 'Servidor SMTP:'
  end
  object Label2: TLabel
    Left = 224
    Top = 96
    Width = 30
    Height = 13
    Caption = 'Porta:'
  end
  object Label3: TLabel
    Left = 8
    Top = 142
    Width = 40
    Height = 13
    Caption = 'Usu'#225'rio:'
  end
  object Label4: TLabel
    Left = 8
    Top = 188
    Width = 34
    Height = 13
    Caption = 'Senha:'
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 306
    Height = 29
    ButtonHeight = 21
    ButtonWidth = 40
    Caption = 'ToolBar1'
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 0
    object tbtnGravarCfgEnvEmail: TToolButton
      Left = 0
      Top = 0
      Caption = 'Gravar'
      ImageIndex = 0
      OnClick = tbtnGravarCfgEnvEmailClick
    end
    object tbtnSairCfgEnvEmail: TToolButton
      Left = 40
      Top = 0
      Caption = 'Sair'
      ImageIndex = 1
      OnClick = tbtnSairCfgEnvEmailClick
    end
  end
  object gbTipoEnvEmail: TGroupBox
    Left = 8
    Top = 35
    Width = 289
    Height = 46
    Caption = 'Tipo'
    TabOrder = 1
    object rbTipoSmtp: TRadioButton
      Left = 48
      Top = 16
      Width = 48
      Height = 17
      Caption = 'SMTP'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rbTipoMapi: TRadioButton
      Left = 160
      Top = 16
      Width = 41
      Height = 17
      Caption = 'MAPI'
      Enabled = False
      TabOrder = 1
    end
  end
  object edtServSMTP: TDBEdit
    Left = 8
    Top = 115
    Width = 185
    Height = 21
    DataField = 'servidor'
    DataSource = dsCfgEnvEmail
    TabOrder = 2
  end
  object edtPortaServSMTP: TDBEdit
    Left = 225
    Top = 115
    Width = 73
    Height = 21
    DataField = 'porta'
    DataSource = dsCfgEnvEmail
    TabOrder = 3
    OnKeyPress = edtPortaServSMTPKeyPress
  end
  object edtUsuarioServSMTP: TDBEdit
    Left = 8
    Top = 161
    Width = 289
    Height = 21
    DataField = 'usuario'
    DataSource = dsCfgEnvEmail
    TabOrder = 4
  end
  object edtSenhaServSMTP: TDBEdit
    Left = 8
    Top = 207
    Width = 290
    Height = 21
    DataField = 'senha'
    DataSource = dsCfgEnvEmail
    TabOrder = 5
  end
  object dsCfgEnvEmail: TDataSource
    DataSet = DMCfgEnvEmail.cdsCfgEnvEmail
    OnDataChange = dsCfgEnvEmailDataChange
    Left = 184
  end
end
