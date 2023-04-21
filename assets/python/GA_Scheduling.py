#!C:/Users/Administrator/AppData/Local/Programs/Python/Python310/python.exe

print("Content-Type: text/javascript\n")
from datetime import datetime, date, timedelta, time
import time as tm
import prettytable as prettytable
import random as rnd
import pymysql
import sys
import json

sys.path.append("c:\\users\\administrator\\appdata\\local\\programs\\python\\python310\\lib\\site-packages")

#database connection
connection = pymysql.connect(host="localhost", user="root", passwd="", database="thesisprototype")
cursor = connection.cursor()

# queries for retrievint all rows
#retrive_professors = "Select * from professors;"
retrive_rooms = "Select * from rooms;"
retrive_courses = "Select * from courses;"
retrive_input = "Select * from inputs"
cursor.execute(retrive_input)
rows_input = cursor.fetchall()
section_input = str(rows_input[0]).replace("(","").replace(",","").replace(")","")
retrive_sections = "Select * from sections where section_name = " + section_input +";"

#executing the queries

#cursor.execute(retrive_professors)
#rows_professors = cursor.fetchall()
cursor.execute(retrive_rooms)
rows_room = cursor.fetchall()
cursor.execute(retrive_courses)
rows_courses = cursor.fetchall()
cursor.execute(retrive_sections)
rows_section = cursor.fetchall()

#commiting the connection then closing it.
connection.commit()
connection.close()
fitness_arr = []
POPULATION_SIZE = 10
NUMB_OF_ELITE_SCHEDULES = 1
TOURNAMENT_SELECTION_SIZE = 3
MUTATION_RATE = 0.3
CROSSOVER_RATE = 0.5



class Data:
    meetingTimes = []
    def __init__(self):
        self._rooms = [];
        #self._professors= [];
        self._courses =[];
        self._sects = []

        for row in rows_room:
            self._rooms.append(Room(row[1], row[2]))

        #for row in rows_professors:
            #self._professors.append(Professor(row[0], row[1]))

        for row in rows_courses:
            #temp_teacher_arr = [];
            #for course_teacher in row[3].split(","):
                #for teacher in self._professors:
                    #if(course_teacher == teacher.get_name()):
                        #temp_teacher_arr.append(teacher)
                        #break;
            self._courses.append(Course(row[2], row[1], row[4], row[5]))
            #self._courses.append(Course(row[2], row[1], temp_teacher_arr, row[4], row[5]))

        for row in rows_section:
            temp_course_arr = [];
            for req_course in row[3].split(","):
                for course in self._courses:
                    if(req_course == course.get_name()):
                        temp_course_arr.append(course)
                        break;
            self._sects.append(Section(row[1],temp_course_arr, row[4]))

        for sections in self._sects:
            sections.set_units()

        self._numberOfClasses = 0
        for i in range (0, len(self._sects)):
            self._numberOfClasses += len(self._sects[i].get_courses ())

    def get_rooms (self): return self._rooms
    #def get_professors(self): return self._professors
    def get_courses (self): return self._courses
    def get_sects(self): return self._sects
    def get_meetingTimes(self): return self.meetingTimes
    def get_typeofClasses (self): return self._numberofClasses
