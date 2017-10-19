package App::Controller::Acceso::Usuario;
use Mojo::Base 'Mojolicious::Controller';
use App::Config::Variables;
use JSON;
use Mojo::Log;
use REST::Client;
use utf8;
use Encode qw(decode encode);
binmode STDOUT, ':utf8';

my $log = Mojo::Log->new;

sub listar {
    my $self = shift;
    my $url = %App::Config::Variables::Data{'accesos'} . 'usuario/listar';
    my $client = REST::Client->new(); $client->GET($url);
    my $rpta = decode('utf8', $client->responseContent());

    $self->render(text => $rpta);
}

sub logs {
    my $self = shift;
    my $usuario_id = $self->param('usuario_id');
    my $url = %App::Config::Variables::Data{'accesos'} . 'usuario/listar_accesos/' . $usuario_id;
    my $client = REST::Client->new(); $client->GET($url);
    my $rpta = decode('utf8', $client->responseContent());

    $self->render(text => $rpta);
}

sub nombre_repetido {
    my $self = shift;
    my $data = $self->param('data');
    my $url = %App::Config::Variables::Data{'accesos'} . 'usuario/nombre_repetido?data=' . $data;
    my $client = REST::Client->new(); $client->POST($url);
    my $rpta = decode('utf8', $client->responseContent());

    $self->render(text => $rpta);
}

sub correo_repetido {
    my $self = shift;
    my $data = $self->param('data');
    my $url = %App::Config::Variables::Data{'accesos'} . 'usuario/correo_repetido?data=' . $data;
    my $client = REST::Client->new(); $client->POST($url);
    my $rpta = decode('utf8', $client->responseContent());

    $self->render(text => $rpta);
}

sub contrasenia_repetida {
    my $self = shift;
    my $data = $self->param('data');
    my $url = %App::Config::Variables::Data{'accesos'} . 'usuario/contrasenia_repetida?data=' . $data;
    my $client = REST::Client->new(); $client->POST($url);
    my $rpta = decode('utf8', $client->responseContent());

    $self->render(text => $rpta);
}

sub obtener_usuario_correo {
    my $self = shift;
    my $usuario_id = $self->param('usuario_id');
    my $url = %App::Config::Variables::Data{'accesos'} . 'usuario/usuario_correo/' . $usuario_id;
    my $client = REST::Client->new(); $client->GET($url);
    my $rpta = decode('utf8', $client->responseContent());

    $self->render(text => $rpta);    
}

sub guardar_usuario_correo {
    my $self = shift;
    my $usuario = $self->param('usuario');
    $log->debug('Not sure what is happening here');
    my $url = %App::Config::Variables::Data{'accesos'} . 'usuario/guardar_usuario_correo?usuario=' . $usuario;
    my $client = REST::Client->new(); $client->POST($url);
    my $rpta = decode('utf8', $client->responseContent());

    $self->render(text => $rpta);
}

sub guardar_contrasenia {
    my $self = shift;
    my $contrasenia = $self->param('contrasenia');
    my $url = %App::Config::Variables::Data{'accesos'} . 'usuario/guardar_contrasenia?contrasenia=' . $contrasenia;
    my $client = REST::Client->new(); $client->POST($url);
    my $rpta = decode('utf8', $client->responseContent());

    $self->render(text => $rpta);
}

sub listar_sistemas {
    my $self = shift;
    my $usuario_id = $self->param('usuario_id');
    my $url = %App::Config::Variables::Data{'accesos'} . 'sistema/usuario/' . $usuario_id;
    my $client = REST::Client->new(); $client->GET($url);
    my $rpta = decode('utf8', $client->responseContent());

    $self->render(text => $rpta);
}

sub guardar_sistemas {
    my $self = shift;
    my $data = $self->param('data');
    my $url = %App::Config::Variables::Data{'accesos'} . 'sistema/asociar_usuario?data=' . $data;
    my $client = REST::Client->new(); $client->POST($url);
    my $rpta = decode('utf8', $client->responseContent());

    $self->render(text => $rpta);
}

sub listar_permisos {
    my $self = shift;
    my $sistema_id = $self->param('sistema_id');
    my $usuario_id = $self->param('usuario_id');
    my $url = %App::Config::Variables::Data{'accesos'} . 'usuario/listar_permisos/' . $sistema_id . '/' . $usuario_id;
    my $client = REST::Client->new(); $client->GET($url);
    my $rpta = decode('utf8', $client->responseContent());

    $self->render(text => $rpta);
}

sub listar_roles {
    my $self = shift;
    my $sistema_id = $self->param('sistema_id');
    my $usuario_id = $self->param('usuario_id');
    my $url = %App::Config::Variables::Data{'accesos'} . 'usuario/listar_roles/' . $sistema_id . '/' . $usuario_id;
    my $client = REST::Client->new(); $client->GET($url);
    my $rpta = decode('utf8', $client->responseContent());

    $self->render(text => $rpta);
}

sub asociar_roles {
    my $self = shift;
    my $data = $self->param('data');
    my $url = %App::Config::Variables::Data{'accesos'} . 'usuario/asociar_roles?data=' . $data;
    my $client = REST::Client->new(); $client->POST($url);
    my $rpta = decode('utf8', $client->responseContent());

    $self->render(text => $rpta);
}

sub asociar_permisos {
    my $self = shift;
    my $data = $self->param('data');
    my $url = %App::Config::Variables::Data{'accesos'} . 'usuario/asociar_permisos?data=' . $data;
    my $client = REST::Client->new(); $client->POST($url);
    my $rpta = decode('utf8', $client->responseContent());

    $self->render(text => $rpta);
}

1;