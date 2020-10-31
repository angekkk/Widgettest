var input = document.querySelector('.text');
var dialog = document.querySelector('dialog');
var showDialogButton = document.querySelector('#show-dialog');


window.addEventListener('DOMContentLoaded', () => {
    const button = document.querySelector('#emoji-button');
    const picker = new EmojiButton({
        position: 'right-start'
    });

    picker.on('emoji', emoji => {
        input.value += emoji;

    });

    button.addEventListener('click', () => {
        picker.pickerVisible ? picker.hidePicker() : picker.showPicker(button);
    });

});


