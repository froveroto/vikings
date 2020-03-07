Dado("que eu estou na tela de login") do
  @login_page = LoginPage.new
  @login_page.load
  expect(@login_page).to have_email
  page.execute_script "window.scrollBy(0,1)"
  page.execute_script "window.scrollBy(1,0)"
end

Quando("eu digitar meu usuario e senha errados e clicar em login") do
  @login_page.email.set 'fabio.roveroto@test.'
  @login_page.password.set 'aaaaaaaaaa'
  @login_page.loginbtn.click
end

Entao("receberei uma mensagem de login invalido") do
  expect(@login_page).to have_loginfail
  page.has_content?(text: 'Authentication failed.')
end

Quando("eu digitar um usuario invalido e clicar em login") do
  @login_page.email.set 'fabio.roveroto'
  @login_page.password.set 'a1b2c3'
  @login_page.loginbtn.click
end

Quando("eu digitar um usuario sem senha e clicar em login") do
  @login_page.email.set 'fabio.roveroto'
  @login_page.loginbtn.click
end

Quando("eu digitar somente a senha e clicar em login") do
  @login_page.password.set 'a1b2c3'
  @login_page.loginbtn.click
end

Entao("receberei uma mensagem de usuario invalido") do
  expect(@login_page).to have_loginfail
  page.has_content?(text: 'Invalid email address.')
end

Entao("receberei uma mensagem informando obrigatoriedade da senha") do
  expect(@login_page).to have_loginfail
  page.has_content?(text: 'Password is required.')
end

Entao("receberei uma mensagem informando obrigatoriedade do usuario") do
  expect(@login_page).to have_loginfail
  page.has_content?(text: 'An email address required.')
end

Quando("eu digitar meu {string} e {string} errados e clicar em login") do |usuarioserrados, senhaserradas|
  @login_page.email.set usuarioserrados
  @login_page.password.set senhaserradas
  @login_page.loginbtn.click
end

Entao("receberei uma mensagem {string} de login invalido") do | mensagemerrologin |
  expect(@login_page).to have_loginfail
  page.has_content?(text: mensagemerrologin)
end