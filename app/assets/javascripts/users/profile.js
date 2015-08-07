$(function(){

    $.validator.setDefaults({
        submitHandler: function() {
            updateProfile();

            return false;
        }
    });

    $("input, textarea").keydown(function(){
        $(".message").html("");
    });

    initializeValidation();
});

function updateProfile(){

    $(".message").html("Updating profile...");

    var data = $("#form-user-profile").serialize();

    $.ajax({
        url: root + 'update-profile',
        data: data,
        type: 'post',
        dataType: 'json',
        success: function(result){

            if(result!=undefined && result.message!=undefined && result.message.indexOf('not logged')>-1) {
                window.location.replace = root;
                return;
            }

            $(".message").html(result.message);
        }
    })
}

function initializeValidation(){
    $("#form-user-profile").validate({
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