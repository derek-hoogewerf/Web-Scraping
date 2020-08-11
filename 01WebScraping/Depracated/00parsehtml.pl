#!/usr/bin/env perl

use strict;
use warnings;
use v5.010;
use HTML::TreeBuilder;
#use Mojo::DOM;
use Mojo::UserAgent;

my $ua = Mojo::UserAgent->new;

my $res = $ua ->get('mojolicious.org/perldoc')->result;

if    ($res->is_success)  { say $res->body }
elsif ($res->is_error)    { say $res->message }
elsif ($res->code == 301) { say $res->headers->location }
else                      { say 'Whatever...' }
#say $ua->get('www.☃.net?hello=there' => {Accept => '*/*'})->result->body;

say $ua->get('www.perl.org')->result->dom->at('title')->text;

print $res;
my $url = 'https://www.vremea.com/vremea-bucuresti/LRBS';

my $root = HTML::TreeBuilder->new_from_url( $url );
#print "$root";
my @elements1 = $root->look_down(sub{defined $_[0]->attr('name')});
for (@elements1) {
    print $_->attr('name'), "\n";
}

my $dom= Mojo::DOM->new($root);
print $dom->find('style')->text;

my $tree = HTML::TreeBuilder->new_from_file( \*DATA );
my @elements = $tree->look_down(
    sub { defined $_[0]->attr('name') }
);

for (@elements) {
    print $_->attr('name'), "\n";
}

__DATA__
<table name="content_analyzer" primary-key="id">
  <type="global" />
</table>
<table name="content_analyzer2" primary-key="id">
  <type="global" />
</table>
<table name="content_analyzer_items" primary-key="id">
  <type="global" />
</table>