package App::Controller::Acceso::Sistema;
use Mojo::Base 'Mojolicious::Controller';
use App::Config::Variables;
use JSON;
use Mojo::Log;
use REST::Client;
use utf8;

my $log = Mojo::Log->new;

sub listar {
    my $self = shift;
    my $url = %App::Config::Variables::Data{'accesos'} . 'sistema/listar';
	my $client = REST::Client->new(); $client->GET($url);
    my $rpta = $client->responseContent();

    $self->render(text => $rpta);
}

1;