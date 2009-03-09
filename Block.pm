package Block;

use strict;

###############################################################################

sub new {
    my ($class, $text) = @_;

    my $self = bless {}, $class;

    $self->{text} = $text;

    return $self;
}

sub type {
    my ($self) = @_;

    return "";
}

###############################################################################

sub open {
    my ($self) = @_;
}

sub close {
    my ($self) = @_;
}

sub print {
    my ($self) = @_;

    print _inline($self->{text});
}

sub _inline {
    my ($m) = @_;

    $m =~ s{\*(.*?)\*}{<b>$1</b>}gsm;                               # *text*            :   <b>text</b>
    $m =~ s{_(.*?)_}{<i>$1</i>}gsm;                                 # _text_            :   <i>text</i>
    $m =~ s{<<(.*?\.(png|jpg|gif))>>}{<img src="$1"/>}gsm;          # <<pic.png>>       :   <img src="pic.png">>
    $m =~ s{\[\[(.*?)\s+>>>\s+(.*?)\]\]}{<a href="$2">$1</a>}gsm;   # [[text >>> url]]  :   <a href="url">text</a>
    $m =~ s{  $}{<br/>}gsm;

    return $m;
}

###############################################################################

1;

