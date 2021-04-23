const nextQuestion = () => {
  const firstQuestionBlock = document.querySelector('#first-question-block');
  const secondQuestionBlock = document.querySelector('#second-question-block');
  const thirdQuestionBlock = document.querySelector('#third-question-block');
  
  const firstAnswersBlock = document.querySelectorAll('#first-answers-block');
  const secondAnswersBlock = document.querySelectorAll('#second-answers-block');
  
  const results = document.querySelector('.results');

  firstAnswersBlock.forEach((item) => {
    item.addEventListener("click", (event) => {
      firstQuestionBlock.classList.remove("active");
      secondQuestionBlock.classList.add("active");
    });
  });

  secondAnswersBlock.forEach((item) => {
    item.addEventListener("click", (event) => {
      secondQuestionBlock.classList.remove("active");
      thirdQuestionBlock.classList.add("active");
    });
  });
}

export { nextQuestion };
