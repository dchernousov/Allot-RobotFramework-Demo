# Allot RobotFramework Demo project

Allot Technical assessment

# Project structure

1. Library – This will be used for storing the custom libraries.
2. Resources – Resources folder will be used to write reusable codes. It would be mostly used for implementing Page
   Object structure and needed Test Data.
3. Results – This directory will be used for saving the Test execution logs and results.
4. Tests – This will be used to write our Robot Tests.

# Pre-conditions

1. Git 2.34.3
2. Python 3.9.13
3. PyCharm 2022.2.1 (Community Edition)
4. Robot Framework 5.0.1 (Python 3.9.13 on win32)
5. Needed to be installed XML, RequestsLibrary, SeleniumLibrary, JSONLibrary, and other if needed through pip is the
   package installer for Python.

Please use the latest versions for a compliance code execution.
Just install the latest version
See the following example:
`pip install robotframework`
Be aware that it does not upgrade (see tutorials below)

# How to Run Robot Tests

Run from Terminal `robot -d Results Tests/TestName.robot` to execute a single Test.
Run `robot -d Results Tests` to execute all Tests.

# How To See Results

Go to `Results` folder to get the HTML Reports.

Run `robot --help and rebot --help` for more information about the command line usage.
For a complete reference manual see
Robot Framework User Guide.

# Please see used materials:

- https://github.com/robotframework/robotframework
- https://github.com/fkromer/awesome-robotframework
- https://github.com/adrianyorke/robotframework-cookbook
- https://github.com/robotframework/HowToWriteGoodTestCases

And (of course):

- https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#getting-started
- http://robotframework.org/robotframework/#user-guide