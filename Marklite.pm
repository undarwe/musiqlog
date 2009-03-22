package Marklite;

use strict;

use Text::Markdown 'markdown';
use Text::Typography 'typography';

sub new {
    my ($class, $params) = @_;
    $params = $params || {};

    my $self = bless $params, $class;

    return $self;
}

sub out {
    my ($self) = @_;

    my $m = $self->{marklite};
    $m =~ s{<<(.*?)>>}{ $self->m_inline($1); }gsme;
    $m =~ s{\[\[(.*?)\]\]}{ $self->m_link($1); }gsme;
    $m =~ s{^\s*>>>\s*(.*?)$}{ $self->m_block($1); }gsme;

    return typography(markdown($m));
}

###############################################################################

sub m_inline {
    my ($self, $m) = @_;

    if ($m =~ m{\.(jpg|png|gif)$}) { return $self->i_image($m); }

    return "";
}

sub i_image {
    my ($self, $m) = @_;

    return qq|<img src="$m"/>|;
}

###############################################################################

sub m_block {
    my ($self, $m) = @_;

    if ($m =~ m{\.xspf}) { return $self->b_xspf($m); }

    return "";
}

sub b_xspf {
    my ($self, $m) = @_;

    return `xsltproc xspf2html.xsl $self->{dir}/$m`;
}

###############################################################################

sub m_link {
    my ($self, $m) = @_;

    if ($m =~ m{^(.*?)\s+->\s+(.*?)$}) {
        return qq|<a href="$2">$1</a>|;
    } else {
        return qq|<a href="$m">$m</a>|;
    }
}

###############################################################################

1;

