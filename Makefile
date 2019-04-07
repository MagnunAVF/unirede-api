help:
	@echo 'Makefile for Unirede-API                                              '
	@echo '                                                                      '
	@echo 'Usage:                                                                '
	@echo '   setup                   Install all dependencies to dev            '
	@echo '   db_clean                Delete all DBs and create new ones         '
	@echo '   reset                   Clean all dbs, all assets and setup again  '
	@echo '   test                    Run all tests                              '
	@echo '   test-cov                Run all tests with coverage result         '
	@echo '   auto-test               Automated tests init                       '

setup:
	bundle install
	@make db_create

reset:
	@make db_clean

db_clean:
	bundle exec rake db:drop
	@make db_create

db_create:
	bundle exec rake db:create
	bundle exec rake db:migrate
	bundle exec rake db:seed

test:
	rspec

test-cov:
	@make test
	sensible-browser ./coverage/index.html

auto-test:
	bundle exec guard

.PHONY: help, setup, clean, test, test-cov, auto-test
