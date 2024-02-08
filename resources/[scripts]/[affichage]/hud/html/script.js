$('.hud, .menu, .carhud').hide();
window.onload = loaded
let pincar = false;
let mp = `${localStorage.getItem('mic') ? localStorage.getItem('mic') :             localStorage.setItem('mic', undefined)}`;
let hp = `${localStorage.getItem('healt') ? localStorage.getItem('healt') :         localStorage.setItem('healt', undefined)}`;
let ap = `${localStorage.getItem('armour') ? localStorage.getItem('armour') :       localStorage.setItem('armour', undefined)}`;
let hpp = `${localStorage.getItem('hunger') ? localStorage.getItem('hunger') :      localStorage.setItem('hunger', undefined)}`;
let tp = `${localStorage.getItem('thrist') ? localStorage.getItem('thrist') :       localStorage.setItem('thrist', undefined)}`;
let op = `${localStorage.getItem('oxygen') ? localStorage.getItem('oxygen') :       localStorage.setItem('oxygen', undefined)}`;
// let al = `${localStorage.getItem('alcool') ? localStorage.getItem('alcool') :       localStorage.setItem('alcool', undefined)}`;

let mc = `${localStorage.getItem('miccolor')      ? localStorage.getItem('miccolor') :           localStorage.setItem('miccolor', undefined)}`;
let hc = `${localStorage.getItem('healtcolor')    ? localStorage.getItem('healtcolor') :         localStorage.setItem('healtcolor', undefined)}`;
let ac = `${localStorage.getItem('armourcolor')   ? localStorage.getItem('armourcolor') :        localStorage.setItem('armourcolor', undefined)}`;
let hcc = `${localStorage.getItem('hungercolor')  ? localStorage.getItem('hungercolor') :        localStorage.setItem('hungercolor', undefined)}`;
let tc = `${localStorage.getItem('thristcolor')   ? localStorage.getItem('thristcolor') :        localStorage.setItem('thristcolor', undefined)}`;
let oc = `${localStorage.getItem('oxygencolor')   ? localStorage.getItem('oxygencolor') :        localStorage.setItem('oxygencolor', undefined)}`;
// let alc = `${localStorage.getItem('alcoolcolor') ? localStorage.getItem('alcoolcolor') :       localStorage.setItem('alcoolcolor', undefined)}`;


$('.hud, .carhud').draggable({
    stop : function( event, ui ) {
        localStorage.setItem(`${event.target.dataset.type}`, $(`.hud[data-type="${event.target.dataset.type}"]`).attr('style'))
    }
});

let colors = {
    "yellow": "rgba(255, 222, 33, 0.85)",
    "white" : "rgba(250, 250, 250, 0.85)",
    "red"   : "rgba(255, 55, 44, 0.85)",
    "def"   : "rgba(189, 189, 189, 0.502)",
};

let bar = new ProgressBar.Circle(".damage", {
    strokeWidth: 10,
    easing: 'easeInOut',
    duration: 250,
    color: '#c0c0c0',
    trailColor: '#39393980',
    trailWidth: 10,
    svgStyle: null
});

var mic = new ProgressBar.Circle(`.hud[data-type="mic"]`, {
    strokeWidth: 10,
    easing: 'easeInOut',
    duration: 250,
    color: '#c0c0c0',
    trailColor: '#393939',
    trailWidth: 10,
    svgStyle: null
});

var healt = new ProgressBar.Circle(`.hud[data-type="healt"]`, {
    strokeWidth: 10,
    easing: 'easeInOut',
    duration: 250,
    color: '#1CE219',
    trailColor: '#393939',
    trailWidth: 10,
    svgStyle: null
});

var armour = new ProgressBar.Circle(`.hud[data-type="armour"]`, {
    strokeWidth: 10,
    easing: 'easeInOut',
    duration: 250,
    color: '#c0c0c0',
    trailColor: '#393939',
    trailWidth: 10,
    svgStyle: null
});

