#!perl
use strict;
use warnings;

use Test::More;

BEGIN {
    use_ok('Time::Moment');
}

{
    my $tm = Time::Moment->from_string("2012-12-24T12:30:45.123456789Z");
    for my $year (1, 100, 1000, 2000, 9999) {
        my $got = $tm->with_year($year);

        my $prefix = "$tm->with_year($year)";
        is($got->year,            $year, "$prefix->year");
        is($got->month,              12, "$prefix->month");
        is($got->day_of_month,       24, "$prefix->day_of_month");
        is($got->hour,               12, "$prefix->hour");
        is($got->minute,             30, "$prefix->minute");
        is($got->second,             45, "$prefix->second");
        is($got->millisecond,       123, "$prefix->millisecond");
        is($got->microsecond,    123456, "$prefix->microsecond");
        is($got->nanosecond,  123456789, "$prefix->nanosecond");
    }
}

{
    my $tm = Time::Moment->from_string("2012-12-24T12:30:45.123456789Z");
    for my $month (1..12) {
        my $got = $tm->with_month($month);

        my $prefix = "$tm->with_month($month)";
        is($got->year,             2012, "$prefix->year");
        is($got->month,          $month, "$prefix->month");
        is($got->day_of_month,       24, "$prefix->day_of_month");
        is($got->hour,               12, "$prefix->hour");
        is($got->minute,             30, "$prefix->minute");
        is($got->second,             45, "$prefix->second");
        is($got->millisecond,       123, "$prefix->millisecond");
        is($got->microsecond,    123456, "$prefix->microsecond");
        is($got->nanosecond,  123456789, "$prefix->nanosecond");
    }
}

{
    my $tm = Time::Moment->from_string("2012-12-24T12:30:45.123456789Z");
    for my $day (1..31) {
        my $got = $tm->with_day_of_month($day);

        my $prefix = "$tm->with_day_of_month($day)";
        is($got->year,             2012, "$prefix->year");
        is($got->month,              12, "$prefix->month");
        is($got->day_of_month,     $day, "$prefix->day_of_month");
        is($got->hour,               12, "$prefix->hour");
        is($got->minute,             30, "$prefix->minute");
        is($got->second,             45, "$prefix->second");
        is($got->millisecond,       123, "$prefix->millisecond");
        is($got->microsecond,    123456, "$prefix->microsecond");
        is($got->nanosecond,  123456789, "$prefix->nanosecond");
    }
}

{
    my $tm = Time::Moment->from_string("2012-359T12:30:45.123456789Z");
    for my $day (1..366) {
        my $got = $tm->with_day_of_year($day);

        my $prefix = "$tm->with_day_of_year($day)";
        is($got->year,             2012, "$prefix->year");
        is($got->day_of_year,      $day, "$prefix->day_of_year");
        is($got->hour,               12, "$prefix->hour");
        is($got->minute,             30, "$prefix->minute");
        is($got->second,             45, "$prefix->second");
        is($got->millisecond,       123, "$prefix->millisecond");
        is($got->microsecond,    123456, "$prefix->microsecond");
        is($got->nanosecond,  123456789, "$prefix->nanosecond");
    }
}

{
    my $tm = Time::Moment->from_string("2012-12-24T12:30:45.123456789Z");
    for my $day (1..92) {
        my $got = $tm->with_day_of_quarter($day);

        my $prefix = "$tm->with_day_of_quarter($day)";
        is($got->year,             2012, "$prefix->year");
        is($got->day_of_quarter,   $day, "$prefix->day_of_quarter");
        is($got->hour,               12, "$prefix->hour");
        is($got->minute,             30, "$prefix->minute");
        is($got->second,             45, "$prefix->second");
        is($got->millisecond,       123, "$prefix->millisecond");
        is($got->microsecond,    123456, "$prefix->microsecond");
        is($got->nanosecond,  123456789, "$prefix->nanosecond");
    }
}

