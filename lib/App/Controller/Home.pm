package App::Controller::Home;
use Mojo::Base 'Mojolicious::Controller';
use App::Config::Variables;
use JSON;
use Mojo::Log;
use REST::Client;

my $log = Mojo::Log->new;

sub index {
    my $self = shift;

    $log->debug('Not sure what is happening here');
    if ($self->session('autenticado' ) == 1){
        $self->redirect_to(%App::Config::Variables::Data{'BASE_URL'} . 'home');
    }else{
        my %data = (
            mensaje => JSON::false,
            titulo_pagina => 'Gestión de Libros', 
            modulo => 'Libros'
        ); 
        my %helper = (
            title => 'Home', 
            css => 'dist/libros.min.css',
            js_top => 'http://localhost:3000/',
            js_bottom => 'dist/libros.min.js',
            menu => '[{"url" : "accesos", "nombre" : "Accesos"},{"url" : "libros", "nombre" : "Libros"}]', 
            items => '[{"subtitulo":"Libros","items":[{"item":"Gestión de Categorías","url":"libros/#/categoria"},{"url":"libros/#/autor","item":"Gestión de Autores"},{"item":"Gestión de Libros","url":"libros/#"}]}]', 
            data => encode_json \%data,
        );

        $self->render(template => 'home/index', variables => \%App::Config::Variables::Data, helper => \%helper);
    }
}

1;