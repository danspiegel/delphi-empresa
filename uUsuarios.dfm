object uFrmUsuarios: TuFrmUsuarios
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Usu'#225'rios'
  ClientHeight = 296
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 106
    Top = 53
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object Label2: TLabel
    Left = 106
    Top = 112
    Width = 34
    Height = 13
    Caption = 'Senha:'
  end
  object Label3: TLabel
    Left = 256
    Top = 112
    Width = 84
    Height = 13
    Caption = 'Confirmar Senha:'
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 405
    Height = 33
    ButtonHeight = 21
    ButtonWidth = 49
    Caption = 'tbUsuarios'
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 0
    object tbtnCriarUsuario: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Hint = 'Criar'
      Caption = 'Criar'
      ImageIndex = 0
      OnClick = tbtnCriarUsuarioClick
    end
    object tbtnGravarUsuario: TToolButton
      Left = 49
      Top = 0
      Cursor = crHandPoint
      Hint = 'Gravar'
      Caption = 'Gravar'
      Enabled = False
      ImageIndex = 1
      OnClick = tbtnGravarUsuarioClick
    end
    object tbtnCancelarUsuario: TToolButton
      Left = 98
      Top = 0
      Cursor = crHandPoint
      Hint = 'Cancelar'
      Caption = 'Cancelar'
      Enabled = False
      ImageIndex = 2
      OnClick = tbtnCancelarUsuarioClick
    end
    object tbtnExcluirUsuario: TToolButton
      Left = 147
      Top = 0
      Cursor = crHandPoint
      Hint = 'Excluir'
      Caption = 'Excluir'
      ImageIndex = 4
      OnClick = tbtnExcluirUsuarioClick
    end
    object tbtnSairUsuario: TToolButton
      Left = 196
      Top = 0
      Cursor = crHandPoint
      Hint = 'Sair'
      Caption = 'Sair'
      ImageIndex = 3
      OnClick = tbtnSairUsuarioClick
    end
  end
  object edtNomeUsuario: TDBEdit
    Left = 106
    Top = 72
    Width = 271
    Height = 21
    DataField = 'nomeusuario'
    DataSource = dsCadastroUsuarios
    TabOrder = 2
  end
  object dbgUsuario: TDBGrid
    Left = 0
    Top = 39
    Width = 100
    Height = 257
    DataSource = dsCadastroUsuarios
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyPress = dbgUsuarioKeyPress
    Columns = <
      item
        Expanded = False
        Visible = True
      end>
  end
  object edtSenhaUsuario: TDBEdit
    Left = 106
    Top = 131
    Width = 121
    Height = 21
    Color = clBtnFace
    DataField = 'senha'
    DataSource = dsCadastroUsuarios
    Enabled = False
    PasswordChar = '*'
    TabOrder = 3
    OnKeyPress = edtSenhaUsuarioKeyPress
  end
  object edtConfirmarSenhaUsuario: TDBEdit
    Left = 256
    Top = 131
    Width = 121
    Height = 21
    Color = clBtnFace
    DataField = 'senha'
    DataSource = dsCadastroUsuarios
    Enabled = False
    PasswordChar = '*'
    TabOrder = 4
    OnKeyPress = edtConfirmarSenhaUsuarioKeyPress
  end
  object dsCadastroUsuarios: TDataSource
    DataSet = DMUsuarios.cdsUsuarios
    OnDataChange = dsCadastroUsuariosDataChange
    Left = 144
    Top = 240
  end
  object QVerifLogin: TSQLQuery
    DataSource = dsCadastroUsuarios
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMBanco.ConnBanco
    Left = 232
    Top = 240
  end
  object ActionMenuUsers: TActionList
    Left = 312
    Top = 240
    object StatusEditUser: TAction
      Caption = 'StatusEditUser'
      OnExecute = StatusEditUserExecute
    end
    object StatusNormalUser: TAction
      Caption = 'StatusNormalUser'
      OnExecute = StatusNormalUserExecute
    end
  end
end
