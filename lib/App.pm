package App;
use Mojo::Base 'Mojolicious';
use Mojo::Log;
# This method will run once at server start
my $log = Mojo::Log->new;

sub startup {
    my $self = shift;
    $self->hook(before_dispatch => sub {
        my $c = shift;
        $c->res->headers->header('Access-Control-Allow-Origin' => '*');
        $c->res->headers->header('x-powered-by' => 'Mojolicious (Perl)');
        #$c->res->headers->header('Set-Cookie' => 'PLAY_SESSION');
        $c->res->headers->header('Server' => 'Ubuntu');
    });
    # Documentation browser under "/perldoc"
    $self->plugin('PODRenderer');
    # Plugin
    $self->plugin('App::Plugin::SessionTrue');
    # Router
    my $r = $self->routes;
    # Normal route to controller
    $r->get('/')->to('home#index');
    $r->get('/login')->over(sesion_true => 0)->to('login#index');
    $r->get('/login/cerrar')->to('login#salir');
    $r->post('/login/acceder')->to('login#acceder');
    # Accesos
    # Accesos / Item
    $r->get('/accesos/item/listar/:subtitulo_id')->to('acceso-item#listar');
    $r->post('/accesos/item/guardar')->to('acceso-item#guardar');
    # Accesos / Modulo
    $r->get('/accesos/modulo/listar/:sistema_id')->to('acceso-modulo#listar');
    $r->post('/accesos/modulo/guardar')->to('acceso-modulo#guardar');
    # Accesos / Permiso
    $r->get('/accesos/permiso/listar/:sistema_id')->to('acceso-permiso#listar');
    $r->get('/accesos/permiso/listar_asociados/:sistema_id/:rol_id')->to('acceso-permiso#listar_asociados');
    $r->post('/accesos/permiso/guardar')->to('acceso-permiso#guardar');
    # Accesos / Rol
    $r->get('/accesos/rol/listar/:sistema_id')->to('acceso-rol#listar');
    $r->post('/accesos/rol/guardar')->to('acceso-rol#guardar');
    $r->post('/accesos/rol/asociar_permisos')->to('acceso-rol#asociar_permisos');
    # Accesos / Sistema
    $r->get('/accesos/sistema/listar')->to('acceso-sistema#listar');
    $r->post('/accesos/sistema/guardar')->to('acceso-sistema#guardar');
    # Accesos / Subtitulo
    $r->get('/accesos/subtitulo/listar/:modulo_id')->to('acceso-subtitulo#listar');
    $r->post('/accesos/subtitulo/guardar')->to('acceso-subtitulo#guardar');
    # Accesos / Usuario
    $r->get('/accesos/usuario/listar')->to('acceso-usuario#listar');
    $r->get('/accesos/usuario/logs/:usuario_id')->to('acceso-usuario#logs');
    $r->post('/accesos/usuario/nombre_repetido')->to('acceso-usuario#nombre_repetido');
    $r->post('/accesos/usuario/correo_repetido')->to('acceso-usuario#correo_repetido');
    $r->post('/accesos/usuario/contrasenia_repetida')->to('acceso-usuario#contrasenia_repetida');
    $r->get('/accesos/usuario/obtener_usuario_correo/:usuario_id')->to('acceso-usuario#obtener_usuario_correo');
    $r->post('/accesos/usuario/guardar_usuario_correo')->to('acceso-usuario#guardar_usuario_correo');
    $r->post('/accesos/usuario/guardar_contrasenia')->to('acceso-usuario#guardar_contrasenia');
    $r->get('/accesos/usuario/listar_sistemas/:usuario_id')->to('acceso-usuario#listar_sistemas');
    $r->post('/accesos/usuario/guardar_sistemas')->to('acceso-usuario#guardar_sistemas');
    $r->get('/accesos/usuario/listar_permisos/:sistema_id/:usuario_id')->to('acceso-usuario#listar_permisos');
    $r->get('/accesos/usuario/listar_roles/:sistema_id/:usuario_id')->to('acceso-usuario#listar_roles');
    $r->post('/accesos/usuario/asociar_roles')->to('acceso-usuario#asociar_roles');
    $r->post('/accesos/usuario/asociar_permisos')->to('acceso-usuario#asociar_permisos');
}

1;