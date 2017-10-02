package App::Controller::Acceso::Permiso;
use Mojo::Base 'Mojolicious::Controller';
use App::Config::Variables;
use JSON;
use Mojo::Log;
use REST::Client;
use utf8;

my $log = Mojo::Log->new;

sub listar {
    my $self = shift;
    my $sistema_id = $self->param('sistema_id');
    my $url = %App::Config::Variables::Data{'accesos'} . 'permiso/listar/' . $sistema_id;
	my $client = REST::Client->new(); $client->GET($url);
    my $rpta = $client->responseContent();

    $self->render(text => $rpta);
}

sub listar_asociados {
    my $self = shift;
    my $rol_id = $self->param('rol_id');
    my $url = %App::Config::Variables::Data{'accesos'} . 'permiso/listar_asociados/' . $rol_id;
	my $client = REST::Client->new(); $client->GET($url);
    my $rpta = $client->responseContent();

    $self->render(text => $rpta);
}

1;