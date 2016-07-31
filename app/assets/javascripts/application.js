// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var attempts = [];
var recognition = new webkitSpeechRecognition();
var recognizing = false;
var final_transcript = '';

recognition.continuous = false;
recognition.interimResults = true;

recognition.onstart = function() {
  showRecordingIndication()
  recognizing = true;
};

recognition.onend = function() {
  stopRecordingIndication()
  recognizing = false;
  if (!final_transcript) {
    return;
  }
};

recognition.onresult = function(event) {
  var interim_transcript = '';
  for (var i = event.resultIndex; i < event.results.length; ++i) {
    if (event.results[i].isFinal) {
      final_transcript += event.results[i][0].transcript;
      showInInput(final_transcript);
    } else {
      interim_transcript += event.results[i][0].transcript;
      showInInput(interim_transcript);
    }
  }
  takeAGuess(final_transcript);
};


function startGuessing(event) {
  recognition.stop();
  final_transcript = '';
  recognition.start();
}

function takeAGuess(guess) {
  if (guess == "igiveup") {
    revealAnswer();
    return;
  } else if (guess == "tryagain") {
    tryAgain();
    return;
  }

  phares_id = $("#phrase_id").val()
  $.ajax({
    url: '/phrases/'+phares_id+'/check_guess.json?guess='+guess,
    dataType: 'json'
  }).success(function(data) {
    if (data.result == true) {
      showSuccess()
      playSound("success")

      // light
      // music
      //after 5 seconds - refresh
    } else {
      showFailure()
      // error note
      // "bad" music
      // red light
    }
  }).fail(function() {
    alert("failed");
  });
};

function revealAnswer() {
  $(".phrase_text").show();
}

function showSuccess() {
  $(".fail").hide();
  $(".images").hide();
  $(".success").show();
}

function showFailure() {
  $(".success").hide();
  $(".images").hide();
  $(".fail").show();
}

function tryAgain() {
  $(".success").hide();
  $(".fail").hide();
  $(".images").show();
}

function playSound(type) {
  const minFileIndex = 1
  const maxFileIndex = 4
  const audioFile = "../assets/" + type + (Math.floor(Math.random() * (maxFileIndex - minFileIndex + 1)) + minFileIndex) + ".wav"
  var audio = new Audio(audioFile);
  audio.play();
}

function normalizeGuess(guess) {
  return (guess.toLowerCase().replace(/ /g, ""));
}

function showInInput(phrase) {
  var guess = document.getElementById("guess");
  guess.innerHTML = phrase;
}

function showRecordingIndication() {
  var indicationDiv = document.getElementById('record-indication');
  indicationDiv.innerHTML = "recording...";
};

function stopRecordingIndication() {
  var indicationDiv = document.getElementById('record-indication');
  indicationDiv.innerHTML = "";
};

