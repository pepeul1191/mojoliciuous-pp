/*
Archivos que usa :
	+
*/

var Router = Marionette.AppRouter.extend({
    routes: {
        'email/:email': 'showEmail',
        "" : "index", 
        "sistema" : "sistemaIndex",
        "accesos/sistemas/menu/:sistema_id" : "showSistemaMenu",
        "*actions" : "index"
    },
    showEmail: function(email) {
        // show the email
        alert(email);
    },
    sistemaIndex: function(){
        var sistemaView = new SistemaView({});
        sistemaView.render();
        sistemaView.mostrarTabla();
    },
    showSistemaMenu: function(sistema_id){
		var menuView = new MenuView({});
		menuView.render();
		menuView.mostrarTabla(sistema_id);
	}
});
    
const App = Marionette.Application.extend({
    region: '#body-app',
    onStart() {
        var router = new Router();
        Backbone.history.start();
    }
});

const myApp = new App();
myApp.start();