{
    my $tm = Time::Moment->from_string("2012-12-24T12:30:45.123456789Z");
    for my $hour (0..23) {
        my $got = $tm->with_hour($hour);

        my $prefix = "$tm->with_hour($hour)";
        is($got->year,             2012, "$prefix->year");
        is($got->month,              12, "$prefix->month");
        is($got->day_of_month,       24, "$prefix->day_of_month");
        is($got->hour,            $hour, "$prefix->hour");
        is($got->minute,             30, "$prefix->minute");
        is($got->second,             45, "$prefix->second");
        is($got->millisecond,       123, "$prefix->millisecond");
        is($got->microsecond,    123456, "$prefix->microsecond");
        is($got->nanosecond,  123456789, "$prefix->nanosecond");
        is($got->offset,              0, "$prefix->offset");
    }
}

{
    my $tm = Time::Moment->from_string("2012-12-24T12:30:45.123456789+12:34");
    for my $hour (0..23) {
        my $got = $tm->with_hour($hour);

        my $prefix = "$tm->with_hour($hour)";
        is($got->year,             2012, "$prefix->year");
        is($got->month,              12, "$prefix->month");
        is($got->day_of_month,       24, "$prefix->day_of_month");
        is($got->hour,            $hour, "$prefix->hour");
        is($got->minute,             30, "$prefix->minute");
        is($got->second,             45, "$prefix->second");
        is($got->millisecond,       123, "$prefix->millisecond");
        is($got->microsecond,    123456, "$prefix->microsecond");
        is($got->nanosecond,  123456789, "$prefix->nanosecond");
        is($got->offset,       12*60+34, "$prefix->offset");
    }
}

{
    my $tm = Time::Moment->from_string("2012-12-24T12:30:45.123456789Z");
    for my $minute (0..59) {
        my $got = $tm->with_minute($minute);

        my $prefix = "$tm->with_minute($minute)";
        is($got->year,             2012, "$prefix->year");
        is($got->month,              12, "$prefix->month");
        is($got->day_of_month,       24, "$prefix->day_of_month");
        is($got->hour,               12, "$prefix->hour");
        is($got->minute,        $minute, "$prefix->minute");
        is($got->second,             45, "$prefix->second");
        is($got->millisecond,       123, "$prefix->millisecond");
        is($got->microsecond,    123456, "$prefix->microsecond");
        is($got->nanosecond,  123456789, "$prefix->nanosecond");
        is($got->offset,              0, "$prefix->offset");
    }
}

{
    my $tm = Time::Moment->from_string("2012-12-24T12:30:45.123456789+12:34");
    for my $minute (0..59) {
        my $got = $tm->with_minute($minute);

        my $prefix = "$tm->with_minute($minute)";
        is($got->year,             2012, "$prefix->year");
        is($got->month,              12, "$prefix->month");
        is($got->day_of_month,       24, "$prefix->day_of_month");
        is($got->hour,               12, "$prefix->hour");
        is($got->minute,        $minute, "$prefix->minute");
        is($got->second,             45, "$prefix->second");
        is($got->millisecond,       123, "$prefix->millisecond");
        is($got->microsecond,    123456, "$prefix->microsecond");
        is($got->nanosecond,  123456789, "$prefix->nanosecond");
        is($got->offset,       12*60+34, "$prefix->offset");
    }
}

{
    my $tm = Time::Moment->from_string("2012-12-24T12:30:45.123456789Z");
    for my $second (0..59) {
        my $got = $tm->with_second($second);

        my $prefix = "$tm->with_second($second)";
        is($got->year,             2012, "$prefix->year");
        is($got->month,              12, "$prefix->month");
        is($got->day_of_month,       24, "$prefix->day_of_month");
        is($got->hour,               12, "$prefix->hour");
        is($got->minute,             30, "$prefix->minute");
        is($got->second,        $second, "$prefix->second");
        is($got->millisecond,       123, "$prefix->millisecond");
        is($got->microsecond,    123456, "$prefix->microsecond");
        is($got->nanosecond,  123456789, "$prefix->nanosecond");
        is($got->offset,              0, "$prefix->offset");
    }
}

