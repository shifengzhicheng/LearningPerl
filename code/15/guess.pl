#!/usr/bin/perl -w
use strict;
use CGI qw/:standard/;

my ($goal, @history, $guess);

my @keys = param( );

print @keys ? checkGuess() : newGuess();

1;

sub form {
	start_form('GET', '/cgi-bin/guess.pl') .
	"Guess: " .
	textfield(
		-name => 'guess',
		-default => $guess,
		-size => '5',
		-maxlength => '2',
		) .
	hidden(
		-name => 'goal',
		-default => [$goal],
		) .
	hidden(
		-name => 'history',
		-default => [join('_', @history)],
		) .
	p() .
	submit(
		-name => 'submit',
		-value => 'Guess'
		) .
	reset('Clear') .
	end_form();
}

sub newGuess {
	$goal = int rand 100;
	@history = ();
	$guess = '';
	header .
	start_html(
		-title	=>	'New Guess',
		-text	=>	'darkgreen',
		-bgcolor=>	'lightgreen',
		) .
	h3('Guess a number between 0 .. 99') .
	form() .
	end_html;
}

sub checkGuess {
	$goal = param('goal');
	@history = split /_/, join '_', param('history');
	$guess = param('guess');
	Delete_all();
	push @history, $guess if $guess =~ /^[0-9]+$/;
	return ($guess == $goal) ? madeGuess() : continueGuess();
}

sub madeGuess {
	header .
	start_html(
		-title	=>	'Guess made',
		-text	=>	'darkgreen',
		-bgcolor=>	'lightgreen',
		) .
	h3('Great!') .
	'History of your guess:' .
	p(join(',', @history)) .
	p(a({-href=>'/cgi-bin/guess.pl'}, 'New game')) .
	end_html;
}

sub continueGuess {
	header .
	start_html(
		-title	=>	'Guess continue',
		-text	=>	'darkgreen',
		-bgcolor=>	'lightgreen',
		) .
	p($guess =~ /^[0-9]+$/ ?
		$guess > $goal ? "$guess is too big" : 
		"$guess is too small" : "Input a number") .
	form() .
	end_html;
}

1;
