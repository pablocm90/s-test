//get data-id attribute in plain Javascript
const printDataId = () => {
  const elements = document.querySelectorAll('.quiz-card');
  // const hello = document.querySelector('.hello');
  // console.log(hello);
  elements.forEach((item) => {
    // console.log(dataID);
    item.addEventListener("click", (event) => {
      const dataID = item.getAttribute('data-quiz-id');
      fetch(`http://localhost:3000/quizzes/${dataID}`)
        .then((response) => {
          // console.log(response);
          response.json().then((data) => {
                  console.log(data);
                  // const quizTitle = document.querySelector('.quiz-title');
                  // console.log(data.title);
                  // quizTitle.innerText = data.title;
                  // const quizQuestion = document.querySelector('.quiz-question');
                  // const quizFirstAnswer = document.querySelector('.first-answer');
                  // const quizSecondAnswer = document.querySelector('.second-answer');
                  // const quizThirdAnswer = document.querySelector('.third-answer');
                  // const quizFourthAnswer = document.querySelector('.fourth-answer');
              });
        });
    });
  });
};


export { printDataId };


// console.log(elements);
// var dataID = element.getAttribute('data-quiz-id');