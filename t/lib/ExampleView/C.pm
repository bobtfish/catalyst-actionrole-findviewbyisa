package ExampleView::C;
use Moose;
use namespace::autoclean;
with 'ExampleView';

__PACKAGE__->meta->make_immutable;
