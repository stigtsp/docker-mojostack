FROM stigtsp/perl
# Common modules that I use
ENV PERL_CPANM_OPT="--notest --verbose"

RUN apk add libpng-dev jpeg-dev libxml2-dev libressl-dev libressl zlib-dev

RUN cpanm -v Net::SSLeay
RUN cpanm -v LWP IO::Socket::SSL

RUN cpanm Mojolicious
RUN cpanm Mojo::JWT


RUN cpanm Imager
RUN cpanm Redis

RUN apk add mariadb-client mariadb-dev
RUN cpanm Mojo::SQLite Mojo::mysql DBD::mysql DateTime::Format::MySQL

RUN cpanm DBIx::Class DBIx::Class::InflateColumn::Serializer DBIx::Class::DynamicDefault DBIx::Class::Schema

# Common stuff
RUN cpanm \
  Modern::Perl Smart::Comments Perl6::Junction CLASS Hash::Merge \
  Date::Calc Date::Manip DateTime DateTime::Locale Time::Duration::Parse \
  YAML::XS JSON::XS JSON::MaybeXS Text::CSV_XS \
  Session::Token Crypt::PBKDF2 \
  Try::Tiny Carp::Assert::More \
  Data::Validate::IP Email::Valid Regexp::Common


