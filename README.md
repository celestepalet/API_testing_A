# API_testing_A / WORDPRESS API TESTING

This is a Hybrid Framework for test the main functionalities of WordPress REST API. The framework is developed using Robot-Framework and Python, executed on Docker images of WordPress and MySQL.

## Table of contents

1. Getting started
2. Initial configuration
  2.1. Set environment
  2.2. Set PYTHONPATH
3. Framework Structure
4. Execution
5. Required python libraries
6. References

   1.  Getting started

        For run this project will be necessary install WordPress 6.2, Mysql 5.7, Python 3.8, pip 23.0.1 and all the requirements in requirements.txt
        1. Install WordPress locally and its DB:
                                1. Install Docker and docker compose 
                                2. Download the docker-compose in https://github.com/celestepalet/Run-Wordpress-Locally
                                3. In a bash terminal run $ docker compose up -d
                                4. Go to http://localhost:80/ and follow the instructions for finish the installation
                                5. Install in WordPress the plugin "WordPress REST API Authentication"
                                6. Activate the plugin

        2. Install Python 3.8
        3. Clone the repository
        3. Create a virtual environment with pip 23.0.1(terminal command: pip -m venv venv)
        4. Activate your environment (terminal command for window: venv\Scripts\activate) (terminal command for linux: venv/bin/activate)
        5. Install requirements (terminal command: pip install -r requirements.txt)


   2. Initial Configuration

        1. Set Environment
          Configure the environment in IDE, setting the follow environment variables.

          Environment variables used:

          ![img.png](img.png)

            For pycharm:
                  1. Install EnvFile
                  2. Restart IDE
                  3. Edit Run Configuration
                  4. Add new python run configuration
                  5. In "Configuration" tab select: In "Module name" write robot
                  In "Parameters" write -d results wordpress/tests
                  In "Working directory" add the project path
                  6. In "EnvFile" tab select "Enable EnvFile" and add the .env file of the project
        
       2. Set PYTHONPATH 
          In bash terminal run the command: PYTHONPATH=$PWD


  3. Framework Structure

          /
          ├── libraries                         (Custom Python libraries)
          │   ├── authentication                (Method for get API authentication)
          │   ├── format_response               (Gives format to request response)
          │   ├── get_element                   (Gets element from iterable variable)
          │   ├── get_url                       (Provides the basic and complete url for the request)
          │   ├── make_request                  (Makes a request to API endpoint)
          │   └── validation                    (Validate the status code of a response)
          |
          ├── results                           (Save the logs and reports)
          |
          └── wordpress                         (Robot-framework and python files specific for WordPress API)
              ├── src                           (Python files personalize for each endpoint)       
              |                  
              ├── resources                     (Files to provide resources to the project)
              |   ├── config                    (Files to configurate the project)
              |   |      └── config.py          (File to provide the environment variables to the project)  
              |   |                  
              |   └── json                      (Json files with schemas)
              |                        
              └── tests                         (Set of test suites or test cases in robot-framework files)
                  ├── e2e                       (End to end tests cases)
                  ├── crud                      (Tests cases for minimal funtionalities)
                  └── commonkeywords            (Keywords that are common in several files)
            
     4. Execution examples

             The Test can be runned executing the following commands:

             1. robot -d reports wordpress/tests/e2e/post/test.robot  
                 This command is used to execute the file "test.robot" from "post" endpoint and saves the output 
                 in the "reports" directory.If the -d option is not set the output is saved in the root directory.

             2. robot -d reports wordpress/tests/  
                 This command is used to execute all the test suit in the project and save the reports in reports 
                 directory.

             3. robot -d reports  --loglevel TRACE wordpress/tests/e2e/post/test.robot 
                 This command can be used to execute the file "test.robot", saves the output in results directory 
                 and --loglevel TRACE is used for the details level in the output reports, TRACE indicates to 
                 generate a very verbouse logs report.

             4. robot -d reports -i Smoke wordpress/tests/e2e/posts
                 This command is used to execute suite from the "posts" endpoint and saves the output in the 
                 "reports" directory. The -i Smoke option indicates to only execute the test cases with "Smoke" 
                 tag defined.
          

    5. Required python libraries

    requirements.txt content:
    
    assertpy             1.1      
    attrs                23.1.0   
    certifi              2022.12.7
    charset-normalizer   3.1.0    
    decorator            5.1.1    
    idna                 3.4      
    importlib-resources  5.12.0   
    jsonpath-ng          1.5.3    
    jsonschema           4.17.3   
    lxml                 4.9.2    
    pip                  23.1     
    pkgutil_resolve_name 1.3.10   
    ply                  3.11     
    pyrsistent           0.19.3   
    python-dotenv        1.0.0    
    PyYAML               6.0      
    requests             2.28.2   
    robotframework       6.0.2    
    setuptools           49.2.1   
    six                  1.16.0   
    urllib3              1.26.15
    zipp                 3.15.0


  6. References

    https://github.com/robotframework/HowToWriteGoodTestCases/blob/master/HowToWriteGoodTestCases.rst
    https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html