class Schedule:
    def __init__(self):
        self._data = data
        self._classes = []
        self._numbOfConflicts = 0
        self._fitness = -1
        self._classNumb = 0
        self._isFitnessChanged = True
    def get_classes(self):
        self.isFitnessChanged = True
        return self._classes
    def get_numbOfConflicts(self): return self._numbOfConflicts
    def get_fitness(self):
        if (self._isFitnessChanged == True):
            self._fitness = self.calculate_fitness()
            self._isFitnessChanged = False
        return self._fitness
    def __initialize__(self):
        sects = self._data.get_sects()
        for i in range(0, len(sects)):
            courses = sects[i].get_courses ()
            for j in range (0, len(courses)):
                newClass = Class(self._classNumb, sects[i], courses [j],sects[i].get_shift(), courses[j].get_duration())
                self._classNumb += 1
                newClass.set_meetingTime1(sects[i].get_units(),courses[j].get_isLab(),courses[j].get_type(),"M"+str(rnd.randrange(0,999)))
                newClass.set_room(data.get_rooms () [rnd.randrange (0, len(data.get_rooms ()))])
                #newClass.set_professors(courses[j].get_professors()[rnd.randrange (0, len(courses [j].get_professors()))])
                self._classes.append(newClass)
        return self

    def calculate_fitness(self):
        self.numbOfConflicts = 0
        classes = self.get_classes()
        for i in range(0, len(classes)):
            if (classes[i].get_room().get_isLab() != classes[i].get_course().get_isLab()):
                self._numbOfConflicts += 1
            for j in range(i + 1, len(classes)):
                if (j >= i):
                    if (len(classes[i].get_endTime()) == 2):
                        for classEndTime in classes[i].get_endTime():
                            if (classes[i]._meetingDay[0] in ''.join(classes[j]._meetingDay)):
                                if (len(classes[j].get_endTime()) == 2):
                                    for classEndTime1 in classes[j].get_endTime():
                                        if (((classes[i].get_startTime() < classEndTime1 and classEndTime > classes[
                                            j].get_startTime()) or (
                                                     classes[i].get_startTime() == classes[j].get_startTime()) or (
                                                     classEndTime == classEndTime1)) and classes[i].get_id() != classes[
                                            j].get_id()):
                                            if (classes[i].get_room() == classes[
                                                j].get_room()): self._numbOfConflicts += 1
                                            if (classes[i].get_sect().get_name() == classes[
                                                j].get_sect().get_name()): self._numbOfConflicts += 1
                                            #if (classes[i].get_professors() == classes[
                                                #j].get_professors()): self._numbOfConflicts += 1
                                else:
                                    if (((classes[i].get_startTime() < classes[j].get_endTime()[0] and classEndTime >
                                          classes[j].get_startTime()) or (
                                                 classes[i].get_startTime() == classes[j].get_startTime()) or (
                                                 classes[i].get_endTime()[0] == classEndTime)) and classes[
                                        i].get_id() != classes[j].get_id()):
                                        if (classes[i].get_room() == classes[j].get_room()): self._numbOfConflicts += 1
                                        if (classes[i].get_sect() == classes[j].get_sect()): self._numbOfConflicts += 1
                                        #if (classes[i].get_professors() == classes[
                                            #j].get_professors()): self._numbOfConflicts += 1

                    else:
                        startA = classes[i].get_startTime()
                        startB = classes[j].get_startTime()

                        endA = classes[i].get_endTime()[0]
                        endB = classes[j].get_endTime()[0]
                        if (classes[i]._meetingDay[0] in ''.join(classes[j]._meetingDay)):
                            if (((startA < endB and endA > startB) or (startA == startB) or (endA == endB)) and classes[
                                i].get_id() != classes[j].get_id()):
                                if (classes[i].get_room() == classes[j].get_room()): self._numbOfConflicts += 1
                                if (classes[i].get_sect() == classes[j].get_sect()): self._numbOfConflicts += 1
                                #if (classes[i].get_professors() == classes[
                                   # j].get_professors()): self._numbOfConflicts += 1
        return 1 / ((1.0 * self._numbOfConflicts + 1))
    def __str__(self):
        returnValue = ""
        for i in range (0, len(self._classes)-1):
            returnValue += str(self._classes [i]) + ","
            returnValue += str(self._classes[len(self._classes)-1])
        return returnValue
class Population:
    def __init__(self, size):
        self._size = size
        self._data = data
        self._schedules = []
        for i in range (0, size): self._schedules.append (Schedule().__initialize__())
    def get_schedules (self): return self._schedules
class GeneticAlgorithm:
    def evolve(self, population): return self._mutate_population(self._crossover_population(population))
    def _crossover_population(self, pop):
        crossover_pop = Population(0)
        for i in range (NUMB_OF_ELITE_SCHEDULES):
            crossover_pop.get_schedules(). append (pop.get_schedules ()[i])
        i = NUMB_OF_ELITE_SCHEDULES

        while i < POPULATION_SIZE:
            schedule1 = self._select_tournament_population(pop).get_schedules()[0]
            schedule2 = self._select_tournament_population(pop).get_schedules()[0]
            crossover_pop.get_schedules().append (self._crossover_schedule(schedule1, schedule2))
            i += 1;
        return crossover_pop
    def _mutate_population(self, population):
        for i in range (NUMB_OF_ELITE_SCHEDULES, POPULATION_SIZE):
            self._mutate_schedule(population.get_schedules()[i])
        return population
    def _crossover_schedule(self, schedule1, schedule2):
        crossoverSchedule = Schedule().__initialize__()
        for i in range(0, len(crossoverSchedule.get_classes())):
            if (rnd.random() > CROSSOVER_RATE): crossoverSchedule.get_classes()[i] = schedule1.get_classes ()[i]
            else: crossoverSchedule.get_classes()[i] = schedule2.get_classes()[i]
        return crossoverSchedule
    def _mutate_schedule(self, mutateSchedule):
        schedule = Schedule().__initialize__()
        for i in range (0, len(mutateSchedule.get_classes())):
            if(MUTATION_RATE > rnd.random()): mutateSchedule.get_classes()[i]=schedule.get_classes()[i]
        return mutateSchedule
    def _select_tournament_population(self, pop):
        tournament_pop = Population(0)
        i = 0
        while i < TOURNAMENT_SELECTION_SIZE:
            tournament_pop.get_schedules().append(pop.get_schedules ()[rnd.randrange (0, POPULATION_SIZE)])
            i += 1
        tournament_pop.get_schedules().sort(key=lambda x: x.get_fitness(), reverse=True)
        return tournament_pop
