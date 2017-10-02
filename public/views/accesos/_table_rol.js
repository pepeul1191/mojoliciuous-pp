var tablaRoles = new Grid();

var array_json_th_rol = [
	{titulo:"id", index: "id", estilos:"width: 10px; display:none;"},
	{titulo:"Nombre",index:"nombre",estilos:"width: 250px;"},
	{titulo:"Botones",index:"NA",estilos:"width: 80px;"}
];

var array_json_td_rol = [
	{tipo:"label_id",estilos:"color: blue; display:none", index:"id", edicion:""},
	{tipo:"text",estilos:"width:250px;", index:"nombre", edicion:""},
	{tipo:"botones", index:"botones", edicion:"true"}
];

var array_json_btn_td_rol = [
	{clase:"fa fa-chevron-right", href:"#/accesos/sistemas/menu/", alt:"Gestionar Menú",estilos:"padding-left: 2px;", tipo:"btn_td_href", operacion:"IrURL"},
	{clase:"fa fa-times",url:"",alt:"Eliminar capa",estilos:"padding-left: 2px;", operacion:"QuitarFila"}
]; 

var array_json_btn_rol = [
	{tipo: "agrega_fila", operacion:"AgregarFila", icono: "fa fa-plus", label: "Agregar Registro", clase: "boton-tabla  mootools"},
	{tipo: "guardar_tabla", operacion:"GuardarTabla", icono: "fa fa-check", label: "Guardar Cambios", clase: "boton-tabla  mootools" }
];