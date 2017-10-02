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
    $r->get('/login')->over(sesion_true => 0, sesion_true => 1)->to('login#index');
    $r->get('/salir')->to('login#salir');
    $r->post('/login/acceder')->to('login#acceder');
    # Módulo de Accesos
    $r->get('/accesos/item/listar/:subtitulo_id')->to('acceso-item#listar');
    $r->get('/accesos/modulo/listar/:sistema_id')->to('acceso-modulo#listar');
    $r->get('/accesos/permiso/listar/:sistema_id')->to('acceso-permiso#listar');
    $r->get('/accesos/rol/listar/:sistema_id')->to('acceso-rol#listar');
    $r->get('/accesos/sistema/listar')->to('acceso-sistema#listar');
    $r->get('/accesos/subtitulo/listar/:modulo_id')->to('acceso-subtitulo#listar');
}

1;