package App::Controller::Login;
use Mojo::Base 'Mojolicious::Controller';
use App::Config::Variables;

sub index {
    my $self = shift;
    $self->render(template => 'login/index', variables => \%App::Config::Variables::Data);
}

1;