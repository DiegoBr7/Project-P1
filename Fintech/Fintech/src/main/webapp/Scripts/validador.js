/**
 * 
 */

 function validar(){
	 let nome = frmContato.nome.value
	 let cpf = frmContato.cpf.value
	 let dtNasc = frmContato.dtNasc.value
	 let sexo = frmContato.sexo.value
	 let email = frmContato.email.value
	 let profissao = frmContato.profissao.value
	 let salario = frmContato.salario.value
	 let senha = frmContato.senha.value
	 if (nome === ""){
		 alert('Preencha o campo NOME')
		 frmContato.nome.focus()
		 return false
	 } else if (cpf === ""){
		 alert('Preencha o campo CPF')
		 frmContato.cpf.focus()
		 return false
	 } else if (dtNasc === ""){
		 alert('Preencha o campo de Data de Nascimento')
		 frmContato.dtNasc.focus()
		 return false
	 } else if (sexo === ""){
		 alert('Preencha o campo SEXO')
		 frmContato.sexo.focus()
		 return false
	 } else if (email === ""){
		 alert('Preencha o campo E-MAIL')
		 frmContato.email.focus()
		 return false
	 } else if (profissao === ""){
		 alert('Preencha o campo PROFISSÃO')
		 frmContato.profissao.focus()
		 return false
	 } else if (salario === ""){
		 alert('Preencha o campo SALARIO')
		 frmContato.salario.focus()
		 return false
	 } else if (senha === ""){
		 alert('Preencha o campo SENHA')
		 frmContato.senha.focus()
		 return false
	} else {
		document.forms["frmContato"].submit()
	}
}