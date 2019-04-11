# Unirede API

## Summary
Unirede API is a simple solution to register users !

The api was developed in  rails 5 api mode.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

To help run in terminal:
```
make help
```

### Prerequisites

Before all, you need to have ruby installed in your computer.
I recommend you to use a language manager.
For more informations you can access [RVM](https://rvm.io/) or [Rbenv](https://github.com/rbenv/rbenv).

### Installing

After install Rbenv or RVM, clone and run in terminal:
```
make setup
```

### Running the locally

After install, run in terminal:
```
make run
```
After this, you can access the app in http://localhost:4000/.

## Running the tests

Run in terminal:
```
make test
```

For automated tests in dev, run:
```
make auto-test
```

For test coverage with results (in Linux), run:
```
make test-cov
```

## Deployment

TODO:
* MVP => Prod configs to deploy in Heroku

## Contributing

* Only have to fork the project and make a pull request.

## Git Style

We use something like [Karma](http://karma-runner.github.io/1.0/dev/git-commit-msg.html) for commit messages.
Besides this, for new branchs use names in this format:
```
type/description
```
For example: to create a new branch that is responsible for create user permissions you must use feat/create-user-permissions.

## Versioning

We use [SemVer](http://semver.org/) for versioning.

## License

Not yet defined.

## Final Notes
Future improvements (TO DO):
* Add serializer to user index route action;
* Use Json Web Token;
* Use Docker to easy DevOps;
* Use sidekiq and redis to support multiple simultaneous access;

Last worked branch: master

Doubts? Problems? send an email to magnunavf@gmail.com