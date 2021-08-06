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
    Or we can do with steps with flow at: https://programmingwithswift.com/create-a-swift-framework/ 