var hunger = new ProgressBar.Circle(`.hud[data-type="hunger"]`, {
    strokeWidth: 10,
    easing: 'easeInOut',
    duration: 250,
    color: '#F57600',
    trailColor: '#393939',
    trailWidth: 10,
    svgStyle: null
});

var thrist = new ProgressBar.Circle(`.hud[data-type="thrist"]`, {
    strokeWidth: 10,
    easing: 'easeInOut',
    duration: 250,
    color: '#00AAFF',
    trailColor: '#393939',
    trailWidth: 10,
    svgStyle: null
});


var oxygen = new ProgressBar.Circle(`.hud[data-type="oxygen"]`, {
    strokeWidth: 10,
    easing: 'easeInOut',
    duration: 250,
    color: '#c0c0c0',
    trailColor: '#393939',
    trailWidth: 10,
    svgStyle: null
});

// var alcool = new ProgressBar.Circle(`.hud[data-type="alcool"]`, {
//     strokeWidth: 10,
//     easing: 'easeInOut',
//     duration: 250,
//     color: '#6A4C90',
//     trailColor: '#393939',
//     trailWidth: 10,
//     svgStyle: null
// });

$('input').change(function (e) { 
    if (e.target.id == "checkbox") {
        return;
    }
    $(`.hud[data-type="${$(this).attr('id')}"]`).children('svg').find('path').eq(1).css({
        "stroke": $(this).val()
    });
    localStorage.setItem(`${$(this).attr('id') + "color"}`, $(this).val());
});

$(document).on('click', '#checkbox', function(){
    const data  = $(this).data('input');
    const state = $(this).is(':checked');

    if (data == "cinematic") {
        if (state) {
            $('.hud, .carhud').fadeOut(250);
            $('.top, .bottom').fadeIn(500);
        }else {
            if (pincar) {
                $('.carhud').fadeIn(250);
            }

            $('.hud').fadeIn(250);
            $('.top, .bottom').fadeOut(500);

            $('body').fadeIn(250);
        }
    }

    $.post('http://hud/checkbox', JSON.stringify({data, state}));
});

window.addEventListener('message', function (event) {
    let e = event.data;
    switch (e.type) {
        case "pLoaded":
            $('.hud').fadeIn(250);
            $('body').fadeIn(250);
            break;
        case "playerStatus":
            pstat(e.heal, e.armour, e.hunger, e.thirst, e.thirst, e.oxygen, e.weather);
            break;
        case "inCar":
            incar();
            break;
        case "outCar":
            outcar();
            break;
        case "carStatus":
            carstat(e.engine, e.door, e.light, parseInt(e.fuel), e.speed, e.ehealt, e.rpm, e.gear, e.hbreake, e.belt, e.street1, e.street2);
            break;
        case "pause":
            $('body').fadeOut(250);
            break;
        case "show":
            $('body').fadeIn(250);
            break;
        case "mic":
            if (e.state) {
                $('#micd').fadeOut(100);
                $('#mica').fadeIn(100);
            }else {
                $('#micd').fadeIn(100);
                $('#mica').fadeOut(100);
            }
            break;
        case "micDistance":
            mic.animate(e.range / 100)
            break;
        case "triggerevent":
            if (e.state) {
                $('body').fadeOut(250);
            }else {
                $('body').fadeIn(250);
            }
            break;
        case "menu_open":
            $('.menu').fadeIn(250);
            break;
        case "menu_close":
            $('.menu').fadeOut(250);
            break;
        default: break;
    }
});

document.addEventListener('DOMContentLoaded', (event) => {
    document.onkeyup = function(data){
        if (data.key == "Escape"){
            $.post('http://hud/close', JSON.stringify({}));
        }
    }
})

function pstat(heals, armours, hungers, thirsts, alcools, oxygens, weathers) {
    healt.animate(heals / 100)
    armour.animate(armours / 100)
    hunger.animate(hungers / 100)
    thrist.animate(thirsts / 100)
    // alcool.animate(alcools / 100)


    if (weathers) {
        $('.hud[data-type="oxygen"]').fadeIn(250);
        oxygen.animate(oxygens / 100)
    }else {
        $('.hud[data-type="oxygen"]').fadeOut(250);
    }

}

