import Foundation

//2 месяц. ДЗ #2
//
//#1. Создать класс DataBase.
//
//Внутри создать  2 массива типа Students и Teachers(создать эти 2 класса, потом использовать)
//
//В каждом из классов, касающихся базы данных должны быть методы для добавление, удаления и считывания учеников/учителей.
//Другими способами ничего изменяться не должно
//Так же добавить методы, позволяющие увидеть полный список(String) учеников и учителей.
//Пример:
//#1 - Имя Фамилия - Возраст - Класс - Средний балл

import Darwin

class Students {
    private var name: String = ""
    private var surname: String = ""
    private var age: Int = 0
    private var form: Int = 0
    private var id: Int = 0
    
    init(name: String, surname: String, age: Int, form: Int, id: Int) {
        self.name = name
        self.surname = surname
        self.age = age
        self.form = form
        self.id = id
    }
    
    func getName()->String{
        return self.name
    }
    
    func getID()->Int{
        return self.id
    }
    
    func getSurname()->String{
        return self.surname
    }
    
    func getStudentInfo()->String{
        return "\(self.name) \(self.surname)\nAge: \(self.age)\nForm: \(self.form)\nID: \(self.id)"
    }
    
}

class Teachers {
    private var name: String = ""
    private var surname: String =  ""
    private var age: Int = 0
    private var id: Int = 0
    
    init(name: String, surname: String, age: Int, id: Int) {
        self.name = name
        self.surname = surname
        self.age = age
        self.id = id
    }
    
    func getName()->String{
        return self.name
    }
    
    func getID()->Int{
        return self.id
    }
    
    func getAge()->Int{
        return self.age
    }
    
    func getSurname()->String{
        return self.surname
    }
    
    func getTeacherInfo()->String{
        return "\(self.getName()) \(self.surname)\nAge: \(self.age)\nID: \(self.id)"
    }
    
    
}

class DataBase {
    
//----------------------------------
    private var studentsArray: [Students] = []
    private var teachersArray: [Teachers] = []
    
    func addStudent(student: Students) {
        studentsArray.append(student)
    }
    func addTeacher(teacher: Teachers) {
        teachersArray.append(teacher)
    }
    func deleteStudent(id: Int) {
        let studentsArrayLength = studentsArray.count
        for student in studentsArray{
            if student.getID() == id {
        studentsArray.remove(at: id)
                print("Student \(student.getName()) \(student.getSurname()) was delete from data base")
            }
        }
        if studentsArray.count == studentsArrayLength {
            print("An invalid ID was entered!")
        }
    }
    func deleteTeacher(name: String, surname: String, age: Int) {
        if teachersArray.count >= 0{
            for (index,teacher) in teachersArray.enumerated() {
                if teacher.getName() == name && teacher.getSurname() == surname && teacher.getAge() == age {
            teachersArray.remove(at: index)
                    print("Teacher \(teacher.getName()) \(teacher.getSurname()) was delete from data base")
                }
            }
        }else{
            print("empty array")
        }
        
    }
    func listOfStudents() {
        print("List of students:")
        print("----------")
        for item in studentsArray{
            print(item.getStudentInfo())
            print("----------")
        }
    }
        func listOfTeachers() {
            print("List of teachers:")
            print("----------")
            for item in teachersArray{
                print(item.getTeacherInfo())
                print("----------")
            }
        }
}



var dataBase = DataBase()
dataBase.addStudent(student: Students(name: "Adem", surname: "Kattoobekova", age: 14, form: 8, id: 0))
dataBase.addStudent(student: Students(name: "Bael", surname: "Amanbaev", age: 17 , form: 10, id: 1))
dataBase.addStudent(student: Students(name: "Bayana", surname: "Stalbekova", age: 8, form: 2, id: 2))
dataBase.addStudent(student: Students(name: "Saika", surname: "Belekova", age: 15, form: 9, id: 3))
dataBase.addStudent(student: Students(name: "Ariet", surname: "Arstanbekov", age: 18 ,form: 11, id: 4))

dataBase.listOfStudents()
print("")

dataBase.addTeacher(teacher: Teachers(name: "Cholpon", surname: "Belekova", age: 30, id: 345))
dataBase.addTeacher(teacher: Teachers(name: "Janara", surname: "Ulanova", age: 29, id: 1))
dataBase.addTeacher(teacher: Teachers(name: "Daniel", surname: "Kattoobekov", age: 35, id: 2))
dataBase.addTeacher(teacher: Teachers(name: "Aidar", surname: "Nurlanov", age: 25, id: 3))
dataBase.addTeacher(teacher: Teachers(name: "Aizat", surname: "Asanbekova", age: 38, id: 4))

dataBase.listOfTeachers()
print("")


dataBase.deleteStudent(id: 1)
dataBase.listOfStudents()

print("")
dataBase.deleteTeacher(name: "Aizat", surname: "Asanbekova", age: 38)
dataBase.listOfTeachers()

