package App;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;

     $self->hook(before_dispatch => sub {
        my $c = shift;
        $c->res->headers->header('Access-Control-Allow-Origin' => '*');
        $c->res->headers->header('x-powered-by' => 'Mojolicious (Perl)');
        $c->res->headers->header('Server' => 'Ubuntu');
    });

    # Documentation browser under "/perldoc"
    $self->plugin('PODRenderer');

    # Router
    my $r = $self->routes;

    # Normal route to controller
    $r->get('/')->to('example#welcome');
    $r->get('/login')->to('login#index');
    $r->post('/login/acceder')->to('login#acceder');
}

1;