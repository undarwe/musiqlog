#!/usr/bin/perl -w

use strict;

use Text::Markdown 'markdown';
use Text::Typography 'typography';

sub marklite {
    my ($m) = @_;

    $m =~ s{<<(.*?)>>}{ m_inline($1); }gsme;
    $m =~ s{\[\[(.*?)\]\]}{ m_link($1); }gsme;
    $m =~ s{^\s*>>>\s*(.*?)$}{ m_block($1); }gsme;

    return typography(markdown($m));
}

###############################################################################

sub m_inline {
    my ($m) = @_;

    if ($m =~ m{\.(jpg|png|gif)}) { return i_image($m); }

    return "";
}

sub i_image {
    my ($m) = @_;

    return qq|<img src="$m"/>|;
}

###############################################################################

sub m_block {
    my ($m) = @_;

    if ($m =~ m{\.xspf}) { return b_xspf($m); }

    return "";
}

sub b_xspf {
    my ($m) = @_;

    return `xsltproc xspf2html.xsl $m`;
}

###############################################################################

sub m_link {
    my ($m) = @_;

    if ($m =~ m{^(.*?)\s+->\s+(.*?)$}) {
        return qq|<a href="$2">$1</a>|;
    } else {
        return qq|<a href="$m">$m</a>|;
    }
}

###############################################################################

1;

