btest
=====

btest is a testing tool which checks whether your commands succeed or fail as expected.

### Usage

	btest [yaml]  
 	btest-report [yaml]

'btest' shows the results of your command tests in console.  
'btest-report' generates test reports in JUnit XML format under the directory 'report'.

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
