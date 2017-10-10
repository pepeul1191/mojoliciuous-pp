package App::Controller::Acceso::Item;
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
    my $subtitulo_id = $self->param('subtitulo_id');
    my $url = %App::Config::Variables::Data{'accesos'} . 'item/listar/' . $subtitulo_id;
    my $client = REST::Client->new(); $client->GET($url);
    my $rpta = decode('utf8', $client->responseContent());

    $self->render(text => $rpta);
}

sub guardar {
    my $self = shift;
    my $data = $self->param('data');
    my $url = %App::Config::Variables::Data{'accesos'} . 'item/guardar?data=' . $data;
    my $client = REST::Client->new(); $client->POST($url);
    my $rpta = decode('utf8', $client->responseContent());

    $self->render(text => $rpta);
}

1;