use strict;
use warnings;

use 5.006;

package Dist::Zilla::Plugin::PrePAN;

# ABSTRACT: Automatically set PrePAN author and module URLs

use Moose;
with 'Dist::Zilla::Role::MetaProvider';

has author => (
    is  => 'ro',
    isa => 'Str',
);

has module => (
    is  => 'ro',
    isa => 'Str',
);

sub metadata {
    my $self = shift;
    return {
        resources => {
            'x_prepan_author' => $self->author,
            'x_prepan_module' => $self->module
        }
    };
}
__PACKAGE__->meta->make_immutable;
no Moose;
1;

=head1 SYNOPSIS

In C<dist.ini>:

    [PrePAN]
    author = http://prepan.org/user/3Yz7PYrBzQ
    module = http://prepan.org/module/429En4oFdp

=head1 DESCRIPTION

This plugin sets a L<PrePAN.org> author and module URL for a distribution.

=head1 METHODS

=head2 author

This is the author URL. You'll need to create an account at PrePAN and
copy/paste it from there.  We can't infer the URL because it's not guessable.

    [PrePAN]
    author = http://prepan.org/user/3Yz7PYrBzQ

=head2 module

This is the module URL. After you've created an account, you'll need to post
your module description on PrePAN and copy/paste the URL from there.  We can't
infer the URL because it's not guessable.

    [PrePAN]
    module = http://prepan.org/module/429En4oFdp

=head2 metadata

Sets the author and/or module urls in the distribution's META file(s).

=cut
