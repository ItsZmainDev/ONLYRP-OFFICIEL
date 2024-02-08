document.getElementById("textArea").addEventListener("keyup", function(event) {
    event.preventDefault();
    if (event.keyCode === 13 && $("#keyboard-input").is(":visible") && $("#textArea").is(":focus")) {
        $.post("https://"+GetParentResourceName()+"/send",JSON.stringify({"text":document.getElementById("textArea").value.trim()}));
        document.getElementById("textArea").value = "";
        $("#keyboard-input").hide();
    }
    if (event.keyCode === 27 && $("#keyboard-input").is(":visible") && $("#textArea").is(":focus")) {
        $.post("https://"+GetParentResourceName()+"/cancel",JSON.stringify({}));
        document.getElementById("textArea").value = "";
        $("#keyboard-input").hide();
    }
});

window.addEventListener("message",(event)=>{
    switch(event.data.type){
        case "showKeyboard":
            $(".title").text(event.data.title);
            $("#textArea").val("");
            $("#keyboard-input").show();
            setTimeout(()=>{
                $("#textArea").focus();
            },10);
            break;
    }
})

class ZoneSafeHandler{
    constructor(){
        this.mainElement = $('.safezone-container');
        this.itemElement = $('.safezone-item');
        this.bodyElement = $('.safezone-body');
        this.descElement = $('#safezone-desc');

        this.isInSafezoneText = "Vous rentrez dans une zone sécurisée";
        this.isNotInSafezoneText = "Vous sortez de la zone sécurisée";
        this.defaultTime = 2500;
        this.isInSafezone = false;

        window.addEventListener('message', (event) => {
           const type = event.data.type;
           switch (type) {
                case 'safezone:set':
                    this.handleSafezone(event.data)
                    break;
               case 'safezone:setTimeMessage':
                    this.defaultTime = event.data.defaultTime;
                    break;
           }
        });
    }

    handleSafezone(data){
        this.isInSafezone = data.isInSafezone;
        this.bodyElement.removeClass('scale-out-top');
        this.itemElement.removeClass('scale-in-top');
        this.itemElement.removeClass('scale-out-top');
        this.bodyElement.removeClass('scale-out-top');
        this.mainElement.removeClass('active');
        this.mainElement.show();
        setTimeout(()=>{
            this.itemElement.addClass('scale-in-top');
            if(this.isInSafezone){

                this.mainElement.addClass("green");
                this.mainElement.removeClass("red");
                this.descElement.text(this.isInSafezoneText);
                setTimeout(()=>{
                    if(this.isInSafezone){
                        this.itemElement.removeClass('scale-in-top');
                        this.bodyElement.addClass('scale-out-top');
                        this.mainElement.addClass('active');
                    }
                },this.defaultTime);
            }
            else{
                this.bodyElement.removeClass('scale-out-top');
                this.mainElement.removeClass('active');
                this.mainElement.removeClass("green");
                this.itemElement.addClass('scale-in-top');
                this.mainElement.addClass("red");
                this.descElement.text(this.isNotInSafezoneText);
                setTimeout(()=>{
                    if(!this.isInSafezone){
                        this.itemElement.removeClass('scale-in-top');
                        this.itemElement.addClass('scale-out-top');
                    }
                },this.defaultTime);
            }
        },100);

    }
}

new ZoneSafeHandler();