package Catalyst::ActionRole::FindViewByIsa;
use Moose::Role;
use List::MoreUtils qw/uniq/;
use namespace::autoclean;

sub BUILD { }

after 'BUILD' => sub {
    my ($self, $args) = @_;
    my $attrs = $args->{attributes};
    die("Catalyst::ActionRole::FindViewByIsa used without a FindViewByIsa attribute in /" . $self->reverse . "\n")
        unless $attrs->{FindViewByIsa};
};

after 'execute' => sub {
    my ($self, $controller, $c, @args ) = @_;
    return if $c->stash->{current_view};
    my $isa = $self->attributes->{FindViewByIsa}[0];
    if ($c->config->{default_view}) {
        my $view = $c->view($c->config->{default_view});
        $c->stash->{current_view} = $c->config->{default_view}
            if $view->isa($isa);
    }
    my @views = grep { $c->view($_)->isa($isa) } $c->views;
    die("$c does not have a view which is a subclass of $isa")
        unless scalar @views;
    $c->stash->{current_view} = $views[0];
};


=head1 NAME

Catalyst::ActionRole::FindViewByIsa - Select from the available application views by type

=head1 SYNOPSIS

    package MyApp::Controller::Foo;
    use Moose;

    BEGIN { extends 'Catalyst::Controller::ActionRole'; }


=head1 DESCRIPTION

If you are trying to write a generic controller component which will be reused within an application, you do not
want to mandate the use of one type of view, but if you're providing templates with your component, then
you need to be able to find a view of the appropriate type.

Therefore this action role will select a the view in the application which

=cut

1;
