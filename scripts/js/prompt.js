/*
    Document   : prompt.js
    Created on : Feb 25, 2017
    Author     : Chris Meyers
    Description:
        Handles the functionality of the hidden prompt.
          - The prompt can be opened by pressing the '~' key
            when the website is using csselements.css.
*/

var prompt = function() {
    var promptHistory = [];
    var promptHistoryLocation = 0;

    var processPromptInput = function(input) {
        var sanitizedInput = input.trim().toLowerCase().replace(/ +(?= )/g,'');
        if(sanitizedInput === "") {
            $("#prompt").val("");
            return;
        }

        var parts = sanitizedInput.split(' ');

        $("#prompt").val('');
        promptHistory.push(input);

        switch(parts[0]) {
            case "cd": {
                var newPage = ((parts.length > 1) ? parts[1] : "about");
                // Ensure the page exists.
                $.each(jselements.getPageFlow(), function(i, section) {
                    if(section == newPage) {
                        window.location.hash = newPage;
                        return false; // break loop
                    }
                });
                break;
            }
            case "history":
            case "open": {
                showHistory(true);
                return;
            }
            case "echo": {
                window.alert(input.substring(input.indexOf(' ') + 1));
                break;
            }
            case "clear": {
                $('#prompt-textarea').empty();
                promptHistory = [];
                return;
            }
            case "close": {
                if(jselements.isIdShown('prompt-textarea')) {
                    hidePromptTextarea();
                }
                break;
            }
            case "help":
            case "?":
            case "man": {
                if(!jselements.isIdShown('prompt-textarea')) {
                    showPromptTextarea();
                }
                printHelpMessage();
                return;
            }
            case "exit": {
                handlePromptDisplay();
                break;
            }
            default:
                return;
        }

        if(jselements.isIdShown('prompt-textarea')) {
            showHistory(true);
        }
    }

    var movePromptCursorToEnd = function() {
        var promptTextbox = document.getElementById("prompt");
        var promptLength = promptTextbox.value.length;

        promptTextbox.focus();
        promptTextbox.setSelectionRange(promptLength, promptLength);
    }

    var showHistory = function(fromText) {
        $('#prompt-textarea').empty();

        if(jselements.isIdShown('prompt-textarea') && !fromText) {
            hidePromptTextarea();
        }
        else {
            showPromptTextarea();
        }

        for(i = 0; i < promptHistory.length; i++) {
            $('#prompt-textarea').append(promptHistory[i]);
            if(i !== (promptHistory.length - 1)) {
                $('#prompt-textarea').append("\n");
            }
        }

        $('#prompt-textarea').scrollTop($('#prompt-textarea')[0].scrollHeight);

        if(!fromText) {
            movePromptCursorToEnd();
        }
    }

    var handlePromptDisplay = function() {
        if(jselements.isIdShown('prompt-div')) {
            hidePromptTextarea();
            $('#prompt-div').css('display', 'none');
        }
        else {
            $('#prompt-div').css('display', 'flex');
            movePromptCursorToEnd();
        }
    }

    var showPromptTextarea = function() {
        $('#prompt-textarea').css('display', 'flex');
        $('#prompt-textarea-btn').html("&#9660;"); // down symbol
    }

    var hidePromptTextarea = function() {
        $('#prompt-textarea').css('display', 'none');
        $('#prompt-textarea-btn').html("&#9650;"); // up symbol
    }

    var printHelpMessage = function() {
        $('#prompt-textarea').empty();

        var msg = "===== Prompt de Comando Implementado =====                                         \n";
        msg +=    "Os seguintes comandos são possíveis:                                   \n";
        msg +=    "  cd [Seção] - Mostra a seção especifica.                        \n";
        msg +=    "  history|open - Mostra a caixa de texto do prompt.                          \n";
        msg +=    "  echo [Texto] - Sobe uma janela de alerta com o texto colocado.                          \n";
        msg +=    "  clear - limpa o texto e histórico do prompt.                           \n";
        msg +=    "  close - feicha a caixa de texto do prompt, se mostrado.                         \n";
        msg +=    "  exit - Fecha o prompt.                                             \n";
        msg +=    "  help|?|man - Mostra essa mensagem.                                     ";

        $('#prompt-textarea').append(msg);
        $('#prompt-textarea').scrollTop(0);
    }

    // Prompt scope key events (when prompt is in focus)
    $("#prompt").keyup(function(event) {
        var currentKey = event.keyCode;

        switch(currentKey) {
            case 13: { // enter - send command
                processPromptInput($("#prompt").val());
                promptHistoryLocation = 0;
                break;
            }
            case 38: { // up arrow - cycle through history
                if(promptHistory.length !== 0){
                    if(promptHistoryLocation < promptHistory.length) {
                        promptHistoryLocation++;
                        $("#prompt").val(promptHistory[promptHistory.length - promptHistoryLocation]);
                    }
                    else {
                        movePromptCursorToEnd();
                    }
                }
                break;
            }
            case 40: { // down arrow - cycle through history
                if(promptHistory.length !== 0 && promptHistoryLocation > 0) {
                    promptHistoryLocation--;
                    $("#prompt").val(promptHistory[promptHistory.length - promptHistoryLocation]);
                }
                break;
            }
            default:
                break;
        }
    });

    $("#prompt").keypress(function(event) {
        // prevent backtick's in prompt
        if(event.charCode === 96) {
            return false;
        }
    });

    $("#prompt-textarea-btn").on("click", function() {
        showHistory(false);
    });

    return {
        handlePromptDisplay : handlePromptDisplay
    }
}();
