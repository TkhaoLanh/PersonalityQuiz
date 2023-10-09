# PersonalityQuiz
The personality quiz provides a couples of questions for the user to answer and then show the result about personality.

## Features
What features are required to produce a fun personality quiz? The app accomplishes three main goals:
1. Introduce the player to the quiz.
2. Present questions and answers.
3. Display the results.

## Workflow
Each feature is very distinct from the other two, so each deserves its own screen.
When user click on "Begin quiz" button, a screen will show the introduction view, then the questions, and the answering the final question
to display the results. For the purposes of this app, at least three view controllers - one to present each of the three features.

## Views
Depending on the quiz topic and the questions, the personality quiz has different input controls such as multiple-choice question, single question 
and ranged question.

## Models
- Created Question struct to holds a collection of questions.
- Created Answer struct to store a collection of answers.
- Used enum for AnimalType such as dog, cat, rabbit or turtle.

## Quick Overview
The quiz app has three view controllers:
- The first is an introduction screen with information about the quiz and a button to begin.
- The second view controller displays a question and several answers, and manages the responses. This view controller is refressed for each question,
- and depending on what kind of question, the right controls are displayed.
- The third view controller tallies up the answers and presents the final outcome.
  This result can be dismissed, allowing another player to start the quiz form the first view controller.

## Demo

https://github.com/TkhaoLanh/PersonalityQuiz/assets/98495637/2ee7b327-76b9-4009-b230-90698159b35c




