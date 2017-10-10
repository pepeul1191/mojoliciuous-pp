package App::Controller::Acceso::Subtitulo;
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
    my $modulo_id = $self->param('modulo_id');
    my $url = %App::Config::Variables::Data{'accesos'} . 'subtitulo/listar/' . $modulo_id;
    my $client = REST::Client->new(); $client->GET($url);
    my $rpta = decode('utf8', $client->responseContent());

    $self->render(text => $rpta);
}

sub guardar {
    my $self = shift;
    my $data = $self->param('data');
    my $url = %App::Config::Variables::Data{'accesos'} . 'subtitulo/guardar?data=' . $data;
    my $client = REST::Client->new(); $client->POST($url);
    my $rpta = $client->responseContent();

    $self->render(text => $rpta);
}

1;