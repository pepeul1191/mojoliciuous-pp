package App::Controller::Login;
use Mojo::Base 'Mojolicious::Controller';
use App::Config::Variables;
use JSON;
use Mojo::Log;
use REST::Client;

my $log = Mojo::Log->new;

sub index {
    my $self = shift;
    #$log->debug('Not sure what is happening here');
    if ($self->session('autenticado' ) == 1){
        $self->redirect_to(%App::Config::Variables::Data{'BASE_URL'});
    }else{
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
}

sub acceder {
    my $self = shift;
    my $usuario = $self->param('usuario');
    my $contrasenia = $self->param('contrasenia');
    my $url = %App::Config::Variables::Data{'accesos'} . 'usuario/validar?usuario=' . $usuario . '&contrasenia=' . $contrasenia;
    my $client = REST::Client->new();
    $client->POST($url);

    if ($client->responseContent() == 1){
        $self->session({autenticado => 1});
        $log->debug('1 +++++++++++++++++++++++++++++++++++++++++++++');
        $log->debug('Not sure what is happening here');
        $log->debug('2 +++++++++++++++++++++++++++++++++++++++++++++');
        $self->redirect_to(%App::Config::Variables::Data{'BASE_URL'});
        $log->debug('3 +++++++++++++++++++++++++++++++++++++++++++++');
    }else{
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
}

sub salir{
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

    delete $self->session->{'autenticado'};

    $self->redirect_to(%App::Config::Variables::Data{'BASE_URL'} . 'login');
}

1;