class Course:
    #def __init__(self, type, name, professors, isLab, duration):
    def __init__(self, type, name, isLab, duration):
        self._type = type
        self._name = name
        self._isLab = isLab
        #self._professors = professors
        self._duration = duration
    def get_type(self): return self._type
    def get_name(self): return self._name
    def get_duration(self): return self._duration
    #def get_professors(self): return self._professors
    def get_isLab (self): return self._isLab
    def __str__(self): return self._name
#class Professor:
    #def __init__(self, id, name):
        #self._id = id
        #self._name = name
    #def get_id(self): return self._id
    #def get_name (self): return self._name
    #def __str__(self): return self._name
class Room:
    def __init__(self, number, isLab):
        self._number = number
        self._isLab = isLab
    def get_number(self): return self._number
    def get_isLab(self): return self._isLab
class MeetingTime:
    def __init__(self, id, time):
        self._id = id
        self._time = time
    def get_id(self): return self._id
    def get_time(self): return self._time
class Section:
    def __init__(self, name, courses,shift):
        self._name = name
        self._courses = courses
        self._units = 0
        self._shift = shift
    def get_name(self): return self._name
    def get_shift(self): return self._shift
    def get_courses(self): return self._courses
    def set_units(self):
        for course in self._courses:
            self._units += course._duration
    def get_units(self):return self._units
class Class:
    meetingDayPairs = [["Mon,Thurs"], ["Tues,Fri"], ["Wed,Sat"]]
    meetingDays = [["Mon"],["Fri"], ["Thurs"],["Fri"],["Wed"],["Sat"]]
    meetingDaysNSTP = [["Sat"],["Sun"]]

    def __init__(self, id, sect, course,shift ,duration):
        self._id = id
        self._sect = sect
        self._course = course
        self._duration = duration
        #self._professor = None
        self._startTime = None
        self._endTime = []
        self._endTimeLab = None
        self._meetingTime = None
        self._meetingDay = None
        self._room = None
        self._shift = shift
    def get_id(self): return self._id
    def get_sect(self): return self._sect
    def get_course(self): return self._course
    #def get_professors(self): return self._professor
    def get_startTime (self): return self._startTime
    def get_endTime(self): return self._endTime
    def get_meetingTime(self): return self._meetingTime
    def get_room(self): return self._room
    #def set_professors(self, professor): self._professor = professor
    def set_endAndStartTimeForPE(self,startTime):
        self._startTime = time(startTime)
        result = datetime.combine(date.today(), self._startTime) + timedelta(hours=2)
        self._endTime = [result.time()]
    def set_endAndStartTimeForLab(self,startTime):
        t = time(startTime)
        self._startTime = t
        result = datetime.combine(date.today(), t) + timedelta(hours=3)
        result_1 = datetime.combine(date.today(), t) + timedelta(hours=2)
        self._endTime = [result.time(),result_1.time()]
    def set_endAndStartTime(self,startTime):
        t = time(startTime)
        self._startTime = t
        result = datetime.combine(date.today(), t) + timedelta(hours=self._duration)
        e = result.time()
        self._endTime = [e]

    def set_meetingTime1 (self, units, isLab, type, meeting_id):
        if(units>20):

            self._meetingDay = self.meetingDayPairs[rnd.randint(0, len(self.meetingDayPairs)-1)]
            if(isLab == "false"):
                if(type!="NSTP" and type != "PE"):
                    if (self._shift == "Morning"):
                        temp_startTime = rnd.randrange(7, 14)
                    else:
                        temp_startTime = rnd.randrange(12, 19)
                    self.set_endAndStartTime(temp_startTime)
                    if(''.join(self._meetingDay)=="Wed,Sat"):
                        self._meetingDay = self._meetingDay[0]
                elif(type=="NTSP"):
                    self._meetingDay = rnd.choice("Sat","Sun")
                elif(type=="PE"):
                    self._meetingDay = self.meetingDays[rnd.randrange(0,len(self.meetingDays))]
                    hrs_list = [7, 9, 11, 13, 15, 17]
                    rand_start = rnd.choice(hrs_list)
                    self._meetingDay = self._meetingDay[0]
                    self.set_endAndStartTimeForPE(rand_start)
            else:
                if (self._shift == "Morning"):
                    temp_startTime = rnd.randrange(7, 14)
                else:
                    temp_startTime = rnd.randrange(12, 19)
                self.set_endAndStartTimeForLab(temp_startTime)
        else:
            self._meetingDay = self.meetingDays[rnd.randrange(0, len(self.meetingDays))]
            if (self._shift == "Morning"):
                temp_startTime = rnd.randrange(7, 14)
            else:
                temp_startTime = rnd.randrange(12, 19)
            self.set_endAndStartTime(temp_startTime)
        endTime_temp = [date_obj.strftime("%I:%M %p") for date_obj in self._endTime]
        startTime_time = self._startTime.strftime("%I:%M %p")
        meetingTime = ''.join(self._meetingDay)+" "+str(startTime_time) + " - " + ','.join(endTime_temp)
        data.meetingTimes.append(MeetingTime([meetingTime],[meeting_id]))
        self._meetingTime = MeetingTime([meetingTime],[meeting_id])
    def set_room(self, room): self._room = room
    def __str__(self):
        return str(self._sect.get_name()) + "," + str(self._course.get_type ()) + "," + \
               str(self._room.get_number()) + "," + str(self._meetingTime.get_id())
               #str(self._room.get_number()) + "," + str(self._professor.get_id()) + "," + str(self._meetingTime.get_id())

