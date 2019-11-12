unit uFuncoes;

interface
function validaCNPJ(CNPJ: string): boolean;
//procedure criaform(ClasseForm: TFormClass);

implementation
uses SysUtils, Windows, Messages, Variants, Classes, Graphics, Controls, Dialogs; // Necess�rio para utilizar a fun��o StrToInt


function validaCNPJ(CNPJ: string): boolean;
var
  sm, i, res, peso: integer;
  digverif13, digverif14: string;
begin
  if (CNPJ = '0000000000000') or (CNPJ = '11111111111111') or
     (CNPJ = '22222222222222') or (CNPJ = '33333333333333') or
     (CNPJ = '44444444444444') or (CNPJ = '55555555555555') or
     (CNPJ = '66666666666666') or (CNPJ = '77777777777777') or
     (CNPJ = '88888888888888') or (CNPJ = '99999999999999') or
     (length(CNPJ) <> 14) then
  begin
    validaCNPJ:= false;
    //MessageBox(handle, pChar('CNPJ inv�lido!' ), 'Aten��o', MB_ICONEXCLAMATION +  MB_OK);
    MessageDlg('CNPJ inv�lido!', mtWarning, [mbOk],0);
  end;

  try
    //Calculo do primeiro digito verificador
    sm := 0;
    peso := 2;
    for i := 12 downto 1 do
    begin
      sm := sm + (StrToInt(CNPJ[i]) * peso);
      peso := peso + 1;
      if (peso = 10) then
        peso:= 2;
    end;

    res := sm mod 11;
    if ((res = 0) or (res = 1)) then
      digverif13 := '0'
    else
      str((11-res):1, digverif13);

    //Calculo do segundo digito verificador
    sm := 0;
    peso := 2;
    for i := 13 downto 1 do
    begin
      sm := sm + (StrToInt(CNPJ[i]) * peso);
      peso := peso + 1;
      if (peso = 10) then
        peso := 2;
    end;

    res := sm mod 11;
    if ((res = 0) or (res = 1)) then
      digverif14 := '0'
    else
      str((11-res):1, digverif14);

    //Verifica se os digitos calculados sao iguais aos digitos informados
    if ((digverif13 = CNPJ[13]) and (digverif14 = CNPJ[14])) then
      validaCNPJ := true
    else
      validaCNPJ := false;
  except
  on e: exception do
    validaCNPJ:= false;
  end;
end;
{
procedure TFormulario1.criaform(ClasseForm:TFormClass);
var Form: TForm;
begin
	  Application.CreateForm(ClasseForm,Form);
	  Form.showmodal;
	  Form.release;
end;   }

end.
