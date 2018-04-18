{**********************************************************************************}
{ VESTIS PCP  - SISTEMA PARA INDUSTRIAS DE CONFECÇÕES.                             } 
{                                                                                  } 
{ Este arquivo é parte do codigo-fonte do sistema VESTIS PCP, é um software livre; }
{ você pode redistribuí-lo e/ou modificá-lo dentro dos termos da GNU LGPL versão 3 }
{ como publicada pela Fundação do Software Livre (FSF).                            }
{                                                                                  }
{ Este programa é distribuído na esperança que possa ser útil, mas SEM NENHUMA     }
{ GARANTIA; sem uma garantia implícita de ADEQUAÇÃO a qualquer MERCADO ou          }
{ APLICAÇÃO EM PARTICULAR. Veja a Licença Pública Geral GNU/LGPL em português      }
{ para maiores detalhes.                                                           }
{                                                                                  }
{ Você deve ter recebido uma cópia da GNU LGPL versão 3, sob o título              }
{ "LICENCA.txt", junto com esse programa.                                          }
{ Se não, acesse <http://www.gnu.org/licenses/>                                    }
{ ou escreva para a Fundação do Software Livre (FSF) Inc.,                         }
{ 51 Franklin St, Fifth Floor, Boston, MA 02111-1301, USA.                         }
{                                                                                  }
{                                                                                  }
{ Autor: Adriano Zanini -  vestispcp.indpcp@gmail.com                              }
{                                                                                  }
{**********************************************************************************}


{***********************************************************************************
**  SISTEMA...............: VESTIS PCP                                            **
**  DESCRIÇÃO.............: SISTEMA ERP PARA INDUSTRIAS DE CONFECÇÕES             **
**  LINGUAGEM/DB..........: DELPHI XE7  /  SQL SERVER 2014                        ** 
**  ANO...................: 2010 - 2018                                           ** 
**                                                                                **
** ------------------------------------------------------------------------------ **
**                                                                                **
**  AUTOR/DESENVOLVEDOR...: ADRIANO ZANINI                                        **
**  MINHAS AUTORIAS.......:  Vestis PCP e IndPCP                                  **
**  - VESTISPCP (é gratuito, disponivel no GitHub). Não dou Suporte Técnico.      **
**  - INDPCP (é pago). Dou Suporte Técnico.                                       **
**                                                                                **
** -----------------------------------------------------------------------------  **
**                                                                                **
** - VESTISPCP É CÓDIGO-FONTE LIVRE. O CODIGO-FONTE NÃO PODE SER COMERCIALIZADO.  **
**                                                                                **
** - INDPCP É RESTRITO. SOMENTE EU, O AUTOR, POSSO COMERCIALIZAR O CODIGO-FONTE.  **
**                                                                                **
***********************************************************************************}

unit FDuplicatasImprimir;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, QuickRpt, QRCtrls, ExtCtrls, DB,
        StdCtrls, ACBrBase,
  ACBrExtenso, QRPDFFilt,   FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmDuplicatasImprimir = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    MemoExtenso1: TQRMemo;
    QRDBText7: TQRDBText;
    QRndereco1: TQRLabel;
    QRMunicipio1: TQRLabel;
    QRUF1: TQRLabel;
    QRPRACA1: TQRLabel;
    QRCEP1: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    MemoExtenso2: TQRMemo;
    QRndereco0: TQRLabel;
    QRMunicipio0: TQRLabel;
    QRPRACA0: TQRLabel;
    QRCEP0: TQRLabel;
    QRUF0: TQRLabel;
    ACBrExtenso1: TACBrExtenso;
    QRImage1: TQRImage;
    QRDBText1: TQRDBText;
    db_SomarValorTotal:  TFDQuery;
    QRDBText9: TQRDBText;
    db_SomarValorTotalTOTAL: TBCDField;
    QRDBText8: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText10: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDuplicatasImprimir: TFrmDuplicatasImprimir;

implementation

uses FPrincipal, Global, Biblioteca, FDuplicata;

{$R *.dfm}

procedure TFrmDuplicatasImprimir.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   db_SomarValorTotal.CLOSE;
   action:=cafree;
end;

procedure TFrmDuplicatasImprimir.FormCreate(Sender: TObject);
begin

   FrmDuplicata.db_CtaReceber.First;

   if FrmDuplicata.RdgSaida.ItemIndex=0 then
   begin
      QuickRep1.Preview;
   end;

   if FrmDuplicata.RdgSaida.ItemIndex=1 then
   begin
      QuickRep1.Print;
   end;

   close;
   
end;

procedure TFrmDuplicatasImprimir.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

   db_SomarValorTotal.CLOSE;
   db_SomarValorTotal.OPEN;

   ACBrExtenso1.Valor := FrmDuplicata.db_CtaReceber.FieldByName('VALOR').AsFloat ;
   wTexto[0] :=UpperCase(ACBrExtenso1.Texto);
   while Length(wTexto[0]) < (315-length(wTexto[0]) ) do wTexto[0] := wTexto[0]+' x ';


   MemoExtenso1.lines.clear;
   MemoExtenso1.lines.Text :=wTexto[0];

   MemoExtenso2.lines.clear;
   MemoExtenso2.lines.Text :=wTexto[0];



  // endereço
  IF FrmDuplicata.db_CtaReceber.FieldByName('EC_ENDERECO').AsString>'' then
  begin
     QRndereco0.Caption :=FrmDuplicata.db_CtaReceber.FieldByName('EC_ENDERECO').AsString;
     QRndereco1.Caption :=FrmDuplicata.db_CtaReceber.FieldByName('EC_ENDERECO').AsString;
  end
  else
  begin
     QRndereco0.Caption :=FrmDuplicata.db_CtaReceber.FieldByName('ENDERECO').AsString;
     QRndereco1.Caption :=FrmDuplicata.db_CtaReceber.FieldByName('ENDERECO').AsString;
  end;

  // Municipio
  IF FrmDuplicata.db_CtaReceber.FieldByName('EC_NOMECIDADE').AsString>'' then
  begin
     QRMunicipio0.Caption :=FrmDuplicata.db_CtaReceber.FieldByName('EC_NOMECIDADE').AsString;
     QRMunicipio1.Caption :=FrmDuplicata.db_CtaReceber.FieldByName('EC_NOMECIDADE').AsString;
  end
  else
  begin
     QRMunicipio0.Caption :=FrmDuplicata.db_CtaReceber.FieldByName('MUNICIPIO').AsString;
     QRMunicipio1.Caption :=FrmDuplicata.db_CtaReceber.FieldByName('MUNICIPIO').AsString;
  end;

  // UF
  IF FrmDuplicata.db_CtaReceber.FieldByName('EC_UF').AsString>'' then
  begin
     QRUF0.Caption :=FrmDuplicata.db_CtaReceber.FieldByName('EC_UF').AsString;
     QRUF1.Caption :=FrmDuplicata.db_CtaReceber.FieldByName('EC_UF').AsString;
  end
  else
  begin
     QRUF0.Caption :=FrmDuplicata.db_CtaReceber.FieldByName('UF').AsString;
     QRUF1.Caption :=FrmDuplicata.db_CtaReceber.FieldByName('UF').AsString;
  end;

  // PRACA DE PAGTO
  IF FrmDuplicata.db_CtaReceber.FieldByName('EC_NOMECIDADE').AsString>'' then
  begin
     QRPRACA0.Caption :=FrmDuplicata.db_CtaReceber.FieldByName('EC_NOMECIDADE').AsString;
     QRPRACA1.Caption :=FrmDuplicata.db_CtaReceber.FieldByName('EC_NOMECIDADE').AsString;
  end
  else
  begin
     QRPRACA0.Caption :=FrmDuplicata.db_CtaReceber.FieldByName('MUNICIPIO').AsString;
     QRPRACA1.Caption :=FrmDuplicata.db_CtaReceber.FieldByName('MUNICIPIO').AsString;
  end;

  // CEP
  IF FrmDuplicata.db_CtaReceber.FieldByName('EC_CEP').AsString>'' then
  begin
     QRCEP0.Caption :=FrmDuplicata.db_CtaReceber.FieldByName('EC_CEP').AsString;
     QRCEP1.Caption :=FrmDuplicata.db_CtaReceber.FieldByName('EC_CEP').AsString;
  end
  else
  begin
     QRCEP0.Caption :=FrmDuplicata.db_CtaReceber.FieldByName('CEP').AsString;
     QRCEP1.Caption :=FrmDuplicata.db_CtaReceber.FieldByName('CEP').AsString;
  end;

end;

end.