class DisplayMgr:
    def print_available_data(self):
        print ("> All Available Data")
        self.print_sect()
        self.print_course()
        self.print_room()
        #self.print_professor()
        self.print_meeting_times()
    def print_sect(self):
        sects = data.get_sects()
        availablesectsTable = prettytable. PrettyTable(['sect', 'courses', 'units'])
        for i in range(0, len(sects)):
            courses = sects.__getitem__(i).get_courses ()
            tempStr = "["
            for j in range(0, len(courses) - 1):
                tempStr += courses[j].__str__() + ", "
            tempStr += courses[len(courses) - 1].__str__() + "]"
            availablesectsTable.add_row([sects.__getitem__(i).get_name (), tempStr,sects.__getitem__(i).get_units()])
        print (availablesectsTable)
    def print_course(self):
        availableCoursesTable =  prettytable.PrettyTable(['id', 'course #',' is Laboratory'])
        courses = data.get_courses()
        for i in range (0, len(courses)):
            #professor = courses[i].get_professors()
            tempStr = ""
            #for j in range(0, len(professor) - 1):
                #tempStr += professor[j].__str__() + ", "
            #tempStr += professor[len(professor) - 1].__str__()
            availableCoursesTable.add_row(
                #[courses[i].get_type(), courses[i].get_name(), str(courses[i].get_isLab()), tempStr])
                [courses[i].get_type(), courses[i].get_name(), str(courses[i].get_isLab())])
        print(availableCoursesTable)
    #def print_professor(self):
        #availableProfessorsTable = prettytable.PrettyTable(['id', 'professor'])
        #professor = data.get_professors ()
        #for i in range (0, len(professor)):
        #    availableProfessorsTable.add_row([professor[i].get_id(), professor[i].get_name ()])
        #print (availableProfessorsTable)
    def print_room(self):
        availableRoomsTable = prettytable.PrettyTable(['room #',' is Laboratory'])
        rooms = data.get_rooms ()
        for i in range(0, len(rooms)):
            availableRoomsTable.add_row([str(rooms[i]. get_number()), str(rooms[i].get_isLab())])
        print (availableRoomsTable)
    def print_meeting_times(self):
        availableMeetingTimeTable = prettytable.PrettyTable(['id', 'Meeting Time' ])
        meetingTimes = data.get_meetingTimes ()
        for i in range(0, len(meetingTimes)):
            availableMeetingTimeTable.add_row([meetingTimes[i].get_id(), meetingTimes[i].get_time()])
        print (availableMeetingTimeTable)
    def print_generation(self, population):
        #table1 = prettytable.PrettyTable(['schedule #', 'fitness', '# of conflicts', 'classes [sect, class, room, professor, meeting time]'])
        table1 = prettytable.PrettyTable(['schedule #', 'fitness', '# of conflicts', 'classes [sect, class, room, meeting time]'])
        schedules = population.get_schedules()
        for i in range (0, len(schedules)):
            table1.add_row([str(i), round(schedules[i].get_fitness(),3), schedules [i].get_numbOfConflicts(), schedules[i]])
        print(table1)
    def print_schedule_as_table(self, schedule):
        classes = schedule.get_classes()
        #table = prettytable.PrettyTable(['Class #', 'sect', 'Course (type, is Laboratory)', 'Room (is Laboratory)', 'professor','Meeting Time'])
        table = prettytable.PrettyTable(['Class #', 'sect', 'Course (type, is Laboratory)', 'Room (is Laboratory)', 'Meeting Time'])
        for i in range(0, len(classes)):
            table.add_row([
                str(i),
                classes[i].get_sect().get_name(), classes[i].get_course().get_name() + "(" +
                                                  classes[i].get_course().get_type() +", " + str(classes[i].get_course().get_isLab()) +")" ,
                                                  classes[i].get_room().get_number() +"(" + str(classes[i].get_room().get_isLab()) + ")",
                                                  #classes[i].get_professors(). get_name() + "(" + str(
                                                      #classes[i].get_professors().get_id()) + ")",
                ' '.join(classes[i].get_meetingTime(). get_time()) +"(" + str(classes[i].get_meetingTime().get_id()) +")"
            ])
        print(table)

    def return_sched(self, schedule):
        classes = schedule.get_classes()
        #table = prettytable.PrettyTable(['SECTION', 'Subject', 'Room', 'Teacher', 'Subject Time'])
        table = prettytable.PrettyTable(['SECTION', 'Subject', 'Room', 'Subject Time'])
        for i in range(0, len(classes)):
            table.add_row([
                classes[i].get_sect().get_name(),
                classes[i].get_course().get_name(),
                classes[i].get_room().get_number(),
                #classes[i].get_professors().get_name(),
                str(classes[i].get_meetingTime().get_id())
            ])
        return table.get_html_string(attributes={"id": "table_schedule", "class": "table"})
    def return_json(self,schedule):
        classes = schedule.get_classes()
        json_array = {}
        for i in range(0, len(classes)):
            json_array[i] = {"section": classes[i].get_sect().get_name(), "subject": classes[i].get_course().get_name(),
                             "room": classes[i].get_room().get_number(),
                             "meetingTime": str(classes[i].get_meetingTime().get_id()).replace("[", "").replace("]","").replace("'", "")}
            #json_array[i] = {"section":classes[i].get_sect().get_name(),"subject":classes[i].get_course().get_name(),"room":classes[i].get_room().get_number(),"professor":classes[i].get_professors().get_name(),"meetingTime":str(classes[i].get_meetingTime().get_id()).replace("[","").replace("]","").replace("'","")}
        print (json.dumps(json_array))

