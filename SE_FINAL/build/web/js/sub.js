/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

     function configureDropDownLists(ddl1,ddl2) {
    var s1 = ['Communication Skills','Computer Programming and Utilization','Elements of Electrical Engineering','Environmental Studies','Engineering Graphics','Calculus'];
    var s2 = ['Elements of Mechanical Engineering','Physics',' 	Vector Calculus & Linear Algebra','Basic Electronics','Electrical and Electronics Workshop','Contributor Personality Development'];
    var s3 = ['Advanced Engineering Mathematics', 'Engineering Economics and Management', 'Design Engineering - I A','Data Structure','Database Management Systems','Digital Electronics'];
    var s4 = ['Design Engineering - I B', 'Operating System', 'Object Oriented Programming With C++','Numerical and Statistical Methods for Computer Engineering','Computer Organization','Computer Networks'];
    var s5 = ['DESIGN ENGINEERING - II A', 'INSTITUTE ELECTIVE - CYBER SECURITY', 'ANALYSIS AND DESIGN OF ALGORITHMS','OBJECT ORIENTED PROGRAMMING USING JAVA','MICROPROCESSOR AND INTERFACING','SYSTEM PROGRAMMING'];
    var s6 = ['Design Engineering - II B', 'Software Engineering', 'Theory of Computation','Advanced Java','Web Technology','Net Technology'];
    var s7 = ['Project - I', ' 	Compiler Design', 'Information and Network Security','Mobile Computing and Wireless Communication','Data Mining and Business Intelligence'];
    var s8 = ['Artificial Intelligence', 'Project (Phase-II)', 'Python Programming(Departmental Elective - III)'];

    switch (ddl1.value) {
        case 's1':
            ddl2.options.length = 0;
            for (i = 0; i < s1.length; i++) {
                createOption(ddl2, s1[i], s1[i]);
            }
            break;
        
        case 's2':
            ddl2.options.length = 0;
            for (i = 0; i < s2.length; i++) {
                createOption(ddl2, s2[i], s2[i]);
            }
            break;
        
        case 's3':
            ddl2.options.length = 0;
            for (i = 0; i < s3.length; i++) {
                createOption(ddl2, s3[i], s3[i]);
            }
            break;
            
        case 's4':
            ddl2.options.length = 0;
            for (i = 0; i < s4.length; i++) {
                createOption(ddl2, s4[i], s4[i]);
            }
            break;
            
        case 's5':
            ddl2.options.length = 0;
            for (i = 0; i < s5.length; i++) {
                createOption(ddl2, s5[i], s5[i]);
            }
            break;
            
        case 's6':
            ddl2.options.length = 0;
            for (i = 0; i < s6.length; i++) {
                createOption(ddl2, s6[i], s6[i]);
            }
            break;
            
        case 's7':
            ddl2.options.length = 0;
            for (i = 0; i < s7.length; i++) {
                createOption(ddl2, s7[i], s7[i]);
            }
            break;
            
        case 's8':
            ddl2.options.length = 0;
            for (i = 0; i < s8.length; i++) {
                createOption(ddl2, s8[i], s8[i]);
            }
            break;
            default:
                ddl2.options.length = 0;
            break;
    }

}

    function createOption(ddl, text, value) {
        var opt = document.createElement('option');
        opt.value = value;
        opt.text = text;
        ddl.options.add(opt);
    }