{
    my $tm = Time::Moment->from_string("2012-12-24T12:30:45.123456789+12:34");
    for my $second (0..59) {
        my $got = $tm->with_second($second);

        my $prefix = "$tm->with_second($second)";
        is($got->year,             2012, "$prefix->year");
        is($got->month,              12, "$prefix->month");
        is($got->day_of_month,       24, "$prefix->day_of_month");
        is($got->hour,               12, "$prefix->hour");
        is($got->minute,             30, "$prefix->minute");
        is($got->second,        $second, "$prefix->second");
        is($got->millisecond,       123, "$prefix->millisecond");
        is($got->microsecond,    123456, "$prefix->microsecond");
        is($got->nanosecond,  123456789, "$prefix->nanosecond");
        is($got->offset,       12*60+34, "$prefix->offset");
    }
}

{
    my $tm = Time::Moment->from_string("2012-12-24T12:30:45.123456789+12:34");
    for my $millisecond (0, 123, 456, 999) {
        my $microsecond = $millisecond * 1000;
        my $nanosecond  = $microsecond * 1000;
        my $got = $tm->with_millisecond($millisecond);

        my $prefix = "$tm->with_millisecond($millisecond)";
        is($got->year,                2012, "$prefix->year");
        is($got->month,                 12, "$prefix->month");
        is($got->day_of_month,          24, "$prefix->day_of_month");
        is($got->hour,                  12, "$prefix->hour");
        is($got->minute,                30, "$prefix->minute");
        is($got->second,                45, "$prefix->second");
        is($got->millisecond, $millisecond, "$prefix->millisecond");
        is($got->microsecond, $microsecond, "$prefix->microsecond");
        is($got->nanosecond,   $nanosecond, "$prefix->nanosecond");
        is($got->offset,          12*60+34, "$prefix->offset");
    }
}

{
    my $tm = Time::Moment->from_string("2012-12-24T12:30:45.123456789+12:34");
    for my $microsecond (0, 123, 456, 123_456, 999_999) {
        my $millisecond = int($microsecond / 1000);
        my $nanosecond  = $microsecond * 1000;
        my $got = $tm->with_microsecond($microsecond);

        my $prefix = "$tm->with_microsecond($microsecond)";
        is($got->year,                2012, "$prefix->year");
        is($got->month,                 12, "$prefix->month");
        is($got->day_of_month,          24, "$prefix->day_of_month");
        is($got->hour,                  12, "$prefix->hour");
        is($got->minute,                30, "$prefix->minute");
        is($got->second,                45, "$prefix->second");
        is($got->millisecond, $millisecond, "$prefix->millisecond");
        is($got->microsecond, $microsecond, "$prefix->microsecond");
        is($got->nanosecond,   $nanosecond, "$prefix->nanosecond");
        is($got->offset,          12*60+34, "$prefix->offset");
    }
}

{
    my $tm = Time::Moment->from_string("2012-12-24T12:30:45.123456789+12:34");
    for my $nanosecond (0, 123, 456, 123_456, 123_456_789, 999_999_999) {
        my $microsecond = int($nanosecond / 1000);
        my $millisecond = int($microsecond / 1000);
        my $got = $tm->with_nanosecond($nanosecond);

        my $prefix = "$tm->with_nanosecond($nanosecond)";
        is($got->year,                2012, "$prefix->year");
        is($got->month,                 12, "$prefix->month");
        is($got->day_of_month,          24, "$prefix->day_of_month");
        is($got->hour,                  12, "$prefix->hour");
        is($got->minute,                30, "$prefix->minute");
        is($got->second,                45, "$prefix->second");
        is($got->millisecond, $millisecond, "$prefix->millisecond");
        is($got->microsecond, $microsecond, "$prefix->microsecond");
        is($got->nanosecond,   $nanosecond, "$prefix->nanosecond");
        is($got->offset,          12*60+34, "$prefix->offset");
    }
}

done_testing();

