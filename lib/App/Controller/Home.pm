package App::Controller::Home;
use Mojo::Base 'Mojolicious::Controller';
use App::Config::Variables;
use JSON;
use Mojo::Log;
use REST::Client;
use utf8;
use Encode qw(decode encode);
binmode STDOUT, ':utf8';

my $log = Mojo::Log->new;

sub index {
    my $self = shift;

    $log->debug('Not sure what is happening here');
    if ($self->session('autenticado' ) == 0){
        $self->redirect_to(%App::Config::Variables::Data{'BASE_URL'} . 'login');
    }else{
        my %data = (
            mensaje => JSON::false,
            titulo_pagina => 'Gestión de Accesos', 
            modulo => 'Accesos'
        ); 
        my %helper = (
            title => 'Home', 
            css => 'dist/accesos.min.css',
            js_top => 'http://localhost:3000/',
            js_bottom => 'dist/accesos.min.js',
            menu => '[{"url" : "accesos", "nombre" : "Accesos"},{"url" : "libros", "nombre" : "Libros"}]', 
            items => '[{"subtitulo":"","items":[{"item":"Gestión de Sistemas","url":"#/sistema"},{"item":"Gestión de Usuarios","url":"#/usuario"}]}]', 
            data => decode('utf8', encode_json \%data),
        );

        $self->render(template => 'home/index', variables => \%App::Config::Variables::Data, helper => \%helper);
    }
}

1;