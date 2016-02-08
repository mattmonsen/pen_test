package Auth;

use warnings;
use strict;

our $users = {
    matt => 'matt1234',
    bob  => 'bob1234',
    mary => 'mary1234',
    john => 'john1234',
};

sub new {
    my ($class, $args) = @_;
    $args ||= {};
    my $self = bless $args, $class;
    return $self;
}   

# Check valid user, if not in the hash then return right away
# Then do a password lookup on the user if it was valid
sub valid_user {
    my ($self, $user, $pass) = @_;
    return 0 if ! $users->{$user};
    return 1 if $self->check_pass($user, $pass);
}

sub check_pass {
    my ($self, $user, $pass) = @_;
    sleep (1); # Mock some password look up that takes time 
    return $users->{$user} && $pass eq $users->{$user} ? 1 : 0;
}

1;
