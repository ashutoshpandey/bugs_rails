$(function(){

    $.validator.setDefaults({
        submitHandler: function() {
            updateUser();

            return false;
        }
    });

    $("input, textarea").keydown(function(){
        $(".message").html("");
    });

    initializeValidation();
});

function updateUser(){

    $(".message").html("Updating profile...");

    var data = $("#form-edit-user").serialize();

    $.ajax({
        url: root + 'update-user',
        data: data,
        type: 'post',
        dataType: 'json',
        success: function(result){

            if(result!=undefined && result.message!=undefined) {
                if (result.message.indexOf('not logged') > -1) {
                    window.location.replace = root;
                    return;
                }

                $(".message").html(result.message);
            }
        }
    })
}

function initializeValidation(){
    $("#form-edit-user").validate({
        rules: {
            email: {
                required: true,
                email: true
            },
            name: "required",
            password: "required",
            confirm_password: {
                required: true,
                equalTo: "#password"
            }
        },
        messages: {
            email: "Please enter a valid email",
            name: "Please enter name",
            password: "Please enter password",
            confirm_password: {
                required: "Please provide a password",
                equalTo: "Please enter the same password as above"
            }
        }
    });
}