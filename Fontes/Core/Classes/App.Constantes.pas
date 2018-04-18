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

unit App.Constantes;

interface

  const DRIVE_SISTEMA              = 'C:';
  const PASTA_SISTEMA              = 'Vestis';
  Const EXECUTAVEL_NOME            = 'VESTISPCP';
  const PASTA_BINARIO              = 'Binarios';
  const CONFIG_INI                 = 'Vestis.ini';
  const PASTA_SEPARADOR            = '\';
  const LOGO_NOME                  = 'logo.jpg';
  const SITE_EMPRESA               = 'www.yyyy.com.br';
  const EMAIL_EMPRESA              = 'email@yyyy.com.br';

  const DATABASE_GERENCIADOR       = 'SQL Server';
  const DATABASE_VERSAO            = '2014';

  const DATABASE_NOME              = 'VESTIS';
  const DATABASE_USUARIO           = 'sa';
  const DATABASE_SENHA             = 'sql2015';
  const DATABASE_PORTA             = 1433;
  const DATABASE_SERVIDOR          = 'localhost';

  const MASTER_USUARIO             = 'PCP';
  const MASTER_SENHA               = 'PCP.2K15';

  const REMOTO_DATABASE_SERVIDOR   = SITE_EMPRESA;
  const REMOTO_DATABASE_NOME       = 'informar banco de dados';
  const REMOTO_DATABASE_USUARIO    = 'informar usuario';
  const REMOTO_DATABASE_SENHA      = 'informar senha';
  const REMOTO_DATABASE_PORTA      = 0;


implementation

end.
