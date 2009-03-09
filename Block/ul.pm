package Block::ul;

use strict;
use Block::ul;

our(@ISA);
@ISA = qw( Block );

###############################################################################

sub type {
    my ($self) = @_;

    return "ul";
}

sub open {
    my ($self) = @_;

    print "<ul>\n";
}

sub close {
    my ($self) = @_;

    print "</ul>\n\n";
}

sub print {
    my ($self) = @_;

    print "  <li>";
    $self->SUPER::print();
    print "</li>\n";
}

###############################################################################

1;

