local v0 = tonumber
local v1 = string.byte
local v2 = string.char
local v3 = string.sub
local v4 = string.gsub
local v5 = string.rep
local v6 = table.concat
local v7 = table.insert
local v8 = math.ldexp
local v9 = getfenv or function()
        return _ENV
    end
local v10 = setmetatable
local v11 = pcall
local v12 = select
local v13 = unpack or table.unpack
local v14 = tonumber
local function v15(v16, v17, ...)
    local v18 = 1
    local v19
    v16 =
        v4(
        v3(v16, 5),
        "..",
        function(v30)
            if (v1(v30, 2) == 79) then
                local v68 = 0
                while true do
                    if (v68 == 0) then
                        v19 = v0(v3(v30, 1, 1))
                        return ""
                    end
                end
            else
                local v69 = v2(v0(v30, 16))
                if v19 then
                    local v77 = 0
                    local v78
                    while true do
                        if (v77 == 1) then
                            return v78
                        end
                        if (v77 == 0) then
                            v78 = v5(v69, v19)
                            v19 = nil
                            v77 = 1
                        end
                    end
                else
                    return v69
                end
            end
        end
    )
    local function v20(v31, v32, v33)
        if v33 then
            local v70 =
                (v31 / ((5 - 3) ^ (v32 - (2 - 1)))) %
                ((3 - 1) ^ (((v33 - (1 + 0)) - (v32 - (2 - 1))) + (620 - (555 + 64))))
            return v70 - (v70 % 1)
        else
            local v71 = 931 - (857 + 74)
            local v72
            while true do
                if (v71 == 0) then
                    v72 = (570 - (367 + (1078 - (282 + 595)))) ^ (v32 - (928 - (214 + 713)))
                    return (((v31 % (v72 + v72)) >= v72) and (1 + 0)) or (1637 - (1523 + 114))
                end
            end
        end
    end
    local function v21()
        local v34 = v1(v16, v18, v18)
        v18 = v18 + 1
        return v34
    end
    local function v22()
        local v35 = 0 + 0
        local v36
        local v37
        while true do
            if (v35 == (1 - 0)) then
                return (v37 * 256) + v36
            end
            if (v35 == (1065 - (68 + 997))) then
                v36, v37 = v1(v16, v18, v18 + (1272 - (226 + 1044)))
                v18 = v18 + (8 - 6)
                v35 = 118 - (32 + 85)
            end
        end
    end
    local function v23()
        local v38 = 0 + 0
        local v39
        local v40
        local v41
        local v42
        while true do
            if (v38 == ((181 - (67 + 113)) + 0 + 0)) then
                return (v42 * (16778173 - (892 + 65))) + (v41 * (156337 - 90801)) + (v40 * (472 - 216)) + v39
            end
            if (v38 == 0) then
                v39, v40, v41, v42 = v1(v16, v18, v18 + (4 - 1))
                v18 = v18 + 4
                v38 = 351 - ((213 - 126) + 263)
            end
        end
    end
    local function v24()
        local v43 = v23()
        local v44 = v23()
        local v45 = (3 - 2) + 0
        local v46 = (v20(v44, 1, (34 + 45) - 59) * ((954 - (802 + 150)) ^ 32)) + v43
        local v47 = v20(v44, 56 - 35, 55 - (42 - 18))
        local v48 = ((v20(v44, 24 + 8) == 1) and -(998 - (915 + (315 - 233)))) or ((444 - (416 + 26)) - 1)
        if (v47 == (0 + 0)) then
            if (v46 == ((438 - (145 + 293)) - 0)) then
                return v48 * (1187 - (1069 + 118))
            else
                v47 = 2 - 1
                v45 = 0 - 0
            end
        elseif (v47 == (356 + 1691)) then
            return ((v46 == (0 - 0)) and (v48 * (((431 - (44 + 386)) + 0) / (791 - (368 + 423))))) or (v48 * NaN)
        end
        return v8(v48, v47 - 1023) * (v45 + (v46 / ((6 - 4) ^ ((1556 - (998 + 488)) - (10 + 8)))))
    end
    local function v25(v49)
        local v50 = 0 + 0
        local v51
        local v52
        while true do
            if (v50 == 3) then
                return v6(v52)
            end
            if (v50 == (1 + (859 - (814 + 45)))) then
                v51 = v3(v16, v18, (v18 + v49) - (773 - (201 + 571)))
                v18 = v18 + v49
                v50 = 1140 - (116 + 1022)
            end
            if ((0 - 0) == v50) then
                v51 = nil
                if not v49 then
                    v49 = v23()
                    if (v49 == (0 + 0)) then
                        return ""
                    end
                end
                v50 = 2 - 1
            end
            if (((1 + 6) - 5) == v50) then
                v52 = {}
                for v79 = 1, #v51 do
                    v52[v79] = v2(v1(v3(v51, v79, v79)))
                end
                v50 = 10 - (3 + 4)
            end
        end
    end
    local v26 = v23
    local function v27(...)
        return {...}, v12("#", ...)
    end
    local function v28()
        local v53 = 0
        local v54
        local v55
        local v56
        local v57
        local v58
        local v59
        local v60
        while true do
            if (v53 ~= (1 - 0)) then
            else
                local v73 = 0
                while true do
                    if (v73 == 0) then
                        v56 = nil
                        v57 = nil
                        v73 = 1263 - (1091 + 171)
                    end
                    if (v73 == 1) then
                        v53 = 1 + 1
                        break
                    end
                end
            end
            if (v53 == 0) then
                v54 = 0 - 0
                v55 = nil
                v53 = 3 - 2
            end
            if (2 == v53) then
                v58 = nil
                v59 = nil
                v53 = 377 - (123 + 251)
            end
            if (v53 == 3) then
                v60 = nil
                while true do
                    if (v54 == (14 - 11)) then
                        local v98 = 698 - (208 + 490)
                        local v99
                        while true do
                            if (v98 ~= 0) then
                            else
                                v99 = 0
                                while true do
                                    if (v99 == (0 + 0)) then
                                        for v111 = 1 + 0, v23() do
                                            v56[v111 - (837 - (660 + 176))] = v28()
                                        end
                                        return v58
                                    end
                                end
                                break
                            end
                        end
                    end
                    if ((0 + 0) == v54) then
                        local v100 = 202 - (14 + 188)
                        local v101
                        while true do
                            if (v100 == 0) then
                                v101 = 675 - (534 + 141)
                                while true do
                                    if (v101 ~= (1 + 0)) then
                                    else
                                        v57 = {}
                                        v54 = 1 + 0
                                        break
                                    end
                                    if (v101 == (0 + 0)) then
                                        v55 = {}
                                        v56 = {}
                                        v101 = 1
                                    end
                                end
                                break
                            end
                        end
                    end
                    if (v54 ~= (3 - 1)) then
                    else
                        local v102 = 0
                        local v103
                        while true do
                            if (v102 ~= (0 - 0)) then
                            else
                                v103 = 0
                                while true do
                                    if (v103 == (0 - 0)) then
                                        for v113 = 1 + 0, v59 do
                                            local v114 = 0
                                            local v115
                                            local v116
                                            while true do
                                                if (v114 == 0) then
                                                    local v150 = 0 + 0
                                                    while true do
                                                        if (v150 == 0) then
                                                            v115 = v21()
                                                            v116 = nil
                                                            v150 = 397 - (115 + 281)
                                                        end
                                                        if (v150 == (2 - 1)) then
                                                            v114 = 1 + 0
                                                            break
                                                        end
                                                    end
                                                end
                                                if (1 ~= v114) then
                                                else
                                                    if (v115 == 1) then
                                                        v116 = v21() ~= (0 - 0)
                                                    elseif (v115 == 2) then
                                                        v116 = v24()
                                                    elseif (v115 ~= (10 - 7)) then
                                                    else
                                                        v116 = v25()
                                                    end
                                                    v60[v113] = v116
                                                    break
                                                end
                                            end
                                        end
                                        v58[870 - (550 + 317)] = v21()
                                        v103 = 1
                                    end
                                    if (v103 ~= 1) then
                                    else
                                        for v117 = 1, v23() do
                                            local v118 = 0
                                            local v119
                                            while true do
                                                if ((0 - 0) == v118) then
                                                    v119 = v21()
                                                    if (v20(v119, 1 - 0, 1) ~= (0 - 0)) then
                                                    else
                                                        local v153 = 0
                                                        local v154
                                                        local v155
                                                        local v156
                                                        local v157
                                                        while true do
                                                            if (v153 ~= (286 - (134 + 151))) then
                                                            else
                                                                v156 = nil
                                                                v157 = nil
                                                                v153 = 1667 - (970 + 695)
                                                            end
                                                            if (v153 == (3 - 1)) then
                                                                while true do
                                                                    if (v154 == (1993 - (582 + 1408))) then
                                                                        if (v20(v156, 3, 3) ~= 1) then
                                                                        else
                                                                            v157[4] = v60[v157[4]]
                                                                        end
                                                                        v55[v117] = v157
                                                                        break
                                                                    end
                                                                    if ((0 - 0) == v154) then
                                                                        local v160 = 0
                                                                        local v161
                                                                        while true do
                                                                            if (v160 == (0 - 0)) then
                                                                                v161 = 0 - 0
                                                                                while true do
                                                                                    if (v161 ~= (1824 - (1195 + 629))) then
                                                                                    else
                                                                                        v155 = v20(v119, 2 - 0, 3)
                                                                                        v156 =
                                                                                            v20(
                                                                                            v119,
                                                                                            245 - (187 + 54),
                                                                                            6
                                                                                        )
                                                                                        v161 = 1
                                                                                    end
                                                                                    if ((781 - (162 + 618)) ~= v161) then
                                                                                    else
                                                                                        v154 = 1 + 0
                                                                                        break
                                                                                    end
                                                                                end
                                                                                break
                                                                            end
                                                                        end
                                                                    end
                                                                    if (v154 == 2) then
                                                                        local v162 = 0 + 0
                                                                        while true do
                                                                            if ((1 - 0) ~= v162) then
                                                                            else
                                                                                v154 = 4 - 1
                                                                                break
                                                                            end
                                                                            if (v162 == (0 + 0)) then
                                                                                if
                                                                                    (v20(v156, 1637 - (1373 + 263), 1) ==
                                                                                        (1001 - (451 + 549)))
                                                                                 then
                                                                                    v157[1 + 1] = v60[v157[2]]
                                                                                end
                                                                                if (v20(v156, 2, 2) == 1) then
                                                                                    v157[4 - 1] = v60[v157[3]]
                                                                                end
                                                                                v162 = 1 - 0
                                                                            end
                                                                        end
                                                                    end
                                                                    if (v154 ~= (1385 - (746 + 638))) then
                                                                    else
                                                                        local v163 = 0
                                                                        while true do
                                                                            if (1 ~= v163) then
                                                                            else
                                                                                v154 = 1 + 1
                                                                                break
                                                                            end
                                                                            if (v163 ~= 0) then
                                                                            else
                                                                                v157 = {v22(), v22(), nil, nil}
                                                                                if (v155 == (1581 - (1535 + 46))) then
                                                                                    local v170 = 0 + 0
                                                                                    local v171
                                                                                    while true do
                                                                                        if (0 == v170) then
                                                                                            v171 = 0
                                                                                            while true do
                                                                                                if (v171 ~= (0 + 0)) then
                                                                                                else
                                                                                                    v157[3] = v22()
                                                                                                    v157[
                                                                                                            564 -
                                                                                                                (306 +
                                                                                                                    254)
                                                                                                        ] = v22()
                                                                                                    break
                                                                                                end
                                                                                            end
                                                                                            break
                                                                                        end
                                                                                    end
                                                                                elseif (v155 == (1 + 0)) then
                                                                                    v157[3] = v23()
                                                                                elseif (v155 == (3 - 1)) then
                                                                                    v157[1470 - (899 + 568)] =
                                                                                        v23() - ((2 + 0) ^ 16)
                                                                                elseif (v155 == 3) then
                                                                                    local v176 = 0
                                                                                    while true do
                                                                                        if (0 == v176) then
                                                                                            v157[7 - 4] =
                                                                                                v23() -
                                                                                                ((605 - (268 + 335)) ^
                                                                                                    (306 - (60 + 230)))
                                                                                            v157[576 - (426 + 146)] =
                                                                                                v22()
                                                                                            break
                                                                                        end
                                                                                    end
                                                                                end
                                                                                v163 = 1
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                                break
                                                            end
                                                            if (v153 == 0) then
                                                                v154 = 0
                                                                v155 = nil
                                                                v153 = 1
                                                            end
                                                        end
                                                    end
                                                    break
                                                end
                                            end
                                        end
                                        v54 = 3
                                        break
                                    end
                                end
                                break
                            end
                        end
                    end
                    if (v54 == 1) then
                        local v104 = 0
                        while true do
                            if ((0 + 0) == v104) then
                                local v109 = 0
                                while true do
                                    if (v109 ~= (1457 - (282 + 1174))) then
                                    else
                                        v104 = 812 - (569 + 242)
                                        break
                                    end
                                    if (0 == v109) then
                                        v58 = {v55, v56, nil, v57}
                                        v59 = v23()
                                        v109 = 1
                                    end
                                end
                            end
                            if (v104 == (1252 - (721 + 530))) then
                                v60 = {}
                                v54 = 2
                                break
                            end
                        end
                    end
                end
                break
            end
        end
    end
    local function v29(v61, v62, v63)
        local v64 = 0
        local v65
        local v66
        local v67
        while true do
            if (1 == v64) then
                v67 = v61[3]
                return function(...)
                    local v81 = v65
                    local v82 = v66
                    local v83 = v67
                    local v84 = v27
                    local v85 = 1
                    local v86 = -1
                    local v87 = {}
                    local v88 = {...}
                    local v89 = v12("#", ...) - 1
                    local v90 = {}
                    local v91 = {}
                    for v95 = 0, v89 do
                        if (v95 >= v83) then
                            v87[v95 - v83] = v88[v95 + 1]
                        else
                            v91[v95] = v88[v95 + 1]
                        end
                    end
                    local v92 = (v89 - v83) + 1
                    local v93
                    local v94
                    while true do
                        v93 = v81[v85]
                        v94 = v93[1]
                        if (v94 <= 9) then
                            if (v94 <= 4) then
                                if (v94 <= 1) then
                                    if (v94 == 0) then
                                        v91[v93[2]] = v29(v82[v93[3]], nil, v63)
                                    else
                                        v91[v93[2]] = v91[v93[3]]
                                    end
                                elseif (v94 <= 2) then
                                    v91[v93[2]] = v91[v93[3]][v93[4]]
                                elseif (v94 == 3) then
                                    v91[v93[2]][v93[3]] = v91[v93[4]]
                                else
                                    v91[v93[2]] = v93[3]
                                end
                            elseif (v94 <= 6) then
                                if (v94 == 5) then
                                    v91[v93[2]] = v93[3]
                                else
                                    do
                                        return
                                    end
                                end
                            elseif (v94 <= 7) then
                                v91[v93[2]][v93[3]] = v91[v93[4]]
                            elseif (v94 > 8) then
                                v91[v93[2]] = v91[v93[3]][v93[4]]
                            else
                                local v142 = 0
                                local v143
                                while true do
                                    if (v142 == 0) then
                                        v143 = v93[2]
                                        v91[v143](v91[v143 + 1])
                                        break
                                    end
                                end
                            end
                        elseif (v94 <= 14) then
                            if (v94 <= 11) then
                                if (v94 > 10) then
                                    v91[v93[2]] = {}
                                else
                                    v91[v93[2]] = v29(v82[v93[3]], nil, v63)
                                end
                            elseif (v94 <= 12) then
                                do
                                    return
                                end
                            elseif (v94 > 13) then
                                v91[v93[2]] = {}
                            else
                                v91[v93[2]] = v63[v93[3]]
                            end
                        elseif (v94 <= 16) then
                            if (v94 == 15) then
                                local v131 = v93[2]
                                v91[v131](v13(v91, v131 + 1, v93[3]))
                            else
                                local v132 = 0
                                local v133
                                while true do
                                    if (0 == v132) then
                                        v133 = v93[2]
                                        v91[v133](v13(v91, v133 + 1, v93[3]))
                                        break
                                    end
                                end
                            end
                        elseif (v94 <= 17) then
                            v91[v93[2]] = v91[v93[3]]
                        elseif (v94 > 18) then
                            local v147 = v93[2]
                            v91[v147](v91[v147 + 1])
                        else
                            v91[v93[2]] = v63[v93[3]]
                        end
                        v85 = v85 + 1
                    end
                end
            end
            if (0 == v64) then
                v65 = v61[1]
                v66 = v61[2]
                v64 = 1
            end
        end
    end
    return v29(v28(), {}, v17)(...)
end
v15(
    "LOL!053O0003093O00416E7469636865617403073O00636C5F6C6F677303083O0073656E644C6F677303053O007072696E74031F3O004C4F4144204C4F475320414E54494348454154205749542O48204352595054000B3O002O123O00014O000B00015O0010033O00020001002O123O00013O0020025O000200022O00015O0010033O00030001002O123O00043O001205000100054O00133O000200012O00063O00013O00013O00023O0003123O005472692O6765725365727665724576656E7403183O007A6D61696E3A616E746963686561743A73656E644C6F677304073O002O12000400013O001205000500024O0001000600014O0001000700024O0001000800034O00100004000800012O00063O00017O00",
    v9(),
    ...
)