#start_time = tm.time()
data = Data()
displayMgr = DisplayMgr()
#displayMgr.print_available_data()
generationNumber = 0
#print("\n> Generation # "+str(generationNumber))"
population = Population(POPULATION_SIZE)
population.get_schedules().sort (key=lambda x: x.get_fitness(), reverse=True)
#displayMgr.print_generation(population)
fitness_arr.append(population.get_schedules()[0].get_fitness())
#displayMgr.print_schedule_as_table(population.get_schedules()[0])
geneticAlgorithm = GeneticAlgorithm()
while (population.get_schedules()[0].get_fitness() != 1.0):
    #generationNumber += 1
    #print("\n> Generation # "+ str(generationNumber))
    population = geneticAlgorithm.evolve(population)
    population.get_schedules ().sort(key=lambda x: x.get_fitness(), reverse=True)
    #displayMgr.print_generation(population)
    fitness_arr.append(population.get_schedules()[0].get_fitness())
    #displayMgr.print_schedule_as_table(population.get_schedules ()[0])
    if population.get_schedules()[0].get_fitness() == 1.0:
        #print(displayMgr.return_sched(population.get_schedules()[0]))
        displayMgr.return_json(population.get_schedules()[0])
#print("--- %s seconds ---" % (tm.time() - start_time))
#table = prettytable.PrettyTable(['Generation', 'Fitness'])
#i = 0
#for fitness in fitness_arr:
    #table.add_row([i, fitness])
    #i += 1

#print(table)

#x = np.arange(1, len(fitness_arr)+1)
#y = np.array(fitness_arr)

# plotting
#plt.title("Genetic Algorithm with Elitism")
#plt.xlabel("Generation #")
#plt.ylabel("Fitness rate")
#plt.plot(x, y, color="green")
#plt.show()

