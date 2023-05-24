use strict;
use warnings;

# Writing by Zhiyu Zheng, May 2023.
# Define Complex Number and caculate.

sub conj {
    my ($self) = @_;
    return Complex->new($self->{r}, -$self->{i});
}

package Complex;

use overload
    '+' => \&add,
    '-' => \&subtract,
    '*' => \&multiply,
    '/' => \&divide,
    '""' => \&stringify,
    '=' => \&assign,
    '==' => \&equal,
    'abs' => \&abs;

sub new {
    my ($class, $real, $imaginary) = @_;
    my $self = bless { r => $real, i => $imaginary }, $class;
    return $self;
}

sub r {
    my ($self, $real) = @_;
    if (defined $real) {
        $self->{r} = $real;
    }
    return $self->{r};
}

sub i {
    my ($self, $imaginary) = @_;
    if (defined $imaginary) {
        $self->{i} = $imaginary;
    }
    return $self->{i};
}

sub abs {
    my ($self) = @_;
    return sqrt($self->{r}**2 + $self->{i}**2);
}

sub add {
    my ($self, $other) = @_;
    my $real = $self->{r} + $other->{r};
    my $imaginary = $self->{i} + $other->{i};
    return Complex->new($real, $imaginary);
}

sub subtract {
    my ($self, $other) = @_;
    my $real = $self->{r} - $other->{r};
    my $imaginary = $self->{i} - $other->{i};
    return Complex->new($real, $imaginary);
}

sub multiply {
    my ($self, $other) = @_;
    my $real = $self->{r} * $other->{r} -
               $self->{i} * $other->{i};
    my $imaginary = $self->{r} * $other->{i} +
                    $self->{i} * $other->{r};
    return Complex->new($real, $imaginary);
}

sub divide {
    my ($self, $other) = @_;
    my $denominator = $other->{r}**2 + $other->{i}**2;
    my $real = ($self->{r} * $other->{r} +
                $self->{i} * -$other->{i}) / $denominator;
    my $imaginary = ($self->{i} * $other->{i} -
                     $self->{r} * -$other->{r}) / $denominator;
    return Complex->new($real, $imaginary);
}

sub stringify {
    my ($self) = @_;
    return "($self->{r}, " . "$self->{i}j)";
}

sub assign {
    my $other = @_;
    my $real = $other->{r};
    my $imaginary = $other->{i};
    return Complex->new($real, $imaginary);
}

sub equal {
    my ($self, $other) = @_;
    return $self->{r} == $other->{r} &&
           $self->{i} == $other->{i};
}

1;