package App::Controller::Login;
use Mojo::Base 'Mojolicious::Controller';
use Mojo::JSON qw(decode_json encode_json);
use App::Config::Variables;

sub index {
    my $self = shift;
    my %data = (
        mensaje => true
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
    my %helper = (
        title => 'Bienvenido', 
        css => 'dist/login.min.css',
        js_top   => 'http://localhost:3000/',
        js_bottom    => 'dist/login.min.js',
    );
    $self->render(template => 'login/index', variables => \%App::Config::Variables::Data, helper => \%helper);
}

1;