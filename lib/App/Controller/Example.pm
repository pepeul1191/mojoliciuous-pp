package App::Controller::Example;
use Mojo::Base 'Mojolicious::Controller';

sub welcome {
    my $self = shift;
    $self->render(template => 'example/welcome', msg => 'Welcome to the Mojolicious real-time web framework!');
}

1;
