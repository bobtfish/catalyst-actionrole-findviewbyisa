package ExampleView;
use Moose::Role;
use namespace::autoclean;

sub process {
    my ($self, $c) = @_;
    $c->res->body("Processed by view " . blessed($self));
}

1;

