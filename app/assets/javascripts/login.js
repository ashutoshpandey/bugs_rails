$(function(){
    $("input[name='btn-login']").click(checkLogin);

    $("input").keydown(function(){
        $(".message").html("");
    });
});

function checkLogin(){

    var frm = $("#form-login").serialize();

    $(".message").html("Checking...");

    $.ajax({
        url: root + 'is-valid-user',
        type: 'post',
        data: frm,
        dataType: 'json',
        success: function(data){

            if(data!=undefined  && data.message!=undefined && data.message.indexOf('invalid')>-1)
                $(".message").html('Invalid email or password');
            else if(data!=undefined  && data.message!=undefined && data.message.indexOf('correct')>-1)
                window.location.replace(root + 'user-section');
            else
                $(".message").html('Server error');
        }
    });
}