function carstat(engine, door, light, fuel, speed, ehealt, rpm, gear, hbreake, belt, street1, street2) {

    if (speed < 310) {
        $('#speed-progress').animate({
            "stroke-dasharray" : 754 + (speed * 1.25)
        }, 1);
    }

    let nrpm = rpm * 9

    $('#rpm-progress').animate({"stroke-dasharray" : 628 + (nrpm * 11)}, 1);
    $('#rpm-progress').css({
        "stroke": `${nrpm < 5 ? colors["white"] : nrpm >= 7 ? colors["red"] : nrpm >= 5 ? colors["yellow"] : colors["white"] }`
    });

    $('#gear').css({
        "color": `${nrpm < 5 ? colors["white"] : nrpm >= 7 ? colors["red"] : nrpm >= 5 ? colors["yellow"] : colors["white"] }`
    });

    $('#kmh').html(`${speed}`);

    $('#gear').html(`${gear <= 0 && nrpm > 2 ? "R" : gear <= 0 ? "N" : gear}`);

    $('#firsts').html(`${street1}`);
    $('#seconds').html(`${street2}`);

    $('#engine').attr('src', `${engine ? "/html/img/engine-white.png" : "/html/img/engine.png"}`);
    $('#door').attr('src', `${door ? "/html/img/door-white.png" : "/html/img/door.png"}`);
    $('#light').attr('src', `${light ? "/html/img/light-white.png" : "/html/img/light.png"}`);

    $('#fuel-progress').animate({"stroke-dasharray" : 763 - (fuel / 2.66)}, 1);
    $('#fuel-progress').css({
        "stroke": `${fuel > 50 ? colors["white"] : fuel <= 20 ? colors["red"] : fuel <= 50 ? colors["yellow"] : colors["white"]}`
    });
    $('#fuelimg').attr('src', `${fuel > 50 ? '/html/img/fuel.png' : fuel <= 20 ? '/html/img/fuel-red.png' : fuel <= 50 ? '/html/img/fuel-yellow.png' : '/html/img/fuel-red.png'}`);
    $('#fuel').html(`${fuel}%`);
    $('#fuel').css({
        "color": `${fuel > 50 ? colors["white"] : fuel <= 20 ? colors["red"] : fuel <= 50 ? colors["yellow"] : colors["white"]}`
    });

    bar.animate(parseInt(ehealt) / 1000);
    $('#cardamage').html(`${parseInt(ehealt / 10) + "%"}`);
    $('#cardamage').css({"color": `${parseInt(ehealt / 10) > 50 ? colors["white"] : parseInt(ehealt / 10) <= 20 ? colors["red"] : parseInt(ehealt / 10) <= 50 ? colors["yellow"] : colors["white"]}`});

    $('.damage').children('svg').find('path').eq(1).css({
        "stroke": `${parseInt(ehealt / 10) >= 50 ? colors["white"] : parseInt(ehealt / 10) <= 20 ? colors["red"] : parseInt(ehealt / 10) < 50 ? colors["yellow"] : colors["white"]}`
    });

    $('#breake').attr('src', `${hbreake ? '/html/img/handbrake-red.png' : '/html/img/handbrake.png'}`);
    $('#belt').attr('src', `${belt ? '/html/img/belt-white.png' : '/html/img/belt.png'}`);
}

function incar() {
    pincar = true
    $('.carhud').fadeIn(250);
}

function outcar() {
    pincar = false
    $('.carhud').fadeOut(250);
}

