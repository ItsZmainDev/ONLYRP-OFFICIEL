$('body').hide();
window.addEventListener('message', function (event) {
    const data = event.data

    if (data.action === "change") {
        $('body').fadeIn()
        $("span").text(data.text);

        const spanElement = document.getElementById('cityText');

        const text = spanElement.innerText;
        
        const numberOfWords = text.trim().split(/\s+/).length;

        const divElement = document.getElementById('vehicleCity');

        const divElement2 = document.getElementById('mapImg');
        
        divElement.style.width = "11%"
        divElement2.style.left = "45.3%"

        if (numberOfWords === 4) {
            divElement.style.width = "15%"
            divElement2.style.left = "43.5%"
        }
        
        var imageElement = document.getElementById("ems");

        imageElement.classList.add("hidden");

        var imageElement = document.getElementById("cityText");
        imageElement.classList.add("show");

        var imageElement = document.getElementById("ems");

        imageElement.classList.add("hidden");
    }
    if (data.action === "not") {
        $('body').fadeOut()
    }
    if (data.action === "yes") {
        $('body').fadeIn()
    }

    if (data.action === "emsYes") {
        $('body').fadeIn()

        var imageElement = document.getElementById("ems");

        imageElement.classList.add("hidden");

        var imageElement2 = document.querySelector(".cityVehicle");
        var imageElement4 = document.querySelector(".imgMap");

        imageElement.classList.add("show");

        imageElement2.classList.add("hidden");
        imageElement4.classList.add("hidden");
    }
    if (data.action === "emsNone") {
        var imageElement = document.getElementById("ems");

        imageElement.classList.add("hidden");

        $("body").fadeOut()
    }
    
    if (data.action === "time") {
        $("a.timeee").text(data.time + ' Minutes');

        if (data.time <= 0) {
            $("a.timeee").text("Temps finis");
        }
    }
});

$("#btn1").click(function(){ 
    $.post("https://ZmainDev/contactEMS", JSON.stringify({}))
});

$("#btn2").click(function(){ 
    $.post("https://ZmainDev/returnHopital", JSON.stringify({}))
});