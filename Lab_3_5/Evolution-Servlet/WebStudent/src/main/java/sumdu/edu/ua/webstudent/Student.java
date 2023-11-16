package sumdu.edu.ua.webstudent;


public class Student {
    int id;
    static int nextid = 0;
    private String name;
    private String surname;
    private String email;
    private String group;
    private String faculty;
    

      
    public Student(String name, String surname, String email, String parameter3, String parameter4) {
        this.id = nextid++;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.group = parameter3;
        this.faculty = parameter4;
         
    }

  
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public String getSurname() {
        return surname;
    }
    
    public void setSurname(String surname) {
        this.surname = surname;
    }
    
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getGroup() {
        return group;
    }
    
    public void setGroup(String group) {
        this.group = group;
    }
    
    public String getFaculty() {
        return faculty;
    }
    
    public void setFaculty(String faculty) {
        this.faculty = faculty;
    }
}
