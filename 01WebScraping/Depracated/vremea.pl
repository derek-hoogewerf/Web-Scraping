#!/usr/bin/env perl

use strict;
use warnings;
use v5.010;

use Mojo::UserAgent;

my $ua = Mojo::UserAgent->new;

my $res = $ua ->get('https://www.vremea.com/vremea-bucuresti/LRBS')->result;
if    ($res->is_success)  { say $res->body }
elsif ($res->is_error)    { say $res->message }
elsif ($res->code == 301) { say $res->headers->location }
else                      { say 'Whatever...' }

#say $ua->get('www.perl.org')->
say $res->dom->at('title')->text;
say $res->dom->at('script')->text;

say $ua->get('blogs.perl.org')
  ->result->dom->find('h2 > a')->map('text')->join("\n");