function loaded() {
    mic.animate(0.3);

    $('.hud[data-type="mic"]').attr('style',     `${mp  != "undefined" ? mp :  $('.hud[data-type="mic"]').attr('style')}`);
    $('.hud[data-type="healt"]').attr('style',   `${hp  != "undefined" ? hp :  $('.hud[data-type="healt"]').attr('style')}`);
    $('.hud[data-type="armour"]').attr('style',  `${ap  != "undefined" ? ap :  $('.hud[data-type="armour"]').attr('style')}`);
    $('.hud[data-type="hunger"]').attr('style',  `${hpp != "undefined" ? hpp : $('.hud[data-type="hunger"]').attr('style')}`);
    $('.hud[data-type="thrist"]').attr('style',  `${tp  != "undefined" ? tp :  $('.hud[data-type="thrist"]').attr('style')}`);
    $('.hud[data-type="oxygen"]').attr('style',  `${op  != "undefined" ? op :  $('.hud[data-type="oxygen"]').attr('style')}`);
    // $('.hud[data-type="alcool"]').attr('style',  `${al  != "undefined" ? al :  $('.hud[data-type="alcool"]').attr('style')}`);

    $('.hud[data-type="mic"]').children('svg').find('path').eq(1).css({
        "stroke": `${ mc ? mc : "#c0c0c0"}`
    });

    $('.hud[data-type="healt"]').children('svg').find('path').eq(1).css({
        "stroke": `${ hc ? hc : "#1CE219"}`
    });
    $('.hud[data-type="armour"]').children('svg').find('path').eq(1).css({
        "stroke": `${ ac ? ac : "#c0c0c0"}`
    });
    $('.hud[data-type="hunger"]').children('svg').find('path').eq(1).css({
        "stroke": `${ hcc ? hcc : "#F57600"}`
    });
    $('.hud[data-type="thrist"]').children('svg').find('path').eq(1).css({
        "stroke": `${ tc ? tc : "#00AAFF"}`
    });
    // $('.hud[data-type="alcool"]').children('svg').find('path').eq(1).css({
    //     "stroke": `${ alc ? alc : "#944A11"}`
    // });
    $('.hud[data-type="oxygen"]').children('svg').find('path').eq(1).css({
        "stroke": `${ oc ? oc : "#c0c0c0"}`
    });

    // if (localStorage.getItem('map') == "circle") {
    //     $('#checkbox[data-input="map"]').attr('checked', true);
    // }else if (localStorage.getItem('map') == "square") {
    //     $('#checkbox[data-input="map"]').attr('checked', false);
    // }

    // if (localStorage.getItem('smap') == "true") {
    //     $('#checkbox[data-input="showmap"]').attr('checked', true);
    // }else if (localStorage.getItem('smap') == "false") {
    //     $('#checkbox[data-input="showmap"]').attr('checked', false);
    // }
}

$(document).on('click', '#res', function(){
    $('.hud').removeAttr('style');

    $('.hud[data-type="mic"]').children('svg').find('path').eq(1).css({
        "stroke": "#c0c0c0"
    });

    $('.hud[data-type="healt"]').children('svg').find('path').eq(1).css({
        "stroke": "#1CE219"
    });

    $('.hud[data-type="armour"]').children('svg').find('path').eq(1).css({
        "stroke": "#c0c0c0"
    });

    $('.hud[data-type="hunger"]').children('svg').find('path').eq(1).css({
        "stroke": "#F57600"
    });

    $('.hud[data-type="thrist"]').children('svg').find('path').eq(1).css({
        "stroke": "#00AAFF"
    });

    // $('.hud[data-type="alcool"]').children('svg').find('path').eq(1).css({
    //     "stroke": "#944A11"
    // });


    $('.hud[data-type="oxygen"]').children('svg').find('path').eq(1).css({
        "stroke": "#c0c0c0"
    });


    localStorage.setItem('mic', undefined);
    localStorage.setItem('healt', undefined);
    localStorage.setItem('armour', undefined);
    localStorage.setItem('hunger', undefined);
    localStorage.setItem('thrist', undefined);
    // localStorage.setItem('alcool', undefined);
    localStorage.setItem('oxygen', undefined);

    localStorage.setItem('miccolor', undefined);
    localStorage.setItem('healtcolor', undefined);
    localStorage.setItem('armourcolor', undefined);
    localStorage.setItem('hungercolor', undefined);
    localStorage.setItem('thristcolor', undefined);
    // localStorage.setItem('alcoolcolor', undefined);
    localStorage.setItem('oxygencolor', undefined);
});