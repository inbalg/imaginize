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
      takeAGuess(final_transcript);
    } else {
      interim_transcript += event.results[i][0].transcript;
      showInInput(interim_transcript);
    }
  }
};

function startGuessing(event) {
  recognition.stop();
  final_transcript = '';
  recognition.start();
}

function takeAGuess(guess) {
  guess = normalizeGuess(guess);
  if (guess == "igiveup") {
    revealAnswer();
    return;
  }

  phares_id = $("#phrase_id").val()
  $.ajax({
    url: '/phrases/'+phares_id+'/check_guess.json?guess='+guess,
    dataType: 'json'
  }).success(function(data) {
    if (data.result == true) {
      playSuccessSound();
      showSuccess();
    } else {
      playFailureSound();
      showFailure();
    }
  }).fail(function() {
    alert("failed");
  });
};

function revealAnswer() {
  playGiveUpSound();
  $(".phrase_text").show();
  $("#take-a-guess").hide();
  setTimeout(function() {
    $(".phrase_text").hide();
    $(".images").hide();
    nextPhrase();
    tryAgain();
  }, 4000)
}

function showSuccess() {
  $("#take-a-guess").hide();
  $(".fail").hide();
  $(".images").hide();
  $(".success").show();
  setTimeout(function() {
    nextPhrase();
  }, 3000)
}

function showFailure() {
  $("#take-a-guess").hide();
  $(".success").hide();
  $(".images").hide();
  $(".fail").show();
  setTimeout(function() {
    tryAgain();
  }, 3000)
}

function nextPhrase() {
  $.ajax({
    url: '/',
    dataType: 'json'
  }).success(function(data) {
    $('.word').remove();
    var images = "";
    data.images.forEach(function(image){
      images += "<img class='word' src=" + image +'>';
    });
    $('.images').prepend(images);
    $('.images label').text(data.phrase_text);
    $('#phrase_id').val(data.phrase_id);
    $('h2 img').attr('src', 'assets/' + data.phrase_category + ".svg");
    showInInput('');
    $(".success").hide();
    $("#take-a-guess").show();
    $('.images').show();
  }).fail(function() {
    alert("failed");
  });
}

function tryAgain() {
  showInInput('');
  $(".success").hide();
  $(".fail").hide();
  $(".images").show();
  $("#take-a-guess").show();
}

function playSuccessSound()
{
  var audio = new Audio("../assets/success1.wav")
  audio.play();
}

function playFailureSound()
{
  var audio = new Audio("../assets/fail1.wav")
  audio.play();
}

function playGiveUpSound() {
  var audio = new Audio("../assets/giveup.wav");
  audio.play();
}

function normalizeGuess(guess) {
  return (guess.toLowerCase().replace(/ /g, ""));
}

function showInInput(phrase) {
  var guess = document.getElementById("guess-placeholder");
  guess.innerHTML = phrase;
}

function showRecordingIndication() {
  $('#while-guess').show();
  $('#before-guess').hide();
};

function stopRecordingIndication() {
  $('#while-guess').hide();
  $('#before-guess').show();
};

