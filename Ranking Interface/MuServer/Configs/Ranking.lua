Ranking_Config = {
    Enabled = true,

    Packet = 9,

    Categories = {
        [1] = {Table = "Character", PointsColumn = "ResetsWeek"   , PlayerColumn ="Name", Time = {Show = true, Column = "ResetTime"}},
        [2] = {Table = "Character", PointsColumn = "MResetsWeek"  , PlayerColumn ="Name", Time = {Show = true, Column = "MResetTime"}},
        [3] = {Table = "Character", PointsColumn = "PKWeek"  , PlayerColumn ="Name", Time = {Show = false, Column = ""}},
        [4] = {Table = "Character", PointsColumn = "HeroWeek", PlayerColumn ="Name", Time = {Show = false, Column = ""}},
    }

}

return Ranking_Config