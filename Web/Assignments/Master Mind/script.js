/*                         */
/* Author: Vahid Dolatyari */
/*                         */

const answerString = Math.floor(Math.random() * 10000).toString().padEnd(4, '0')
let   guessIndex = 1


function onSubmit() {
    let answer = answerString.split('')
    let guess = submitInput.value.split('')
    //
    let   correctPlaced = 0
    let incorrectPlaced = 0
    // check for correct placed numbers
    for (let checkIndex=0; checkIndex<4; ++checkIndex)
        if (answer[checkIndex] === guess[checkIndex]) {
            ++correctPlaced
            // remove checked number!
            answer[checkIndex] = '*' // '*' marks the letter as checked
             guess[checkIndex] = '*'
        }
    // check for incorrect placed letters
    for (let guessIndex=0; guessIndex<4; ++guessIndex) {
        if (guess[guessIndex] !== '*')
            for (let answerIndex=0; answerIndex<4; ++answerIndex) {
                if (answer[answerIndex] !== '*' && answer[answerIndex] === guess[guessIndex]) {
                    answer[answerIndex] = '*'
                    //
                    ++incorrectPlaced
                    break
                }
            }
    }
    // add to presentation container
    document.getElementById("guesses").innerHTML +=
        '<li id="guess-1" class="guess">' +
            `<p class="column-1 value stroke">${submitInput.value}</p>` +
            `<p class="column-2 correct-places stroke">${correctPlaced}</p>` +
            `<p class="column-3 incorrect-places stroke">${incorrectPlaced}</p>` +
        '</li>'
    // move to next guess
    ++guessIndex;
    //
    //
    submitInput.value = ''
    // win statement
    if (correctPlaced === 4) {
        alert("Congratulations,\n" +
            `You guessed the correct number which is ${answerString}`)
        submitInput.value = `Answer: ${answerString}`
        submitInput.disabled = true
    }
    // loose statement
    else if (guessIndex > 10) {
        alert("Sorry, You weren't able to catch the correct answer within 10 tries!\n" +
            `The correct answer is ${answerString}`)
        submitInput.value = `Answer: ${answerString}`
        submitInput.disabled = true
    }
    //
    submitInput.focus()
    submitButton.disabled = true
}

//
const submitButton = document.getElementById("submitButton")
      submitButton.disabled = true
      submitButton.addEventListener("click", onSubmit)
      document    .addEventListener("keypress", function (event) {
          if (!submitButton.disabled && event.key === 'Enter')
              onSubmit()
      })
//
const submitInput = document.getElementById("submitInput");
      submitInput.value = ''
      submitInput.addEventListener("input", function (object) {
          if ((object.data != null && isNaN(parseInt(object.data)))
              || submitInput.value.length > 4)
              submitInput.value = submitInput.value.slice(0, -1)
          //
          submitButton.disabled = submitInput.value.length !== 4
      })

