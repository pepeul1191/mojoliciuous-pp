package App;
use Mojo::Base 'Mojolicious';
use Mojo::Log;
# This method will run once at server start
my $log = Mojo::Log->new;

sub startup {
    my $self = shift;
    $self->hook(before_dispatch => sub {
        my $c = shift;
        $c->res->headers->header('Access-Control-Allow-Origin' => '*');
        $c->res->headers->header('x-powered-by' => 'Mojolicious (Perl)');
        #$c->res->headers->header('Set-Cookie' => 'PLAY_SESSION');
        $c->res->headers->header('Server' => 'Ubuntu');
    });
    # Documentation browser under "/perldoc"
    $self->plugin('PODRenderer');
    # Router
    my $r = $self->routes;
    # conditions
    $r->add_condition(session => sub {
        my ($route, $c, $captures, $session) = @_;
         $log->debug('1 ++++++++++++++++++++++++++++++++++++++++++++');
        $log->debug('Not sure what is happening here');
        $log->debug('Not sure what is happening here');
         if ($session == 1){
            $c->redirect_to(%App::Config::Variables::Data{'BASE_URL'} . 'home');
         }
        $log->debug('2 ++++++++++++++++++++++++++++++++++++++++++++');
        return 1;
    });
    # Normal route to controller
    $r->get('/')->to('example#welcome');
    $r->get('/login')->over(session => 0, session => 1)->to('login#index');
    $r->get('/salir')->to('login#salir');
    $r->post('/login/acceder')->to('login#acceder');
}

1;