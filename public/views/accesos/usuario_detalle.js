var UsuarioDetalleView = Backbone.View.extend({
	el: '#modal-container',
	initialize: function(){
		//this.render();
		console.log("initialize");
	},
	render: function(usuario_id){
		$("#btnModal").click(); 
		this.$el.html(this.getTemplate());
		var source = $("#usuario-detalle-template").html();
		var template = Handlebars.compile(source);
		var context = this.getUsuario(usuario_id);
		var html = template(context);
		this.$el.html(html);
		var usuario = new Usuario();
		var formUsuarioView = new FormUsuarioView({model:usuario});
		formUsuarioView.render();
	}, 
	getTemplate: function() {
		var data = { };
		var template = null;
		$.ajax({
		   url: STATICS_URL + 'templates/accesos/usuario_detalle.html', 
		   type: "GET", 
		   async: false, 
		   success: function(source) { 
			   template = source
		   }
		});
		return template;
	},
	getUsuario: function(usuario_id){
		var usuario_json = { };
		$.ajax({
		   url: BASE_URL + 'accesos/usuario/obtener_usuario_correo/' + usuario_id, 
		   type: "GET", 
		   async: false, 
		   success: function(data) {
			   	usuario_json = JSON.parse(data);
		   }
		});
		return usuario_json;
	}
});