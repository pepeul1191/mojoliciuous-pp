package App::Controller::Acceso::Rol;
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
    my $sistema_id = $self->param('sistema_id');
    my $url = %App::Config::Variables::Data{'accesos'} . 'rol/listar/' . $sistema_id;
    my $client = REST::Client->new(); $client->GET($url);
    my $rpta = decode('utf8', $client->responseContent());

    $self->render(text => $rpta);
}

sub guardar {
    my $self = shift;
    my $data = $self->param('data');
    my $url = %App::Config::Variables::Data{'accesos'} . 'rol/guardar?data=' . $data;
    my $client = REST::Client->new(); $client->POST($url);
    my $rpta = decode('utf8', $client->responseContent());

    $self->render(text => $rpta);
}

sub asociar_permisos {
    my $self = shift;
    my $data = $self->param('data');
    my $url = %App::Config::Variables::Data{'accesos'} . 'rol/asociar_permisos?data=' . $data;
    my $client = REST::Client->new(); $client->POST($url);
    my $rpta = decode('utf8', $client->responseContent());

    $self->render(text => $rpta);
}

1;