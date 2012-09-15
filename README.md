btest
=====

btest is a unit testing tool which reports whether your commands succeed or fail as expected.

### Usage

	btest [yaml]  
 	btest-report [yaml]

'btest' shows the results of your command tests in console.  
'btest-report' generates XML reports for CI under the directory 'report'.

### YAML

	success:
    - command expected to succeed
    - ...
	error:
    - command expected to fail
    - ...

### Required Gems

	gem install rake
	gem install rspec
	gem install ci_reporter
