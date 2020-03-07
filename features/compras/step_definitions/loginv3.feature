#language:pt
#-------------------------------------------------------
# T E S T S     L O G I N     V3
#-------------------------------------------------------
@loginv3
Funcionalidade: Login
  Eu como usuario do site
  Pretendo realizar o login utilizando meu usuario e senha
  Para visualizar a area logada

  Contexto: Estar na tela de login
    Dado que eu estou na tela de login

    @logininvalido
    Esquema do Cenario: Acesso invalido
      Quando eu digitar meu "<usuarioserrados>" e "<usuarioserrados>" errados e clicar em login
      Entao receberei uma mensagem "<mensagemerrologin>" de login invalido
      
      Exemplos:
        | usuarioserrados                   | senhaserradas | mensagemerrologin         |
        |  user01                           |  a1b2c3b4b5   | Invalid email address     |
        |  user02@                          |  a1b2c3b4b5   | Invalid email address     |
        |  user02@gmail                     |  a1b2c3b4b5   | Invalid email address     |
        |  user01.com                       |  a1b2c3b4b5   | Invalid email address     |
        |  user01@.com                      |  a1b2c3b4b5   | Invalid email address     |
        |  fabio.roveroto@inmetrics.com.br  |  a1b2c3b4b5   | Authentication failed     |
        |                                   |  a1b2c3b4b5   | An email address required |
        |  user01@.com                      |               | Password is required      |
