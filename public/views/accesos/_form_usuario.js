var FormUsuarioView = Backbone.View.extend({
	el: '#formUsuario',
	initialize: function(){
	},
	events: {
	    "keyup #txtUsuario": "validarUsuarioRepetido", 
	    "focusout #txtUsuario": "validarUsuarioLleno", 
	    "keyup #txtCorreo": "validarCorreoRepetido", 
	    "focusout #txtCorreo": "validarCorreoFormato", 
	    "keyup #txtContraseniaAntgua": "validarContraseniaAntigua", 
	    "focusout #txtContraseniaAntgua": "validarContraseniaLleno", 
	    "focusout #txtContraseniaNueva": "validarContraseniaAntiguaDiferente", 
	    "focusout #txtContraseniaNuevaRepetida": "validarContraseniaIgual", 
	    "click #btnGuardarUsuarioCorreo": "guardarUsuarioCorreo",
	    "click #btnCambiarContrasenia": "cambiarContrasenia"
	},
	validarUsuarioRepetido: function(event) {
		var usuario_valido_valor;
		var usuario_temp = new Object();
	   usuario_temp.id = $("#idUsuario").html();
	   usuario_temp.usuario  = $("#txtUsuario").val(),

     	$.ajax({
     		type: "POST",
     		url: BASE_URL + "accesos/usuario/nombre_repetido",
     		data: "data=" + JSON.stringify(usuario_temp),
     		async: false,
     		success: function(data){
     			if(data >= 1){
     				$("#txtUsuario").parent().addClass("has-error");
     				$("#txtUsuario").parent().find("span").html("El nombre de usuario registrado ya se encuentra en uso");
     				usuario_valido_valor = false;
     			}else{
     				$("#txtUsuario").parent().removeClass("has-error");
     				$("#txtUsuario").parent().find("span").html("");
     				usuario_valido_valor = true;
     			}
     		},
     		error: function(data){
     			$("#txtUsuario").parent().addClass("has-error");
     			$("#txtUsuario").parent().find("span").html("Error: No se podido validar si el usuario está en uso");
     			correo_valido_valor = false;
     		}
     	});
     	this.model.set({usuario_valido : usuario_valido_valor});
	},
	validarContraseniaAntigua: function(event) {
		var usuario_valido_valor;
		var usuario_temp = new Object();
	   usuario_temp.id = $("#idUsuario").html();
	   usuario_temp.contrasenia  = $("#txtContraseniaAntgua").val(),

     	$.ajax({
     		type: "POST",
     		url: BASE_URL + "accesos/usuario/contrasenia_repetida",
     		data: "data=" + JSON.stringify(usuario_temp),
     		async: false,
     		success: function(data){
     			if(data == 0){
     				$("#txtContraseniaAntgua").parent().addClass("has-error");
     				$("#txtContraseniaAntgua").parent().find("span").html("La contraseña ingresada no coincide");
     				usuario_valido_valor = false;
     			}else{
     				$("#txtContraseniaAntgua").parent().removeClass("has-error");
     				$("#txtContraseniaAntgua").parent().find("span").html("");
     				usuario_valido_valor = true;
     			}
     		},
     		error: function(data){
     			$("#txtContraseniaAntgua").parent().addClass("has-error");
     			$("#txtContraseniaAntgua").parent().find("span").html("Error: No se podido validar si la contraseña antigua");
     			correo_valido_valor = false;
     		}
     	});
     	this.model.set({usuario_valido : usuario_valido_valor});
	},
	validarUsuarioLleno: function(event) {
		if(this.model.get("usuario_valido") != false){
			if($("#txtUsuario").val() == ""){
				$("#txtUsuario").parent().addClass("has-error");
	      	$("#txtUsuario").parent().find("span").html("Debe ingresar un usuario");
	      	this.model.set({usuario_lleno : false});
			}else{
				$("#txtUsuario").parent().removeClass("has-error");
	      	$("#txtUsuario").parent().find("span").html("");
	      	this.model.set({usuario_lleno : true});
			}
		}
	},
	validarCorreoRepetido: function(event) {
		var correo_valido_valor;
     	$.ajax({
     		type: "POST",
     		url: BASE_URL + "accesos/usuario/correo_repetido",
     		data: "correo=" + $("#txtCorreo").val(),
     		async: false,
     		success: function(data){
     			if(data >= 1){
     				$("#txtCorreo").parent().addClass("has-error");
     				$("#txtCorreo").parent().find("span").html("El correo ya se encuentra asociado a un usuario registrado");
     				correo_valido_valor = false;
     			}else{
     				$("#txtCorreo").parent().removeClass("has-error");
     				$("#txtCorreo").parent().find("span").html("");
     				correo_valido_valor = true;
     			}
     		},
     		error: function(data){
     			$("#txtCorreo").parent().addClass("has-error");
     			$("#txtCorreo").parent().find("span").html("Error: No se podido validar si el correo está en uso");
     			correo_valido_valor = false;
     		}
     	});
     	this.model.set({correo_valido : correo_valido_valor});
	},
	validarCorreoLleno: function(event) {
		if($("#txtCorreo").val() == ""){
			$("#txtCorreo").parent().addClass("has-error");
     		$("#txtCorreo").parent().find("span").html("Tiene que ingresar un correo");
     		this.model.set({correo_valido : false});
		}
	}, 
	validarContraseniaLleno: function(event) {
		if($("#txtContraseniaAntgua").val() == ""){
			$("#txtContraseniaAntgua").parent().addClass("has-error");
     		$("#txtContraseniaAntgua").parent().find("span").html("Tiene que ingresar su contraseña");
     		this.model.set({contrasenia_valido : false});
		}else{
			$("#txtContraseniaAntgua").parent().removeClass("has-error");
     		$("#txtContraseniaAntgua").parent().find("span").html("");
     		this.model.set({contrasenia_valido : true});
		}
	}, 	
	validarContraseniaAntiguaDiferente: function(event){
		this.validarContraseniaLleno();
		if($("#txtContraseniaAntgua").val() == $("#txtContraseniaNueva").val()){
			$("#txtContraseniaNueva").parent().addClass("has-error");
     		$("#txtContraseniaNueva").parent().find("span").html("La nueva contraseña no puede coincidir con la primera");
     		this.model.set({contrasenia_valido : false});
		}else{
			$("#txtContraseniaNueva").parent().removeClass("has-error");
     		$("#txtContraseniaNueva").parent().find("span").html("");
     		this.model.set({contrasenia_valido : true});
		}
	}, 
	validarContraseniaIgual: function(event) {
		this.validarContraseniaLleno();
		if($("#txtContraseniaNueva").val() != $("#txtContraseniaNuevaRepetida").val()){
			$("#txtContraseniaNuevaRepetida").parent().addClass("has-error");
     		$("#txtContraseniaNuevaRepetida").parent().find("span").html("La contraseña ingresada no coincide con la primera");
     		this.model.set({contrasenia_valido : false});
		}else{
			$("#txtContraseniaNuevaRepetida").parent().removeClass("has-error");
     		$("#txtContraseniaNuevaRepetida").parent().find("span").html("");
     		this.model.set({contrasenia_valido : true});
		}
	}, 
	validarContraseniaRepetidoLleno: function(event) {
		if($("#txtContraseniaNueva").val() == ""){
			$("#txtContraseniaNueva").parent().addClass("has-error");
     		$("#txtContraseniaNueva").parent().find("span").html("Tiene que confirmar la contrasña ingresada");
     		this.model.set({contrasenia_valido : false});
		}
	}, 
	validarCorreoFormato: function(event) {
		   var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		   var rpta = re.test($("#txtCorreo").val());
		   if(rpta == false){
		   	$("#txtCorreo").parent().addClass("has-error");
     			$("#txtCorreo").parent().find("span").html("El correo ingresado no es de un formato válido");
		   	this.model.set({correo_valido : false});
		   }else{
		   	$("#txtCorreo").parent().removeClass("has-error");
     			$("#txtCorreo").parent().find("span").html("");
		   	this.model.set({correo_valido : true});
		   }
	}, 
	guardarUsuarioCorreo: function(event){
		alert("guardarUsuarioCorreo");
		//this.validarContraseniaIgual();
		this.validarUsuarioLleno();
		this.validarCorreoLleno();
		this.model.validar();
		if(this.model.get("valido") == true){
			console.log(this.model.toJSON());
			/*
			$.ajax({
      		type: "POST",
      		url: BASE_URL + "registro/guardar_usuario",
      		data: "correo=" + $("#txtCorreo").val(),
      		async: false,
      		success: function(data){
      			if(data >= 1){
      				$("#txtCorreo").parent().addClass("has-error");
      				$("#txtCorreo").parent().find("span").html("El correo ya se encuentra asociado a un usuario registrado");
      				correo_valido_valor = false;
      			}else{
      				$("#txtCorreo").parent().removeClass("has-error");
      				$("#txtCorreo").parent().find("span").html("");
      				correo_valido_valor = true;
      			}
      		},
      		error: function(data){
      			//FALTA MANEJAR EL ERROR DEL AJAX
      		}
      	});
			*/
		}else{
			
		}
	},
	btnCambiarContrasenia: function(event){
		alert("btnCambiarContrasenia");
		//this.validarContraseniaIgual();
		this.validarContraseniaLleno();
		this.validarContraseniaRepetidoLleno();
		this.validarContraseniaIgual();
		this.model.validar();
		if(this.model.get("valido") == true){
			console.log(this.model.toJSON());
			/*
			$.ajax({
      		type: "POST",
      		url: BASE_URL + "registro/guardar_usuario",
      		data: "correo=" + $("#txtCorreo").val(),
      		async: false,
      		success: function(data){
      			if(data >= 1){
      				$("#txtCorreo").parent().addClass("has-error");
      				$("#txtCorreo").parent().find("span").html("El correo ya se encuentra asociado a un usuario registrado");
      				correo_valido_valor = false;
      			}else{
      				$("#txtCorreo").parent().removeClass("has-error");
      				$("#txtCorreo").parent().find("span").html("");
      				correo_valido_valor = true;
      			}
      		},
      		error: function(data){
      			//FALTA MANEJAR EL ERROR DEL AJAX
      		}
      	});
			*/
		}else{
			
		}
	}
});