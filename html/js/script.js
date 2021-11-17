var ownerdNotepad, notepadreader;
document.onkeyup = function (data) {
    if (data.which == 27) {
        $.post('https://qb-notepad/escape', JSON.stringify({}));
        if (notepadreader == true) {
            let x = document.getElementById("p1").value;
            $.post('https://qb-notepad/updating', JSON.stringify({ text: x}));
            $("#main").fadeOut();
            $("#main").css('display', 'none');
            notepadreader = false;
            document.getElementById("p1").value = "";
        }else {
            ownerdNotepad = document.getElementById("p1").value;
            $("#main").fadeOut();
            $("#main").css('display', 'none');
        }
    }
};

window.addEventListener('message', function(e) {
    switch(event.data.action) {
        case 'openNotepad':
            if (ownerdNotepad === undefined){
                document.getElementById("p1").value = "";
                $("#main").fadeIn();
            }else {
                $("textarea").removeAttr('disabled','disabled');
                document.getElementById("p1").value = ownerdNotepad;
                $("#main").fadeIn();
            }
            break;
        case 'closeNotepad':
            $("#main").fadeOut();
            $("#main").css('display', 'none');
            break;
        case 'cleanNotepad':
            document.getElementById("p1").value = "";
            break;
    }
});