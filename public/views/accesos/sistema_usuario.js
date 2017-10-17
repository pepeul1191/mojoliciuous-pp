var tablaSistemaUsuario = new Grid();

var UsuarioSistemaView = Backbone.View.extend({
	el: '#modal-container',
	initialize: function(){
		//this.render();
		//console.log("initialize");
	},
	render: function() {
		$("#btnModal").click(); 
		this.$el.html(this.getTemplate());
	},
	getTemplate: function() {
		var data = { };
		var template_compiled = null;
		$.ajax({
		   url: STATICS_URL + 'templates/accesos/sistema_usuario.html', 
		   type: "GET", 
		   async: false, 
		   success: function(source) {
			   	var template = Handlebars.compile(source);
			   	template_compiled = template(data);
		   }
		});
		return template_compiled;
	},
	mostrarTabla: function(){
		alert("mostrarTabla");
		/*
		tablaUsuario.BorrarTable();
	   	var ajax_dao_usuario = new AjaxPython(); 
	   	ajax_dao_usuario.Constructor("GET", BASE_URL + "accesos/usuario/listar", "", false);
	   	tablaUsuario.SetTableId("tablaUsuario");
	   	tablaUsuario.SetTableObj("tablaUsuario");
	   	tablaUsuario.SetTableHeader(usuario_array_json_th);
	   	tablaUsuario.SetTableBody(usuario_array_json_td, usuario_array_json_btn_td, ajax_dao_usuario);
	   	tablaUsuario.SetTableFooter(usuario_array_json_btn, false);
	   	tablaUsuario.SetLabelMensaje("#txtMensajeRpta");
	   	tablaUsuario.SetURLGuardar(BASE_URL + "accesos/usuario/guardar");

	   	tablaUsuario.MostrarTable();
	   	*/
	}
});