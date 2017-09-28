package App::Controller::Login;
use Mojo::Base 'Mojolicious::Controller';
use App::Config::Variables;
use JSON;

sub index {
    my $self = shift;
    my %data = (
        mensaje => JSON::false
    ); 
    my %helper = (
        title => 'Bienvenido', 
        css => 'dist/login.min.css',
        js_top => 'http://localhost:3000/',
        js_bottom => 'dist/login.min.js',
        data => encode_json \%data,
    );
    $self->render(template => 'login/index', variables => \%App::Config::Variables::Data, helper => \%helper);
}

sub acceder {
    my $self = shift;
    my $usuario = $self->param('usuario');
    my $contrasenia = $self->param('contrasenia');
    my %data = (
        mensaje => JSON::true
    ); 
    my %helper = (
        title => 'Bienvenido', 
        css => 'dist/login.min.css',
        js_top => 'http://localhost:3000/',
        js_bottom => 'dist/login.min.js',
        data => encode_json \%data,
    );
    $self->render(template => 'login/index', variables => \%App::Config::Variables::Data, helper => \%helper);
}

1;