# CommonModule
How's to create project as lirary/framwork?
1. New project -> Framework
<img src= "https://github.com/wata-chinhtran/CommonModule/blob/master/create_framework_ex.png" />
2. Add class/function with open/public type if you want allow to access from outside module.</br>
    # Swift:</br>
    2.1: An open class is accessible and subclassable outside of the defining module. An open class member is accessible and overridable outside of the defining module.</br>
    2.2: A public class is accessible but not subclassable outside of the defining module. A public class member is accessible but not overridable outside of the defining module.
    Read more at: https://github.com/apple/swift-evolution/blob/master/proposals/0117-non-public-subclassable-by-default.md </br>
    # Objective C: </br>
    2.1 Go to current target -> build phases -> Headers
    2.2 Drop & drag all header files to public section if you allow to access from outside else move to private section when you dont allow user see or access to these class/function was define.
    <img src= "https://github.com/wata-chinhtran/CommonModule/blob/master/public_file_objective_c.png" />
3. Add example project as guideline how to use: </br>
    3.1 Add new target -> create new single app
    3.2 Import current module as framework. </br>    
    <img src= "https://github.com/wata-chinhtran/CommonModule/blob/master/add_example.png" />
    Or we can do with steps at: https://programmingwithswift.com/create-a-swift-framework/ 
    
Getting Started with Swift Unit Testing in Xcode
1. Adding a Unit Test Target to Your Xcode Project
    1.1 Starting with a new project
    To get started, we are going to create a blank iOS project. You will want to have the include unit tests checkbox checked.    
    <img src= "https://github.com/wata-chinhtran/CommonModule/blob/master/ut_new_proj.png" />
    1.2 You already have a project, and you want to add tests
        1.2.1 Go to File > New > Target. Select iOS Unit Testing Bundle. Click Next.
        <img src= "https://github.com/wata-chinhtran/CommonModule/blob/master/ut_exist_proj.png" />
        1.2.2 Adding a Unit Test Class to Your Xcode Project
        When you create the unit test target, Xcode includes a unit test class file. It has the name AppNameTests.swift, where AppName is the name of your project. Unless you have a really small project, you will have multiple unit test classes.
        Choose File > New > File to add a new file to your project.
        <img src= "https://github.com/wata-chinhtran/CommonModule/blob/master/ut_create_test_case_class.png" />
        Select Unit Test Case Class from the list of file templates. Click the Next button.
        Enter the name of the class in the Class text field. The subclass should be set to XCTestCase, and the language should be set to Swift. Click the Next button to finish creating the unit test class.
        <img src= "https://github.com/wata-chinhtran/CommonModule/blob/master/ut_select_test_case_class.png" />
2. The Initial Unit Test Class
Read more at: https://medium.com/@enricopiovesan/unit-testing-in-swift-tutorial-92daab95246b









