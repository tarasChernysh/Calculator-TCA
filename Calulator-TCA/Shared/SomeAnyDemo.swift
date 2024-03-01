//
//  SomeAnyDemo.swift
//  Calulator-TCA
//
//  Created by tchernysh on 28.02.2024.
//

import Foundation

protocol Student {
	associatedtype ExamToPrepare: Exam
	func prepare(for exam: ExamToPrepare)
}

protocol Exam {
	associatedtype Chapter: SubjectChapter where Chapter.Subject == Self
	static func getChapter() -> Chapter
}

protocol SubjectChapter {
	associatedtype Subject: Exam where Subject.Chapter == Self
	func getExam() -> Subject
}

final class School {
	func preparing(student: some Student) {
		let chapter = type(of: student).ExamToPrepare.getChapter()
		let exam = chapter.getExam()
		student.prepare(for: exam)
	}

	func preparing2<S: Student>(student: S) {
		let chapter = type(of: student).ExamToPrepare.getChapter()
		let exam = chapter.getExam()
		student.prepare(for: exam)
	}

	func preparing2<S: Student>(students: [S]) {
		for student in students {
			preparing(student: student)
		}
	}

	func preparing(students: [any Student]) {
		let human = Human()
		for student in students {
			preparing(student: student)
		}
	}
}

class University {
	func test() {
		var animal: String?
        
		guard let aa = animal else { return }
	}
}
