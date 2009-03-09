package Block::xspf;

use strict;
use Block;

our(@ISA);
@ISA = qw( Block );

###############################################################################

sub print {
    my ($self) = @_;

    print `xsltproc xspf2html.xsl $self->{text}`;
}

###############################################################################

1;

