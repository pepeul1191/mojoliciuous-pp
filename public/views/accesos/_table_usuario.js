var usuario_array_json_th = [
	{titulo:"id", index: "id", estilos:"width: 10px; display:none;"},
	{titulo:"Usuario",index:"usuario",estilos:"width: 200px;"},
	{titulo:"Correo",index:"correo",estilos:"width: 200px;"},
	{titulo:"Último Login",index:"momento",estilos:"width: 200px;"},
	{titulo:"Botones",index:"NA",estilos:"width: 90px;"}
];

var usuario_array_json_td = [
	{tipo:"label_id",estilos:"color: blue; display:none", index:"id", edicion:""},
	{tipo:"label",estilos:"width:200px;", index:"usuario", edicion:""},
	{tipo:"label",estilos:"width:200px;", index:"correo", edicion:""},
	{tipo:"label",estilos:"width:200px;", index:"momento", edicion:""},
	{tipo:"botones", index:"botones", edicion:"true"}
];

var usuario_array_json_btn_td = [
	{clase:"fa fa-thumb-tack",url:"#",alt:"Ver logs de ingreso",estilos:"padding-left: 8px;", operacion:"VerAccesos"},
	{clase:"fa fa-pencil",url:"#",alt:"Editar usuario",estilos:"padding-left: 8px;", operacion:"EditarUsuario"},
	{clase:"fa fa-envelope-o",url:"#",alt:"Enviar contraseña a su correo",estilos:"padding-left: 8px;", operacion:"EnviarContrasenia"},
	{clase:"fa fa-list",url:"#",alt:"Asociar Roles y Permisos",estilos:"padding-left: 8px;", operacion:"VerRolesPermisos"}
]; 

var usuario_array_json_btn = [
	{tipo: "agrega_fila", operacion:"AgregarFila", icono: "fa fa-plus", label: "Agregar Registro", clase: "boton-tabla  mootools"},
	{tipo: "guardar_tabla", operacion:"GuardarTabla", icono: "fa fa-check", label: "Guardar Cambios", clase: "boton-tabla  mootools" }
];