//
//  QuestionsViewModel.swift
//  JuC
//
//  Created by Mike on 3/26/23.
//

import Foundation

class QuestionsViewModel: ObservableObject {
    @Published var questions: [Question] = []
    
    
    var questionsQue = [
        Question(
        id: UUID(),
        icon: "envelope.circle.fill",
        question: "How to write a good email",
        description: "Learn how to write effective and professional emails",
        fullDescription: """

            As a professional, knowing how to write a good email is essential. Whether you're sending a message to a colleague, client, or customer, your email should be clear, concise, and professional. Here are some tips to help you write a good email:

            1. **Start with a clear subject line:** The subject line is the first thing the recipient sees, and it should be clear and concise. Avoid using vague or generic subject lines that don't give the recipient an idea of what the email is about. Use a subject line that accurately reflects the content of your email.

            2. **Use a professional greeting:** Use a formal greeting, such as "Dear [Name]," or "Good morning/afternoon/evening [Name]," depending on the time of day and the recipient's relationship with you. Avoid using slang or informal language in your greeting.

            3. **Get straight to the point:** Your email should be brief and to the point. Use short sentences and avoid long paragraphs. Start with the most important information and use bullet points or numbered lists to break up the text and make it easier to read.

            4. **Use proper grammar and spelling:** Proofread your message carefully for spelling and grammar errors. Avoid using slang or informal language. If you're unsure about the spelling of a word or the proper use of grammar, use a tool such as Grammarly to check your work.

            5. **Use a professional tone:** Your email should be written in a professional and courteous tone. Avoid using emotional language or making assumptions about the recipient. Instead, focus on the facts and keep your tone neutral.

            6. **Provide a clear call-to-action:** End your email with a clear call-to-action that tells the recipient what you want them to do next. Whether it's to respond to your message, schedule a meeting, or take some other action, make sure the call-to-action is clear and concise.

            7. **Use a proper email signature:** Your email signature should include your name, job title, and contact information. It's also a good idea to include a link to your company's website or social media accounts. Make sure your signature is professional and consistent across all your emails.

            By following these tips, you can write effective and professional emails that convey your message clearly and efficiently. Remember to proofread your message before sending it, and keep your tone professional and courteous. With a little practice, you'll be writing great emails in no time!
        """
        ),
        Question(
        id: UUID(),
        icon: "rectangle.3.offgrid.bubble.left.fill",
        question: "How to give a great presentation",
        description: "Learn how to deliver a professional and effective presentation",
        fullDescription: """

            As a professional, knowing how to give a great presentation is essential. Whether you're presenting to a client, a team of colleagues, or at a conference, your presentation should be clear, concise, and engaging. Here are some tips to help you deliver a great presentation:

            1. **Know your audience:** Before you start preparing your presentation, research your audience. Who are they? What are their interests? What do they already know about your topic? This will help you tailor your presentation to their needs and interests.

            2. **Create a clear structure:** A good presentation should have a clear structure, with an introduction, body, and conclusion. Use clear signposting to help your audience follow your presentation, such as headings, bullet points, and transitions.

            3. **Use visual aids:** Visual aids can help you communicate your message more effectively. Use slides, diagrams, and images to support your points and make your presentation more engaging. However, avoid using too many visual aids, as this can be overwhelming for your audience.

            4. **Practice your delivery:** Practice your delivery beforehand to ensure that you are confident and comfortable with your material. This will help you deliver your presentation smoothly and confidently.

            5. **Engage with your audience:** Engage with your audience throughout your presentation. Use eye contact, gestures, and vocal variety to keep your audience engaged and interested. Encourage questions and feedback, and respond to them thoughtfully.

            6. **End with a clear call-to-action:** End your presentation with a clear call-to-action that tells your audience what you want them to do next. This could be to schedule a follow-up meeting, to visit your website, or to take some other action related to your presentation.

            By following these tips, you can deliver a professional and effective presentation that engages your audience and communicates your message clearly. Remember to practice your delivery, use visual aids thoughtfully, and tailor your presentation to your audience's needs and interests. With a little practice, you'll be giving great presentations in no time!
        """
        ),
        Question(
        id: UUID(),
        icon: "doc.plaintext.fill",
        question: "How to write an effective business proposal",
        description: "Learn how to write a persuasive and effective business proposal",
        fullDescription: """

            As a professional, knowing how to write an effective business proposal is crucial. Whether you're presenting a proposal to a potential client, a partner, or your boss, your proposal should be persuasive, well-structured, and tailored to your audience. Here are some tips to help you write an effective business proposal:

            1. **Do your research:** Before you start writing your proposal, research your audience and their needs. What are their pain points? What are their goals? How can your proposal help them achieve their goals and solve their problems?

            2. **Create a clear structure:** A good business proposal should have a clear structure, with an introduction, body, and conclusion. Use headings, bullet points, and transitions to guide your reader through your proposal.

            3. **Use persuasive language:** Use persuasive language throughout your proposal to convince your reader of the benefits of your proposal. Use strong verbs and active voice, and avoid passive voice.

            4. **Provide evidence:** Back up your proposal with evidence, such as case studies, statistics, and testimonials. This will help to build credibility and support your arguments.

            5. **Tailor your proposal to your audience:** Tailor your proposal to your audience's needs and interests. Use language and examples that your audience will understand and relate to.

            6. **End with a clear call-to-action:** End your proposal with a clear call-to-action that tells your reader what you want them to do next. This could be to schedule a follow-up meeting, to sign a contract, or to take some other action related to your proposal.

            By following these tips, you can write a persuasive and effective business proposal that communicates your message clearly and persuasively. Remember to do your research, create a clear structure, use persuasive language, provide evidence, tailor your proposal to your audience, and end with a clear call-to-action. With a little practice, you'll be writing great business proposals in no time!
        """
        ),
        Question(
        id: UUID(),
        icon: "message.fill",
        question: "How to communicate effectively in the workplace",
        description: "Learn how to communicate effectively with colleagues, managers, and clients",
        fullDescription: """

            Effective communication is essential in the workplace. Whether you're communicating with colleagues, managers, or clients, your communication should be clear, concise, and professional. Here are some tips to help you communicate effectively in the workplace:

            1. **Listen actively:** Active listening is an essential part of effective communication. Listen attentively to what the other person is saying, and ask clarifying questions to ensure that you understand their message.

            2. **Be clear and concise:** Use clear and concise language to communicate your message. Avoid using jargon or technical language that might be confusing to your audience.

            3. **Be mindful of your tone:** Your tone can impact how your message is received. Use a professional and respectful tone, and avoid using emotional language or making assumptions about the other person.

            4. **Be respectful:** Show respect for the other person's time and priorities. Avoid interrupting them or monopolizing the conversation.

            5. **Use nonverbal communication:** Nonverbal communication, such as facial expressions and body language, can be just as important as verbal communication. Use nonverbal cues to show that you are listening and engaged in the conversation.

            6. **Follow up in writing:** After a conversation or meeting, follow up in writing to confirm any agreements or action items. This can help to avoid misunderstandings and ensure that everyone is on the same page.

            By following these tips, you can communicate effectively in the workplace and build strong relationships with your colleagues, managers, and clients. Remember to listen actively, be clear and concise, be mindful of your tone, be respectful, use nonverbal communication, and follow up in writing. With a little practice, you'll be a great communicator in no time!
        """
        ),
        Question(
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
        )
        
    ]
}
