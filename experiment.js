var affect_grid = []; // main timeline

// full screen
affect_grid.push({
  type: 'fullscreen',
  message: '<div class="instructions"><p>Press the button below to enter full screen mode.</p></div>',
  fullscreen_mode: true
});

// instructions
var instructions = {
  type: "html-keyboard-response",
  stimulus: "<div class='instructions'><p>Please read the printed instructions which explain <strong>The Affect Grid</strong>.</p>" +
            "<p>Contact the researcher if you do not have a copy of these instructions.</p>" +
            "<p>When you understand how to complete the affect grid, press any key to continue.</p></div>",
  data: {test_part: 'instructions'},
  post_trial_gap: 1000
};
affect_grid.push(instructions);

var button_html = [];
for (i=0; i <= 80; i++) {
  button_html[i] = '<button class="jspsych-btn"></button>';
}
button_html[0] = '<button class="jspsych-btn"><span class="label" id="stress">Stress</span></button>';
button_html[4] = '<button class="jspsych-btn"><span class="label" id="arousal">High Arousal</span></button>';
button_html[8] = '<button class="jspsych-btn"><span class="label" id="excitement">Excitement</span></button>';
button_html[36] = '<button class="jspsych-btn"><span class="label" id="unpleasant">Unpleasant Feelings</span></button>';
button_html[44] = '<button class="jspsych-btn"><span class="label" id="pleasant">Pleasant Feelings</span></button>';
button_html[72] = '<button class="jspsych-btn"><span class="label" id="depression">Depression</span></button>';
button_html[76] = '<button class="jspsych-btn"><span class="label" id="sleepiness">Sleepiness</span></button>';
button_html[80] = '<button class="jspsych-btn"><span class="label" id="relaxation">Relaxation</span></button>';

var choices = numberRange(1, 81)
var trial = {
    type: 'html-button-response',
    stimulus: '<p id="grid-question">Please rate how you are feeling right now.</p>',
  	choices: choices,
    button_html: button_html,
    prompt: "<p id='grid-prompt'>Click the mouse in a cell.</p>",
    data: {test_part: 'response'}
};
affect_grid.push(trial);

affect_grid.push({
    type: "html-keyboard-response",
    stimulus: "<div class='instructions'><p>Thank you for completing this task.</p><p>Press any key to continue.</p></div>",
    trial_duration: 10000,
});
affect_grid.push({
  type: 'fullscreen',
  fullscreen_mode: false
});


function numberRange (start, end) {
  return new Array(end - start + 1).fill().map((d, i) => i + start);
}
