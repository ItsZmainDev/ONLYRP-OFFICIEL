---ESX.Groups
---@param ESX.Groups table
ESX.Groups = {
    ['_dev'] = true,
    ['fondateur'] = true,
    ['developper'] = true,
    ['gerant'] = true,
    ['responsable'] = true,
    ['superadmin'] = true,
    ['administrateur'] = true,
    ['moderateur'] = true,
    ['helpeur'] = true,
    [Config.DefaultGroup] = true
}

---ESX.GroupsRankRelative
---@param ESX.GroupsRankRelative table
ESX.GroupsRankRelative = {
    ['fondateur'] = 9,
    ['developper'] = 8,
    ['_dev'] = 7,
    ['gerant'] = 6,
    ['responsable'] = 5,
    ['superadmin'] = 4,
    ['administrateur'] = 3,
    ['moderateur'] = 2,
    ['helpeur'] = 1,
    [Config.DefaultGroup] = 0
}

---ESX.ByPASS_GROUP
---@param ESX.ByPASS_GROUP table
ESX.ByPASS_GROUP = {
    ['_dev'] = true,
    ['fondateur'] = true,
    ['developper'] = true,
}