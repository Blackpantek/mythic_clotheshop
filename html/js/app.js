var outfitData = null;

window.addEventListener('message', function (event) {
    if (event.data.action === "new") {
        outfitData = event.data.outfit;
        $('#new-outfit').fadeIn();

        if(event.data.type) {
            $('.new-alert').fadeIn();
        }
    }else if(event.data.action === 'overwrite') {
        outfitData = event.data.outfit;
        if(!event.data.isNewChar) {
            $('#old-outfit').find('.outfit-name').val("" + event.data.label)
        }
        $("#old-outfit").fadeIn();

        if(event.data.type) {
            $('.new-alert').fadeIn();
        }
    }
});

$(document).ready(function () {
    $('.btn-save').click(function() {
        if($('#new-outfit').find('.outfit-name').val() === "") {
            $.post("http://mythic_clotheshop/SaveOutfit", JSON.stringify({
                label: null,
                outfit: outfitData,
            }));
            $("#new-outfit").hide();
            $('.new-alert').hide();
        } else {
            $.post("http://mythic_clotheshop/SaveOutfit", JSON.stringify({
                label: $('#new-outfit').find('.outfit-name').val(),
                outfit: outfitData,
            }));
            $("#new-outfit").hide();
            $('.new-alert').hide();
        }
    })
});

$(document).ready(function () {
    $('.btn-overwrite').click(function() {
        if($('#old-outfit').find('.outfit-name').val() === "") {
            $.post("http://mythic_clotheshop/OverwriteOutfit", JSON.stringify({
                label: null,
                outfit: outfitData,
            }));
            $("#old-outfit").hide();
            $('.new-alert').hide();
        } else {
            $.post("http://mythic_clotheshop/OverwriteOutfit", JSON.stringify({
                label: $('#old-outfit').find('.outfit-name').val(),
                outfit: outfitData,
            }));
            $("#old-outfit").hide();
            $('.new-alert').hide();
        }
    })
});