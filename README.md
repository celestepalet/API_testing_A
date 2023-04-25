# API_testing_A / WORDPRESS API TESTING

This is a Hybrid Framework for test the main functionalities of WordPress REST API. The framework is developed using Robot-Framework and Python, executed on Docker images of WordPress and MySQL.

### Table of contents

1. Getting started
2. Initial configuration

    2.1. Set environment

    2.2. Set PYTHONPATH
3. Framework Structure
4. Execution
5. References

------------------------
### 1. Getting started

For run this project will be necessary install WordPress 6.2, Mysql 5.7, Python 3.8, pip 23.0.1 and all the requirements in requirements.txt
1. Install WordPress locally and its DB:

   1. Install Docker and docker compose 
   2. Download the docker-compose in https://github.com/celestepalet/Run-Wordpress-Locally
   3. In a bash terminal run $ docker compose up -d 
   4. Go to http://localhost:80/
   5. Set English Language and follow the instructions for finish the installation 
   6. Install in WordPress the plugin "WordPress REST API Authentication"
   7. Activate the plugin
   
2. Install Python 3.8
3. Clone the repository
3. Create a virtual environment with pip 23.0.1(terminal command: pip -m venv venv)
4. Activate your environment (terminal command for window: venv\Scripts\activate) (terminal command for linux: venv/bin/activate)
5. Install requirements (terminal command: pip install -r requirements.txt)


### 2. Initial Configuration


2.1. Set Environment:

For run this project will be necessary install WordPress 6.2, Mysql 5.7, Python 3.8, pip 23.0.1 and all the requirements in requirements.txt
        
1.Install WordPress locally and its DB:
  - Install Docker and docker compose 
  - Download the docker-compose in https://github.com/celestepalet/Run-Wordpress-Locally
  - In a bash terminal run $ docker compose up -d
  - Go to http://localhost:80/ 
  - Set English Language and follow the instructions for finish the installation
  - Install in WordPress the plugin "WordPress REST API Authentication"
  - Activate the plugin


Configure the environment in IDE, setting the follow environment variables.

Environment variables used:

| Variable | Value                   | Description                                                         |
|---------|-------------------------|---------------------------------------------------------------------|
| USER    | your WordPress username | This is your WordPress project username                             |
| PASSWORD | your WordPress password | This is your WordPress project password                             |
| URL     | http://localhost        | This is the base URL where your app is running                      |
| URL_EXTENSION| wp-json/wp/v2           | This is teh part os the url that you nedd for acces to the endpoint |

For pycharm:

  - Install EnvFile plugin
  - Restart IDE
  - Edit Run Configuration
  - Add new python run configuration
  - In "Configuration" tab select: 
    - In "Module name" write robot
    - In "Parameters" write -d results wordpress/tests
    - In "Working directory" add the project path
  - In "EnvFile" tab select "Enable EnvFile" and add the .env file of the project
        
2.2. Set PYTHONPATH:

In bash terminal run the command: PYTHONPATH=$PWD


### 3. Framework Structure

         /
         ├── libraries                         (Custom Python libraries)
         │   ├── authentication.py             (Method for get API authentication)
         │   ├── format_response.py            (Gives format to request response)
         │   ├── get_element.py                (Gets element from iterable variable)
         │   ├── get_api_url.py                (Provides the url for the endpoint request)
         │   ├── make_request.py               (Makes a request to API endpoint)
         │   └── validate_status_response.py   (Validate the status code of a response)
         |
         ├── results                           (Save the logs and reports)
         |
         └── wordpress                         (Robot-framework and python files specific for test WordPress API)
             ├── src                           (Python files personalize for each endpoint)       
             |    ├── actions                      
             |    ├── states                      
             |    └── verifications
             |
             ├── commonkeywords                (Keywords that are common in several files)
             |    ├── crud                     (Tests cases for minimal functionalities)
             |    ├── categories  
             |    ├── commnents  
             |    ├── pages  
             |    ├── posts  
             |    └── users
             |
             ├── resources                      (Files to provide resources to the project)
             |    ├── config                    (Files to configurate the project)
             |    ├── data   
             |    ├── script                 
             |    └── json                      (Json files with request schemas)
             |                        
             └── tests                          (Set of test suites or test cases in robot-framework files)
                  └── e2e                       (End to end tests cases)
                      ├── categories                      
                      ├── comments   
                      ├── pages 
                      ├── posts 
                      └── users      
            
### 4. Execution examples

For run the test and open the reports in a Window PowerShell terminal use the script "run_test.ps1"
   
1. Open a PowerShell terminal

2. GO to the project root folder

3. Activate virtual environment: venv\Scripts\activate

4. Run the command: & 'path_to_project_root\wordpress\resources\scripts\run_test.ps1'

Also, the Test can be run by executing the following commands:

1. robot -d reports wordpress/tests/e2e/post/test.robot  

    This command is used to execute the file "test.robot" from "post" endpoint and saves the output 
    in the "reports" directory.If the -d option is not set the output is saved in the root directory.

2. robot -d reports wordpress/tests/  

    This command is used to execute all the test suit in the project and save the reports in reports 
    directory.

3. robot -d reports  --loglevel TRACE wordpress/tests/e2e/post/test.robot 

    This command can be used to execute the file "test.robot", saves the output in results directory 
    and --loglevel TRACE is used for the details level in the output reports, TRACE indicates to 
    generate a very verbose logs report.

4. robot -d reports -i Smoke wordpress/tests/e2e/posts

    This command is used to execute suite from the "posts" endpoint and saves the output in the 
    "reports" directory. The -i Smoke option indicates to only execute the test cases with "Smoke" 
    tag defined.


### 5. References
https://github.com/robotframework/HowToWriteGoodTestCases/blob/master/HowToWriteGoodTestCases.rst

https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html
