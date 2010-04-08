#!/usr/bin/env perl

use warnings;
use strict;

use lib qw(../lib);

use Reflex::Timer;
use Reflex::Callbacks qw(cb_promise);
use ExampleHelpers qw(eg_say);

my $watcher = Reflex::Object->new();

my $promise;
my $timer = Reflex::Timer->new(
	interval    => 1,
	auto_repeat => 1,
);

$watcher->observe($timer, cb_promise(\$promise));

while (my $event = $promise->wait()) {
	eg_say("wait() returned an event (@$event)");
}