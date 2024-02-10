var type = 'normal',
  disabled = false
const maxWeightBarValue = 28.2
let totalSlots = 30
var idcard = null,
  idcardType = null,
  idcardOpen = false
  var inputValue = 'number'
  var inputData = {}

  var inventoryOpen = false
window.addEventListener('message', function (_0x113562) {
  const _0x459a2b = $('#weightBar'),
    _0x22c748 = $('#weight'),
    _0x281997 = $('#weightCoffre'),
    _0x117df1 = $('#weightBarCoffre'),
    _0x58c568 = $('#plate'),
    _0x3f8a18 = $('#hudSetting')


  document.onkeyup = function (data) {
      if (data.which == 9) {
        if (inventoryOpen === true) {
          $.post(
            'http://ZmainInventory/closeInventory',
            JSON.stringify({})
          )
        }
      }
  };    
  if (_0x113562.data.action == 'open:Inv') {
    type = _0x113562.data.type
    disabled = false
    $('.form-inv').show()

    setTimeout(function() {
      inventoryOpen = true
    }, 500)
  } else {
    if (_0x113562.data.action == 'close:Inv') {
      $('#dialog').dialog('close')
      $('.form-inv').hide()
      $('.item').remove()
      $('.menu').hide()
      _0x117df1.css('width', 0 + 'vw')
      _0x281997.text('')
      _0x58c568.text('')

      inventoryOpen = false
    } else {
      if (_0x113562.data.action == 'Inv:WeightBarText') {
        let _0x27a5b7 =
          (maxWeightBarValue * _0x113562.data.weight) / _0x113562.data.maxWeight
        _0x459a2b.css('width', _0x27a5b7 + 'vw')
        _0x22c748.text(_0x113562.data.text)
      } else {
        if (_0x113562.data.action == 'setItems') {
          inventorySetup(
            _0x113562.data.itemList,
            _0x113562.data.fastItems,
            _0x113562.data.crMenu,
            _0x113562.data.itemTrunk
          )
          maxWeight = _0x113562.data.maxWeight
          totalWeight = _0x113562.data.weight
          let _0x358984 = (maxWeightBarValue / maxWeight) * totalWeight
          _0x459a2b.css('width', _0x358984 + 'vw')
          _0x22c748.text(_0x113562.data.text)
          $('.info_ui')
            .attr('data-html', 'true')
            .attr('title', _U('help_interfaces'))
            .tooltip({ classes: { 'ui-tooltip': 'custom-tooltip' } })
          $('.item').draggable({
            helper: 'clone',
            appendTo: 'body',
            zIndex: 99999,
            revert: 'invalid',
            start: function (_0x14bf2b, _0x348eab) {
              if (disabled) {
                return false
              }
              $(this).css('background-image', 'none')
              itemData = $(this).data('item')
              $('#drop').addClass('disabled')
              $('#give').addClass('disabled')
              $('#rename').addClass('disabled')
              $('#use').addClass('disabled')
            },
            stop: function () {
              itemData = $(this).data('item')
              if (itemData === undefined) {
                image =
                  'https://cdn.discordapp.com/attachments/979486375218937946/1133070614022852608/image_2023-07-24_181738854-removebg-preview.png'
              } else {
                itemData !== undefined && (image = itemData.image)
              }
              $(this).css('background-image', 'url(' + image + ')')
              $('#drop').removeClass('disabled')
              $('#use').removeClass('disabled')
              $('#rename').removeClass('disabled')
              $('#give').removeClass('disabled')
            },
          })
        } else {
          if (_0x113562.data.action == 'setSecondInventoryItems') {
            secondInventorySetup(_0x113562.data.itemList)
          } else {
            if (_0x113562.data.action == 'updateSlot') {
              updateSlot(_0x113562.data.fastItems, _0x113562.data.crMenu)
            } else {
              if (_0x113562.data.action == 'InvNotify') {
                msg = format(_0x113562.data.message)
                NotifyDefault(msg, _0x113562.data.timeout)
              } else {
                if (_0x113562.data.action == 'ItemNotify') {
                  NotifyItem(
                    _0x113562.data.message,
                    _0x113562.data.icon,
                    _0x113562.data.count
                  )
                } else {
                  if (_0x113562.data.action == 'InvHud') {
                    config.activeHud
                      ? (HealthIndicator.animate(_0x113562.data.hp / 100),
                        ArmorIndicator.animate(_0x113562.data.armor / 100),
                        HungerIndicator.animate(_0x113562.data.hunger / 100),
                        ThirstIndicator.animate(_0x113562.data.thirst / 100))
                      : _0x3f8a18.css('display', 'none')
                  } else {
                    if (_0x113562.data.action == 'open:Input') {
                      inputValue = _0x113562.data.value
                      inputData = _0x113562.data.data
                      $('.title').text(_0x113562.data.title)
                      $('#textArea').val('')
                      $('#keyboard-input').show()
                      setTimeout(() => {
                        $('#textArea').focus()
                      }, 10)
                    } else {
                      if (_0x113562.data.action == 'close:Input') {
                        $.post('http://ZmainInventory/cancel', JSON.stringify({}))
                        document.getElementById('textArea').value = ''
                        $('#keyboard-input').hide()
                      } else {
                        if (_0x113562.data.action == 'open:MenuIdCard') {
                          idcard = _0x113562.data.info
                          idcardType = _0x113562.data.type
                          $('.menu').show()
                        } else {
                          if (_0x113562.data.action == 'close:MenuIdCard') {
                            $('.menu').hide()
                          } else {
                            if (_0x113562.data.action == 'open:idCard') {
                              idcardOpen = true
                              var _0x411ff7 = _0x113562.data.information,
                                _0x476709 = _0x113562.data.sex,
                                _0x1528c3 = _0x113562.data.title,
                                _0x2a0c2d = _0x113562.data.image,
                                _0xac6f3c = _0x113562.data.icon,
                                _0x16b0e7 = _0x113562.data.color
                              $('#type').text(_0x1528c3)
                              $('#name').text(
                                _0x411ff7.firstname + ' ' + _0x411ff7.lastname
                              )
                              $('#dob').text(_0x411ff7.dateofbirth)
                              $('#height').text(_0x411ff7.height + ' cm')
                              $('#sex').text(_0x476709)
                              $('#icon').attr('src', _0xac6f3c)
                              $('#picture').attr(
                                'src',
                                _0x2a0c2d || 'assets/icons/picture.png'
                              )
                              $('#signature').text(_0x411ff7.lastname)
                              var _0x1cba60 = document.createElement('style')
                              _0x1cba60.innerHTML =
                                '.idcard-container:after { border-bottom: 0.154vw solid ' +
                                _0x16b0e7 +
                                '; }'
                              document.head.appendChild(_0x1cba60)
                              $('#picture-box-setting').css(
                                'border',
                                '0.104vw solid ' + _0x16b0e7
                              )
                              $('#right-inventory').html('')
                              $('#id-card').show()
                            } else {
                              if (_0x113562.data.action == 'close:idCard') {
                                $('#id-card').hide()
                                idcardOpen = false
                              } else {
                                if (
                                  _0x113562.data.action == 'trunk:WeightBarText'
                                ) {
                                  let _0x2b0e39 =
                                    (maxWeightBarValue *
                                      _0x113562.data.weightTrunk) /
                                    _0x113562.data.maxWeightTrunk
                                  _0x117df1.css('width', _0x2b0e39 + 'vw')
                                  _0x281997.text(_0x113562.data.textTrunk)
                                  _0x58c568.text(_0x113562.data.plate)
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
})
function inventorySetup(_0x5c1c59, _0x11c7a4, _0x2cf1fd, _0x13a746) {
  $('#left-inventory').html('')
  _0x13a746 == 'no' && $('#right-inventory').html('')
  if (Array.isArray(_0x5c1c59)) {
    let _0x58284e = _0x5c1c59.length
    $.each(_0x5c1c59, function (_0x594f30, _0xd0f863) {
      count = setCount(_0xd0f863)
      _0xd0f863.image == undefined &&
        (_0xd0f863.image =
          'https://cdn.discordapp.com/attachments/1008837979894198413/1129138995301994606/togo_box.png')
      $('#left-inventory').append(
        '<div class="item-info"><div id="item-' +
          _0x594f30 +
          '" class="item" style="background-image: url(' +
          _0xd0f863.image +
          ')"><div class="item-count">' +
          count +
          '</div><div class="item-name">' +
          _0xd0f863.label +
          '</div></div><div class="item-name-bg"></div></div>'
      )
      $('#item-' + _0x594f30).data('item', _0xd0f863)
      $('#item-' + _0x594f30).data('inventory', 'main')
    })
    for (let _0x625afd = 0; _0x625afd < totalSlots - _0x58284e; _0x625afd++) {
      let _0x1e2b85 = _0x58284e + _0x625afd
      $('#left-inventory').append(
        '<div class="item-info"><div id="item-' +
          _0x1e2b85 +
          '" class="item"></div><div class="item-name-bg"></div></div>'
      )
    }
    if (idcardOpen == false) {
      if (_0x13a746 == 'no') {
        for (let _0x7d7e1f = 0; _0x7d7e1f < totalSlots; _0x7d7e1f++) {
          $('#right-inventory').append(
            '<div class="item-info"><div id="item-' +
              _0x7d7e1f +
              '" class="item"></div><div class="item-name-bg"></div></div>'
          )
        }
      }
    }
  } else {
    console.error("items n'est pas un tableau")
  }
  $('.middle-bottom-slots').html('')
  if (_0x2cf1fd == 'item') {
    $('#drop')
    var _0x488bda
    image =
      'https://cdn.discordapp.com/attachments/979486375218937946/1133070614022852608/image_2023-07-24_181738854-removebg-preview.png'
    for (_0x488bda = 1; _0x488bda < 6; _0x488bda++) {
      $('.middle-bottom-slots').append(
        '<div class="middle-slot-box" id"itemDescr-' +
          _0x488bda +
          '">' +
          '<img class="slot-count" src="assets/icons/' +
          _0x488bda +
          '_key.png" alt="">' +
          '<div id="itemFast-' +
          _0x488bda +
          '" class="item" style = "background-image: url(' +
          image +
          ')">' +
          '</div >' +
          '</div>'
      )
    }
    $.each(_0x11c7a4, function (_0x218215, _0x4b72c5) {
      count = setCount(_0x4b72c5)
      _0x4b72c5.image == undefined &&
        (_0x4b72c5.image =
          'https://cdn.discordapp.com/attachments/1008837979894198413/1129138995301994606/togo_box.png')
      $('#itemFast-' + _0x4b72c5.slot).html(
        '<div class="slot-name">' + _0x4b72c5.label + '</div>'
      )
      $('#itemFast-' + _0x4b72c5.slot).css(
        'background-image',
        'url(' + _0x4b72c5.image + ')'
      )
      $('#itemFast-' + _0x4b72c5.slot).data('item', _0x4b72c5)
      $('#itemFast-' + _0x4b72c5.slot).data('inventory', 'fast')
    })
  }
  _0x2cf1fd == 'clothe' && $('#drop')
  makeDraggables()
  _0x2cf1fd == 'item' && $('#drop')
}
function secondInventorySetup(_0x32bfe6) {
  $('#right-inventory').html('')
  if (Array.isArray(_0x32bfe6)) {
    let _0x557ca3 = _0x32bfe6.length
    $.each(_0x32bfe6, function (_0x51c226, _0x1c51dc) {
      count = setCount(_0x1c51dc)
      _0x1c51dc.image == undefined &&
        (_0x1c51dc.image =
          'https://cdn.discordapp.com/attachments/1008837979894198413/1129138995301994606/togo_box.png')
      $('#right-inventory').append(
        '<div class="item-info"><div id="itemOther-' +
          _0x51c226 +
          '" class="item" style = "background-image: url(' +
          _0x1c51dc.image +
          ')"><div class="item-count">' +
          count +
          '</div><div class="item-name">' +
          _0x1c51dc.label +
          '</div></div><div class="item-name-bg"></div></div>'
      )
      $('#itemOther-' + _0x51c226).data('item', _0x1c51dc)
      $('#itemOther-' + _0x51c226).data('inventory', 'second')
    })
    for (let _0x50d3df = 0; _0x50d3df < totalSlots - _0x557ca3; _0x50d3df++) {
      let _0x4f3535 = _0x557ca3 + _0x50d3df
      $('#right-inventory').append(
        '<div class="item-info"><div id="itemOther-' +
          _0x4f3535 +
          '" class="item"></div><div class="item-name-bg"></div></div>'
      )
    }
  } else {
    console.error("items n'est pas un tableau")
  }
}
function updateSlot(_0x2ca711, _0x435c29) {
  $('.middle-bottom-slots').html('')
  if (_0x435c29 == 'item') {
    $('#drop')
    var _0x5a000c
    image =
      'https://cdn.discordapp.com/attachments/979486375218937946/1133070614022852608/image_2023-07-24_181738854-removebg-preview.png'
    for (_0x5a000c = 1; _0x5a000c < 6; _0x5a000c++) {
      $('.middle-bottom-slots').append(
        '<div class="middle-slot-box" id"itemDescr-' +
          _0x5a000c +
          '">' +
          '<img class="slot-count" src="assets/icons/' +
          _0x5a000c +
          '_key.png" alt="">' +
          '<div id="itemFast-' +
          _0x5a000c +
          '" class="item" style = "background-image: url(' +
          image +
          ')">' +
          '</div >' +
          '</div>'
      )
    }
    $.each(_0x2ca711, function (_0x1f5abe, _0x3159f7) {
      count = setCount(_0x3159f7)
      _0x3159f7.image == undefined &&
        (_0x3159f7.image =
          'https://cdn.discordapp.com/attachments/1008837979894198413/1129138995301994606/togo_box.png')
      $('#itemFast-' + _0x3159f7.slot).html(
        '<div class="slot-name">' + _0x3159f7.label + '</div>'
      )
      $('#itemFast-' + _0x3159f7.slot).css(
        'background-image',
        'url(' + _0x3159f7.image + ')'
      )
      $('#itemFast-' + _0x3159f7.slot).data('item', _0x3159f7)
      $('#itemFast-' + _0x3159f7.slot).data('inventory', 'fast')
    })
  }
  _0x435c29 == 'clothe' && $('#drop')
  makeDraggables()
  _0x435c29 == 'item' && $('#drop')
}
function makeDraggables() {
  $('#itemFast-1').droppable({
    drop: function (_0x58835f, _0x3b30dc) {
      itemData = _0x3b30dc.draggable.data('item')
      itemInventory = _0x3b30dc.draggable.data('inventory')
      type === 'normal' &&
        (itemInventory === 'main' || itemInventory === 'fast') &&
        (disableInventory(500),
        $.post(
          'http://ZmainInventory/PutIntoFast',
          JSON.stringify({
            item: itemData,
            slot: 1,
          })
        ))
    },
  })
  $('#itemFast-2').droppable({
    drop: function (_0x2d08a7, _0x2e1ef7) {
      itemData = _0x2e1ef7.draggable.data('item')
      itemInventory = _0x2e1ef7.draggable.data('inventory')
      type === 'normal' &&
        (itemInventory === 'main' || itemInventory === 'fast') &&
        (disableInventory(500),
        $.post(
          'http://ZmainInventory/PutIntoFast',
          JSON.stringify({
            item: itemData,
            slot: 2,
          })
        ))
    },
  })
  $('#itemFast-3').droppable({
    drop: function (_0x36c0fe, _0x3c9081) {
      itemData = _0x3c9081.draggable.data('item')
      itemInventory = _0x3c9081.draggable.data('inventory')
      type === 'normal' &&
        (itemInventory === 'main' || itemInventory === 'fast') &&
        (disableInventory(500),
        $.post(
          'http://ZmainInventory/PutIntoFast',
          JSON.stringify({
            item: itemData,
            slot: 3,
          })
        ))
    },
  })
  $('#itemFast-4').droppable({
    drop: function (_0x246381, _0x52538e) {
      itemData = _0x52538e.draggable.data('item')
      itemInventory = _0x52538e.draggable.data('inventory')
      type === 'normal' &&
        (itemInventory === 'main' || itemInventory === 'fast') &&
        (disableInventory(500),
        $.post(
          'http://ZmainInventory/PutIntoFast',
          JSON.stringify({
            item: itemData,
            slot: 4,
          })
        ))
    },
  })
  $('#itemFast-5').droppable({
    drop: function (_0x343b62, _0x52064b) {
      itemData = _0x52064b.draggable.data('item')
      itemInventory = _0x52064b.draggable.data('inventory')
      type === 'normal' &&
        (itemInventory === 'main' || itemInventory === 'fast') &&
        (disableInventory(500),
        $.post(
          'http://ZmainInventory/PutIntoFast',
          JSON.stringify({
            item: itemData,
            slot: 5,
          })
        ))
    },
  })
}
$(function () {
  $('#button\\.raccourci-1').click(function () {
    $.post('http://ZmainInventory/category', JSON.stringify({ type: 'all' }))
  })
  $('#button\\.raccourci-2').click(function () {
    $.post('http://ZmainInventory/category', JSON.stringify({ type: 'item' }))
  })
  $('#button\\.raccourci-3').click(function () {
    $.post('http://ZmainInventory/category', JSON.stringify({ type: 'weapon' }))
  })
  $('#button\\.raccourci-4').click(function () {
    $.post('http://ZmainInventory/category', JSON.stringify({ type: 'clothes' }))
  })
})
function disableInventory(_0x3ff84a) {
  disabled = true
  setInterval(function () {
    disabled = false
  }, _0x3ff84a)
}
$(document).ready(function () {
  $('.middle-clothes-part-left .item-box')
    .off()
    .click(function () {
      $.post(
        'http://ZmainInventory/removeClothes',
        JSON.stringify({ component: $(this).attr('id') })
      )
    })
  $('.middle-clothes-part-right .item-box2')
    .off()
    .click(function () {
      $.post(
        'http://ZmainInventory/removeClothes',
        JSON.stringify({ component: $(this).attr('id') })
      )
    })
  $('#useItem').droppable({
    hoverClass: 'hoverControl',
    drop: function (_0x176e61, _0x147a8e) {
      idcardOpen && $('#id-card').hide()
      itemData = _0x147a8e.draggable.data('item')
      itemData.usable &&
        $.post(
          'http://ZmainInventory/itemUsable',
          JSON.stringify({ item: itemData })
        )
    },
  })
  $('#giveItem').droppable({
    hoverClass: 'hoverControl',
    drop: function (_0xf92a3e, _0x500eb0) {
      itemData = _0x500eb0.draggable.data('item')
      $.post('http://ZmainInventory/giveItem', JSON.stringify({ item: itemData }))
    },
  })
  $('#renameItem').droppable({
    hoverClass: 'hoverControl',
    drop: function (_0x4de8e2, _0x286466) {
      itemData = _0x286466.draggable.data('item')
      $.post(
        'http://ZmainInventory/renameItem',
        JSON.stringify({ item: itemData })
      )
    },
  })
  $('#deleteItem').droppable({
    hoverClass: 'hoverControl',
    drop: function (_0x570a69, _0x341546) {
      itemData = _0x341546.draggable.data('item')
      $.post(
        'http://ZmainInventory/deleteItem',
        JSON.stringify({ item: itemData })
      )
    },
  })
  $('#left-inventory').droppable({
    drop: function (_0x24eb4d, _0x3c3596) {
      itemData = _0x3c3596.draggable.data('item')
      itemInventory = _0x3c3596.draggable.data('inventory')
      if (type === 'trunk' && itemInventory === 'second') {
        disableInventory(500)
        $.post(
          'http://ZmainInventory/TakeFromTrunk',
          JSON.stringify({ item: itemData })
        )
      } else {
        if (type === 'property' && itemInventory === 'second') {
          disableInventory(500)
          $.post(
            'http://ZmainInventory/TakeFromProperty',
            JSON.stringify({ item: itemData })
          )
        } else {
          if (type === 'normal' && itemInventory === 'fast') {
            disableInventory(500)
            $.post(
              'http://ZmainInventory/TakeFromFast',
              JSON.stringify({ item: itemData })
            )
          } else {
            if (type === 'vault' && itemInventory === 'second') {
              disableInventory(500)
              $.post(
                'http://ZmainInventory/TakeFromVault',
                JSON.stringify({ item: itemData })
              )
            } else {
              type === 'player' &&
                itemInventory === 'second' &&
                (disableInventory(500),
                $.post(
                  'http://ZmainInventory/TakeFromPlayer',
                  JSON.stringify({ item: itemData })
                ))
            }
          }
        }
      }
    },
  })
  $('#right-inventory').droppable({
    drop: function (_0x5c387e, _0x2fd3b9) {
      itemData = _0x2fd3b9.draggable.data('item')
      itemInventory = _0x2fd3b9.draggable.data('inventory')
      if (type === 'trunk' && itemInventory === 'main') {
        disableInventory(500)
        $.post(
          'http://ZmainInventory/PutIntoTrunk',
          JSON.stringify({ item: itemData })
        )
      } else {
        if (type === 'property' && itemInventory === 'main') {
          disableInventory(500)
          $.post(
            'http://ZmainInventory/PutIntoProperty',
            JSON.stringify({ item: itemData })
          )
        } else {
          if (type === 'vault' && itemInventory === 'main') {
            disableInventory(500)
            $.post(
              'http://ZmainInventory/PutIntoVault',
              JSON.stringify({ item: itemData })
            )
          } else {
            type === 'player' &&
              itemInventory === 'main' &&
              (disableInventory(500),
              $.post(
                'http://ZmainInventory/PutIntoPlayer',
                JSON.stringify({ item: itemData })
              ))
          }
        }
      }
    },
  })
  document
    .getElementById('textArea')
    .addEventListener('keyup', function (_0x218765) {
      _0x218765.preventDefault()
      _0x218765.keyCode === 13 &&
        $('#keyboard-input').is(':visible') &&
        $('#textArea').is(':focus') &&
        ($.post(
          'http://ZmainInventory/send',
          JSON.stringify({
            text: document.getElementById('textArea').value.trim(),
            value: inputValue,
            data: inputData
          })
        ),
        (document.getElementById('textArea').value = ''),
        $('#keyboard-input').hide())
      _0x218765.keyCode === 27 &&
        $('#keyboard-input').is(':visible') &&
        $('#textArea').is(':focus') &&
        ($.post('http://ZmainInventory/cancel', JSON.stringify({})),
        (document.getElementById('textArea').value = ''),
        $('#keyboard-input').hide())
    })
  $('#button\\.valider').click(function () {
    $.post(
      'http://ZmainInventory/send',
      JSON.stringify({
        text: document.getElementById('textArea').value.trim(),
        value: inputValue,
        data: inputData
      })
    ),
    (document.getElementById('textArea').value = ''),
    $('#keyboard-input').hide()
  })
  $('#button\\.showButton').click(function () {
    $.post(
      'http://ZmainInventory/giveCard',
      JSON.stringify({
        info: idcard,
        type: idcardType,
      })
    )
    $('.menu').hide()
  })
  $('#button\\.chooseButton').click(function () {
    $.post(
      'http://ZmainInventory/lookCard',
      JSON.stringify({
        info: idcard,
        type: idcardType,
      })
    )
    $('.menu').hide()
  })
  $('#button\\.closeIdCard').click(function () {
    $('#id-card').hide()
    idcardOpen = false
    for (let _0x582162 = 0; _0x582162 < totalSlots; _0x582162++) {
      $('#right-inventory').append(
        '<div class="item-info"><div id="item-' +
          _0x582162 +
          '" class="item"></div><div class="item-name-bg"></div></div>'
      )
    }
  })
})
$.widget('ui.dialog', $.ui.dialog, {
  options: {
    clickOutside: false,
    clickOutsideTrigger: '',
  },
  open: function () {
    var _0x82391f = $(this.options.clickOutsideTrigger),
      _0x483347 = this
    this.options.clickOutside &&
      $(document).on(
        'click.ui.dialogClickOutside' + _0x483347.eventNamespace,
        function (_0x5a5834) {
          var _0x635a29 = $(_0x5a5834.target)
          _0x635a29.closest($(_0x82391f)).length === 0 &&
            _0x635a29.closest($(_0x483347.uiDialog)).length === 0 &&
            _0x483347.close()
        }
      )
    this['_super']()
  },
  close: function () {
    $(document).off('click.ui.dialogClickOutside' + this.eventNamespace)
    this['_super']()
  },
})
var currentNotification = null
function NotifyDefault(_0x5129fd, _0x315ded) {
  var _0x3b089f = 1
  if (currentNotification == 1) {
    return
  }
  currentNotification == undefined && (currentNotification = 1)
  $('.notification').prepend(
    '        \n        <div class="notify-without-icon" id="notifydef-' +
      _0x3b089f +
      '">\n            <div class="content-notify-without-icon">\n                <div class="notify-without-icon-text">\n                    <span>' +
      _0x5129fd +
      '</span>\n                </div>\n            </div>\n            <div class="progress-bar-notifi-without-icon"></div>\n        </div>\n    '
  )
  var _0x4870f3 = $('#notifydef-' + _0x3b089f),
    _0x273a72 = _0x4870f3.find('.progress-bar-notifi-without-icon'),
    _0x3d260a = Date.now(),
    _0x1c7e96 = setInterval(function () {
      var _0x187bf8 = Date.now() - _0x3d260a,
        _0x2fe33f = (_0x187bf8 / _0x315ded) * 100
      _0x2fe33f >= 100
        ? (clearInterval(_0x1c7e96),
          setTimeout(() => {
            _0x4870f3.addClass('hidden')
          }, 150),
          setTimeout(() => {
            _0x4870f3.remove()
            currentNotification = null
          }, 600))
        : _0x273a72.css('width', _0x2fe33f + '%')
    }, 10)
  _0x3b089f++
}
function NotifyItem(_0x468ec2, _0x1a114b, _0x4a4b6e) {
  var _0x48ad0f = 1
  _0x1a114b == undefined &&
    (_0x1a114b =
      'https://cdn.discordapp.com/attachments/1008837979894198413/1129138995301994606/togo_box.png')
  $('.iconNotif').prepend(
    '\n        <div class="notify-with-icon" id="notify-' +
      _0x48ad0f +
      '"">\n            <div class="content-notify-with-icon">\n            <img src="' +
      _0x1a114b +
      '" alt="">\n\n            </div>\n            <div class="notify-with-icon-text">\n                <span>' +
      _0x468ec2 +
      '</span>\n            </div>\n            <div class="notify-with-icon-count">\n                <span>' +
      _0x4a4b6e +
      '</span>\n            </div>\n        </div>\n    '
  )
  var _0x5caa00 = $('#notify-' + _0x48ad0f),
    _0x333801 = Date.now(),
    _0x39ecff = setInterval(function () {
      var _0x320387 = Date.now() - _0x333801,
        _0x59a192 = (_0x320387 / 3000) * 100
      if (_0x59a192 >= 100) {
        clearInterval(_0x39ecff)
        setTimeout(() => {
          _0x5caa00.addClass('hidden')
        }, 150)
        setTimeout(() => {
          _0x5caa00.remove()
        }, 600)
      } else {
      }
    }, 10)
  _0x48ad0f++
}
function isDefined(_0x4bcb0a) {
  return typeof _0x4bcb0a !== 'undefined' && _0x4bcb0a !== null
}
function format(_0x1fc697) {
  var _0x166ff1 = false,
    _0x46fc78 = '',
    _0x2cfe5d = ''
  for (var _0x354472 = 0; _0x354472 < _0x1fc697.length; _0x354472++) {
    if (_0x1fc697[_0x354472] === '~') {
      var _0x19cf78 = ''
      _0x354472++
      while (_0x1fc697[_0x354472] != '~') {
        _0x19cf78 += _0x1fc697[_0x354472]
        _0x354472++
      }
      if (isDefined(config_text_color[_0x19cf78])) {
        _0x46fc78 = config_text_color[_0x19cf78]
        !_0x166ff1
          ? ((_0x2cfe5d += '<span style="color: ' + _0x46fc78 + '">'),
            (_0x166ff1 = true))
          : (_0x2cfe5d += '</span><span style="color: ' + _0x46fc78 + '">')
      } else {
        if (isDefined(config_text_fonts[_0x19cf78])) {
          _0x46fc78 = config_text_fonts[_0x19cf78]
          !_0x166ff1
            ? ((_0x2cfe5d += '<span style="' + _0x46fc78 + '">'),
              (_0x166ff1 = true))
            : (_0x2cfe5d += '</span><span style="' + _0x46fc78 + '">')
        } else {
          isDefined(Keys[_0x19cf78]) &&
            (_0x2cfe5d += '<span class="key">' + Keys[_0x19cf78] + '</span>')
        }
      }
    } else {
      _0x2cfe5d += _0x1fc697[_0x354472]
    }
  }
  return _0x166ff1 && (_0x2cfe5d += '</span>'), _0x2cfe5d
}
function GTA_PICTURE(_0x1cd534) {
  return isDefined(Picture[_0x1cd534])
    ? 'assets/images/' + Picture[_0x1cd534]
    : false
}
function setCount(_0x121b30) {
  return (
    (count = _0x121b30.count),
    _0x121b30.limit > 0 && (count = _0x121b30.count),
    _0x121b30.type === 'item_weapon' && (count = ''),
    _0x121b30.type === 'item_idcard' && (count = ''),
    (_0x121b30.type === 'item_account' || _0x121b30.type === 'item_money') &&
      (count = formatMoney(_0x121b30.count)),
    count
  )
}
function formatMoney(_0x127c00, _0x4dff0c, _0x186d3d, _0x58a121) {
  var _0x4dff0c = isNaN((_0x4dff0c = Math.abs(_0x4dff0c))) ? 2 : _0x4dff0c,
    _0x186d3d = _0x186d3d == undefined ? '.' : _0x186d3d,
    _0x58a121 = _0x58a121 == undefined ? ',' : _0x58a121,
    _0xfab64a = _0x127c00 < 0 ? '-' : '',
    _0x135801 = String(
      parseInt(
        (_0x127c00 = Math.abs(Number(_0x127c00) || 0).toFixed(_0x4dff0c))
      )
    ),
    _0x4e71fe = (_0x4e71fe = _0x135801.length) > 3 ? _0x4e71fe % 3 : 0
  return (
    _0xfab64a +
    (_0x4e71fe ? _0x135801.substr(0, _0x4e71fe) + _0x58a121 : '') +
    _0x135801.substr(_0x4e71fe).replace(/(\d{3})(?=\d)/g, '$1' + _0x58a121)
  )
}
$(document).mousedown(function (_0x499015) {
  if (_0x499015.which != 3) {
    return
  }
  itemData = $(_0x499015.target).data('item')
  if (itemData == undefined || itemData.usable == undefined) {
    return
  }
  itemInventory = $(_0x499015.target).data('ZmainInventory')
  itemData.usable &&
    $.post('http://ZmainInventory/itemUsable', JSON.stringify({ item: itemData }))
})
config.activeHud &&
  $(document).ready(function () {
    HealthIndicator = new ProgressBar.Circle('#HealthIndicator', {
      color: config.colorHud,
      trailColor: 'rgb(80, 80, 80)',
      strokeWidth: 10,
      trailWidth: 10,
      duration: 2000,
      easing: 'easeInOut',
    })
    ArmorIndicator = new ProgressBar.Circle('#ArmorIndicator', {
      color: config.colorHud,
      trailColor: 'rgb(80, 80, 80)',
      strokeWidth: 10,
      trailWidth: 10,
      duration: 2000,
      easing: 'easeInOut',
    })
    HungerIndicator = new ProgressBar.Circle('#HungerIndicator', {
      color: config.colorHud,
      trailColor: 'rgb(80, 80, 80)',
      strokeWidth: 10,
      trailWidth: 10,
      duration: 2000,
      easing: 'easeInOut',
    })
    ThirstIndicator = new ProgressBar.Circle('#ThirstIndicator', {
      color: config.colorHud,
      trailColor: 'rgb(80, 80, 80)',
      strokeWidth: 10,
      trailWidth: 10,
      duration: 2000,
      easing: 'easeInOut',
    })
  })

var ZConfig = new Object();

ZConfig.CloseKey = [27]

$(document).ready(function () {
  $("body").on("keyup", function (key) {
    if (ZConfig.CloseKey.includes(key.which)) {
      $.post(
        'http://ZmainInventory/closeInventory',
        JSON.stringify({})
    )}
});
})