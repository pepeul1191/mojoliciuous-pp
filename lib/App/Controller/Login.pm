package App::Controller::Login;
use Mojo::Base 'Mojolicious::Controller';
use App::Config::Variables;

sub index {
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