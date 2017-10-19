var UsuarioRolPermisoView = Backbone.View.extend({
	el: '#modal-container',
	initialize: function(){
		//this.render();
	},
	render: function(usuario_id){
		$("#btnModal").click(); 
		var context = this.getUsuarioSistemas(usuario_id);
		console.log(context);
		if(context == null){
			window.location.replace(BASE_URL + "error/access/404");
		}
		this.$el.html(this.getTemplate());
		var source = $("#usuario-roles-permisos-template").html();
		var template = Handlebars.compile(source);
		var html = template(context);
		this.$el.html(html);
	}, 
	getTemplate: function() {
		var data = { };
		var template = null;
		$.ajax({
		   url: STATICS_URL + 'templates/accesos/usuario_rol_permiso.html', 
		   type: "GET", 
		   async: false, 
		   success: function(source) { 
			   template = source
		   }
		});
		return template;
	},
	getUsuarioSistemas: function(usuario_id){
		var sistemas_json = { };
		$.ajax({
		   url: BASE_URL + 'accesos/usuario/listar_sistemas/' + usuario_id, 
		   type: "GET", 
		   async: false, 
		   success: function(data) {
		   		if (data == "null"){
		   			sistemas_json = null;
		   		}else{
		   			sistemas_json = JSON.parse(data);
		   		}
		   }
		});
		var rpta = [];
		for(var i = 0; i < sistemas_json.length; i++){
			if(sistemas_json[i]['existe'] == 1){
				var temp = {sistema_id:sistemas_json[i]['id'], nombre:sistemas_json[i]['nombre']};
				rpta.push(temp);
			}
		}
		return {usuario_sistemas:rpta};
	},
});