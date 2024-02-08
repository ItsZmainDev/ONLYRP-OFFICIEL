eKevlar = {
    eventESX = 'esx:getSharedObject',
    loadClothesEvent = 'skinchanger:loadClothes',
    ragdollOnKevlarBreak = true,
    radgollTime = 2, -- in seconds
    skin = {
        male = {
            kevID = 12,
            textureID = 1,
        },
        female = {
            kevID = 12,
            textureID = 1,
        }
    },
    BanAction = function(src)

    end,
    Translation = {
        KevlarBroken = 'Votre Kevlar s\'est briser.'
    }
}

-- Kevlar Item : ( kevlar,kevlarmid,kevlarlow )
-- Event for remove Kevlar : zmain:RemoveKevlar