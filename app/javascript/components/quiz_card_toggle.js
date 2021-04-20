//get data-id attribute in plain Javascript
const printDataId = () => {
  const elements = document.querySelectorAll('.quiz-card');
  // const hello = document.querySelector('.hello');
  // console.log(hello);
  elements.forEach((item) => {
    // console.log(dataID);
    item.addEventListener("click", (event) => {
      const dataID = item.getAttribute('data-quiz-id');
      console.log(dataID);
      fetch(`http://localhost:3000/quizzes/${dataID}`)
        .then((response) => {
          // console.log(response);
          response.json().then((data) => {
                  console.log(data);
              });
        });
    });
  });
};


export { printDataId };


// console.log(elements);
// var dataID = element.getAttribute('data-quiz-id');