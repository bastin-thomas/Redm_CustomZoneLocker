
--TimeBeforeKill
TimeBeforeKill = 45 --in sec
MessageBeforeKill = "Vous quittées les terres connues, vous allez vous perdre dans 30 secondes (Mort)." -- You have Enter the DeadZone
MessageReturnSafe = "Ouf, vous avez retrouvé votre chemin vers les terres connues." -- You have quit the DeadZone

--Area, for add new one, copy one Row
Zones = {
    {
        --Zone Rhodes
        CoordCenter = vector3(1590.32, -1859.21, 52.35),    -- center
        CoordBorder = vector3(2116.52, -996.096, 41.73)     -- Border of the Circle
    },
    {
        --Zone SD1
        CoordCenter = vector3(2359.55, -681.13, 42.33),     -- center
        CoordBorder = vector3(2158.44, -956.54, 42.69)      -- Border of the Circle
    },
    {
        --Zone SD2 + VanHorn
        CoordCenter = vector3(3813.37, 91.33, 56.28),     -- center
        CoordBorder = vector3(2525.78, 261.19, 68.64)     -- Border of the Circle
    },
    {
        --Zone Annesburg
        CoordCenter = vector3(3199.56, 1213.42, 41.65),     -- center
        CoordBorder = vector3(2538.58, 1486.99, 85.84)     -- Border of the Circle
    }
    
}