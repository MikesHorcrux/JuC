//
//  QuestionLabel.swift
//  JuC
//
//  Created by Mike on 3/26/23.
//

import SwiftUI

struct QuestionLabel: View {
    var question: Question
    var body: some View {
        VStack(alignment: .leading, spacing: 18){
            Text(question.question)
                .font(.headline)
            Text(question.description)
                .font(.subheadline)
            Spacer()
            HStack {
                Spacer()
                Image(systemName: "arrowshape.turn.up.right.circle")
                    .foregroundColor(Color("OxfordBlue"))
            }
        }
        .frame(width: 150, height: 230)
        .padding()
        .background(Color("BottomSheet"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct QuestionLabel_Previews: PreviewProvider {
    static var previews: some View {
        QuestionLabel(question: Question(
            id: UUID(),
            icon: "doc.text.below.ecg",
            question: "How to write an effective resume",
            description: "Learn how to write a compelling and effective resume",
            fullDescription: """

                Your resume is your first opportunity to make a good impression on a potential employer. Therefore, it's important to make sure that your resume is compelling, well-structured, and tailored to the job you're applying for. Here are some tips to help you write an effective resume:

                1. **Tailor your resume to the job:** Tailor your resume to the job you're applying for by highlighting the skills and experiences that are most relevant to the position.

                2. **Use a clear structure:** Use a clear structure for your resume, with headings, bullet points, and a professional font. Make sure your resume is easy to read and well-organized.

                3. **Highlight your achievements:** Use specific examples and achievements to demonstrate your skills and experience. This can help to make your resume stand out and demonstrate your value to potential employers.

                4. **Quantify your accomplishments:** Use numbers and statistics to quantify your accomplishments and demonstrate the impact of your work. For example, if you increased sales by 20%, make sure to include that in your resume.

                5. **Be concise:** Your resume should be no more than two pages long, so make sure to be concise and only include information that is relevant to the job you're applying for.

                6. **Proofread your resume:** Proofread your resume carefully for spelling and grammar errors. A single mistake can make a bad impression on potential employers.

                By following these tips, you can write an effective resume that highlights your skills and experience and makes a strong impression on potential employers. Remember to tailor your resume to the job, use a clear structure, highlight your achievements, quantify your accomplishments, be concise, and proofread your resume carefully. With a little practice, you'll be writing great resumes in no time!
            """
            ))
    }
}
