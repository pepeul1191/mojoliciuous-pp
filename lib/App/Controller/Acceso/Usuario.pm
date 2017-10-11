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

1;