help:
	@echo 'Makefile for Unirede-API                                              '
	@echo '                                                                      '
	@echo 'Usage:                                                                '
	@echo '   run                     Run api in localhost:3000                  '
	@echo '   setup                   Install all dependencies to dev            '
	@echo '   db-clean                Delete all DBs and create new ones         '
	@echo '   reset                   Clean all dbs, all assets and setup again  '
	@echo '   test                    Run all tests                              '
	@echo '   test-cov                Run all tests with coverage result         '
	@echo '   auto-test               Automated tests init                       '

setup:
	bundle install
	@make db-create

run:
	rails s -p 4000

reset:
	@make db-clean

db-clean:
	bundle exec rake db:drop
	@make db-create

db-create:
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

.PHONY: help, setup, run, clean, test, test-cov, auto-test
