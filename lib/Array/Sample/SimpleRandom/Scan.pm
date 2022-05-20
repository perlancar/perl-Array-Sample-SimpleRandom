package Array::Sample::SimpleRandom::Scan;

use 5.010001;
use strict;
use warnings;

use Exporter qw(import);

# AUTHORITY
# DATE
# DIST
# VERSION

our @EXPORT_OK = qw(sample_simple_random_no_replacement);

sub sample_simple_random_no_replacement {
    require Array::Pick::Scan;

    my ($ary, $n, $opts) = @_;
    Array::Pick::Scan::random_item($ary, $n, $opts);
}

1;
# ABSTRACT: Simple random sampling from an array (scan algorithm)

=head1 SYNOPSIS

 use Array::Sample::SimpleRandom::Scan qw(sample_simple_random_no_replacement);

 sample_simple_random_no_replacement([0,1,2,3,4,5], 1); # => (3)
 sample_simple_random_no_replacement([0,1,2,3,4,5], 1); # => (5)

 sample_simple_random_no_replacement([0,1,2,3,4,5], 3); # => (4,1,5)
 sample_simple_random_no_replacement([0,1,2,3,4,5], 3); # => (1,4,3)


=head1 DESCRIPTION


=head1 FUNCTIONS

=head2 sample_simple_random_no_replacement

Usage:

 my @items = sample_simple_random_no_replacement(\@ary, $n [ , \%opts ]);

This function takes an array reference (C<\@ary>) and the number of samples
requested (C<$n>) and will return a list of elements. Samples will be picked
without replacement, e.g. an element will not be chosen more than once (note
that it still possible to return duplicate values if the original array contain
duplicate values).

This function is the same as the one in L<Array::Sample::SimpleRandom>, except
that it uses a scan algorithm from L<Array::Pick::Scan>.

=over

=item * pos

Bool. If set to true, function will return positions instead of the items.

=back


=head1 FAQ

=head2 Why no sample_simple_random_with_replacement?

This kind of sampling does not require scanning algorithm.


=head1 SEE ALSO

L<Array::Sample::SimpleRandom>

Other sampling methods: L<Array::Sample::Partition>, L<Array::Sample::SysRand>,
L<Array::Sample::WeightedRandom>.
