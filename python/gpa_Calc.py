# Python testing

import tkinter

# A test script for playing with Python

class Course:
	""" A simple Class

	Creates a node object that will be messed with in the test code
	"""

	def __init__(self, courseName, grade):
		""" Init Constructur"""
		print("Initialzing a new Course object.")
		self.courseName = courseName
		self.gradePoint = grade


class Student:
	"""A Student Class

	Holds all of the student's information for courses and grades
	"""

	def __init__(self, name):
		print("Initialzing a new Student object.")
		self.name 	 = name
		self.courses = []

	def addCourse(self):
		""" Adds a new course to the student """
		courseName  = input("What is the new course name? ")
		courseGrade = eval(input("What grade point did you get? "))
		self.courses.append(Course(courseName,courseGrade))
		self.gpa = self.calculateGPA()

	def printCourses(self):
		for course in self.courses:
			print(course.courseName, course.gradePoint)

	def calculateGPA(self):
		gpa = 0
		for course in self.courses:
			gpa = gpa + course.gradePoint

		return(gpa/len(self.courses))

	def loadStudent(self, loadFileName):


class Reg:
	"""A Registrar Course

	Maintains all of the student registered and their info.
	"""

	def __init__(self):
		self.students = []	# List of Students

	def addStudent(self):
		studentName = input("What is the new Student's Name? ")
		self.students.append(Student(studentName))

	def printStudents(self):
		print("Students","---------", sep="\n")
		for stu in self.students:
			print("Name: ", stu.name)
			print("Courses:")
			stu.printCourses()
			print("Student GPA: ", stu.gpa)
			print("")
		



reg = Reg()

reg.addStudent()
reg.addStudent()

# First Student Courses
tempStudent = reg.students[0]

tempStudent.addCourse()
print(tempStudent.gpa)
tempStudent.addCourse()
print(tempStudent.gpa)

# Second Student Courses
tempStudent = reg.students[1]

tempStudent.addCourse()
print(tempStudent.gpa)
tempStudent.addCourse()
print(tempStudent.gpa)

# Print Students
reg.printStudents()
