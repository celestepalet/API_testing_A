# API_testing_A

Authorization

In order to be authenticated in Wordpress, you need to create a .env file with your credentials

SETTING UP PROJECT

1. Installing python 3.8 on Machine

2. Clone project (temrinal command: git clone https://github.com/celestepalet/API_testing_A.git)

3. Create a virtual environment (temrinal command: pip -m venv venv)

4. Activate your environment (temrinal command for window: venv\Scripts\activate) (temrinal command for linux: venv/bin/activate)

5. Install requirements (temrinal command: pip install requirements.txt)

6. Set your password, user name and url for wordpress in .env file

7. Set PYTHONPATH (terminal command: PYTHONPATH=$PWD) (For IDE set the PYTHONPATH in setting)


RUNING TEST SUITE

In terminal use the command : robot -d results wordpress/tests/

REFERENCE
https://github.com/robotframework/HowToWriteGoodTestCases/blob/master/HowToWriteGoodTestCases.rst
https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html


