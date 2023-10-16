//::///////////////////////////////////////////////
//:: Achievement Script Library
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
     This is the script library for implementing the
     Neverwinter Nights Achievements!
*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Oct 2018
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

//Turn Debug messages on(1) or off(0)
const int DEBUG = 0;

//General
void    CheckAchievements(object oPlayer, object oModule);
void    CheckGeneralAchievements(object oPlayer);
void    CheckChapterAchievements(object oPlayer, object oModule);

void    PlotAchievement(object oPlayer, int iChapter);
string  CheckMephistoFate();
void    DifficultyAchievements(object oPlayer, object oBoss, int iDifficulty);

int     CheckHenchmanAllComplete(object oPlayer, int iChapter);
int     HenchmenQuestAchievement(object oPlayer, int iAllComplete);
int     KilledHenchmenAchievement(object oPlayer);

int     GetTotalLevels(object oPlayer);
void    LevelAchievements(object oPlayer);
void    MultiClassAchievement(object oPlayer);

void    CheckClassesForPrestige(object oPlayer);
int     DeterminePrestigeClass(object oPlayer, int iClass);
void    PrestigeAchievement(object oPlayer, int iClass, int iPosition);

void    EpicClassAchievement(object oPlayer);
int     DetermineEpicSpell(object oPlayer);
void    EpicSpellAchievement(object oPlayer);
void    BigbysHandAchievement(object oPlayer);

void    SkillCheckAchievement(object oPlayer);

void    GameOverAchievement(object oPlayer);
void    GoldAchievement(object oPlayer);

int     CheckPartyNumbers(object oPlayer);
void    CrowdedPartyAchievement(object oPlayer);

//Chapter 1
void    BurnThingsAchievement(object oPlayer);
void    NeverTombAchievement(object oPlayer);
void    UnfairSwordsAchievement(object oPlayer, int iLevel);
void    HelmDemonAchievement(object oPlayer);

//Chapter 2
void    HoardModeAchievement(object oPlayer);
int     CheckSerpentGems(object oPlayer);
int     CheckMutaminChallenge(object oPlayer);
int     CheckLlastBounty(object oPlayer);
int     CheckImaskaranTomes(object oPlayer);
void    NoTeenWolvesAchievement(object oPlayer);
int     CheckExtraCultEvidence(object oPlayer);
void    CultEvidenceAchievement(object oPlayer);
void    JharegAchievement(object oPlayer);
void    BabyAchievement(object oPlayer, string iChapter);

//Chapter 3
void    LawAndRolganAchievement(object oPlayer);
int     CheckRepairedAmulet();
void    NotAnOcarinaAchievement(object oPlayer);
void    NoJewelryForMeAchievement(object oPlayer);
void    DragonFriendsAchievement(object oPlayer);

//Chapter 4
void    UnderSiegeAchievement(object oPlayer);
void    AribethFateAchievement(object oPlayer);

//::///////////////////////////////////////////////
//:: Name CheckAchievements
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
     General 'main' function for use in a module's
     OnHeartbeat function. Continuously checks if
     a player has completed general or chapter specific
     achievements.
*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Oct 2018
//:://////////////////////////////////////////////
void CheckAchievements(object oPlayer, object oModule){
   CheckGeneralAchievements(oPlayer);
   CheckChapterAchievements(oPlayer, oModule);

}

//::///////////////////////////////////////////////
//:: Name CheckGeneralAchievements
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
     Checks most of the general achievements that
     aren't tied to any specific module.
*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Oct 2018
//:://////////////////////////////////////////////
void CheckGeneralAchievements(object oPlayer){

    LevelAchievements(oPlayer);
    MultiClassAchievement(oPlayer);
    CheckClassesForPrestige(oPlayer);
    GoldAchievement(oPlayer);
    KilledHenchmenAchievement(oPlayer);
    CrowdedPartyAchievement(oPlayer);
    EpicClassAchievement(oPlayer);
    EpicSpellAchievement(oPlayer);
    BigbysHandAchievement(oPlayer);
    SkillCheckAchievement(oPlayer);

}

//::///////////////////////////////////////////////
//:: Name CheckChapterAchievements
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
     Checks the achievements tied to specif chapters
*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Oct 2018
//:://////////////////////////////////////////////
void CheckChapterAchievements(object oPlayer, object oModule){
    string sModule = GetTag(oModule);
    int iChapter;

    //Chapter 1: Fair Weather Henchmen, Burn Baby, Neverwinter Crypt Raider
    //           These Swords Are Poorly Balanced
    if(sModule == "Chapter1"){
        iChapter = 1;
        if(CheckHenchmanAllComplete(oPlayer, iChapter)){
            HenchmenQuestAchievement(oPlayer, iChapter);
        }
        BurnThingsAchievement(oPlayer);
        NeverTombAchievement(oPlayer);
        UnfairSwordsAchievement(oPlayer, 8);

    }

    //Chapter 1E: Deal or No Deal
    if(sModule == "ENDMODULE1"){
        HelmDemonAchievement(oPlayer);
    }

    //Chapter 2:
    if(sModule == "Chapter2"){
        iChapter = 2;

        if(CheckHenchmanAllComplete(oPlayer, iChapter)){
            HenchmenQuestAchievement(oPlayer, iChapter);
        }

        HoardModeAchievement(oPlayer);
        NoTeenWolvesAchievement(oPlayer);

        if(CheckExtraCultEvidence(oPlayer) >= 4 &&
           GetLocalInt(oModule, "Chapter2_Know_Cult") == 1){

            CultEvidenceAchievement(oPlayer);
        }

        JharegAchievement(oPlayer);

    }

    //Chapter 3
    if(sModule == "Chapter3"){
        iChapter = 3;

        if(CheckHenchmanAllComplete(oPlayer, iChapter)){
            HenchmenQuestAchievement(oPlayer, iChapter);
        }
        LawAndRolganAchievement(oPlayer);
        NotAnOcarinaAchievement(oPlayer);
        NoJewelryForMeAchievement(oPlayer);
        DragonFriendsAchievement(oPlayer);
    }

    //Chapter 4
    if(sModule == "ENDMODULE3"){
        UnderSiegeAchievement(oPlayer);
        AribethFateAchievement(oPlayer);
    }

    if(sModule == "x0_module2"){
        BabyAchievement(oPlayer, "HotU");
    }

}


//::///////////////////////////////////////////////
//:: Name PlotAchievement
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
     Unlocks the achievement for a specific chapter
     of the original campaign or the expansions SoU
     and HotU

        0 = OC Prelude
        1 = OC Chapter 1
        2 = OC Chapter 2
        3 = OC Chapter 3
        4 = OC Chapter 4
        5 = SoU
        6 = HotU
*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Oct 2018
//:://////////////////////////////////////////////
void PlotAchievement(object oPlayer, int iChapter){
    if(GetIsPC(oPlayer)){
        switch(iChapter){
            case 0:
                if(DEBUG == 1) SendMessageToPC(oPlayer, "Graduate with Bloody Honours");
                UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQAQ"); //Graduate with Bloody Honours
                break;
            case 1:
                if(DEBUG == 1) SendMessageToPC(oPlayer, "Silence the Wailing");
                UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQBw"); //Silence the Wailing
                break;
            case 2:
                if(DEBUG == 1) SendMessageToPC(oPlayer, "New Servant of Evil");
                UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQDg"); //New Servant of Evil
                break;
            case 3:
                if(DEBUG == 1) SendMessageToPC(oPlayer, "Words Have Power");
                UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQFA"); //Words Have Power
                break;
            case 4:
                if(DEBUG == 1) SendMessageToPC(oPlayer, "Morag is No More");
                UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQGA"); //Morag is No More
                break;
            case 5:
                if(DEBUG == 1) SendMessageToPC(oPlayer, "Undrentide Under Rubble");
                UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQJg"); //Undrentide Under Rubble
                break;
            case 6:
                if(DEBUG == 1) SendMessageToPC(oPlayer, "Mephisto-Fallen");
                UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQKw"); //Mephisto-Fallen
                break;
        }
    }
}

string CheckMephistoFate(){
    string sFate = GetLocalString(GetModule(), "sMephistophelesFate");
    return sFate;
}

//::///////////////////////////////////////////////
//:: Name DifficultyAchievements
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
     This function is fired through various death scripts
     of bosses. It checks the current difficutly of the game
     and the boss that was killed.
*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Oct 2018
//:://////////////////////////////////////////////
void DifficultyAchievements(object oPlayer, object oBoss, int iDifficulty){
    string sBoss = GetTag(oBoss);

    if(iDifficulty == GAME_DIFFICULTY_CORE_RULES || iDifficulty == GAME_DIFFICULTY_DIFFICULT){
        if(sBoss == "M4Q01D08MORA" && GetLocalInt(oPlayer, "ach_hard_morag") != 1){
            if(DEBUG == 1) SendMessageToPC(oPlayer, "Hardcore Morag");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQGQ"); //Hardcore Morag
            SetLocalInt(oPlayer, "ach_hard_morag", 1);
        }
        if(sBoss == "Heurodis" && GetLocalInt(oPlayer, "ach_hard_heuro") != 1){
            if(DEBUG == 1) SendMessageToPC(oPlayer, "Hardcore Heurodis");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQLQ"); //Hardcore Heurodis
            SetLocalInt(oPlayer, "ach_hard_heuro", 1);
        }
        if(sBoss == "hx_meph" && GetLocalInt(oPlayer, "ach_hard_mephis") != 1){
            if(DEBUG == 1) SendMessageToPC(oPlayer, "Hardcore Mephisopheles");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQKA"); //Hardcore Mephistopheles
            SetLocalInt(oPlayer, "ach_hard_mephis", 1);
        }
    }
}

//::///////////////////////////////////////////////
//:: Name CheckHenchmanAllComplete
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
     This function checks the value of the "NW_L_HENSTORYC"
     integer of a henchmen per Wailing Death module. It returns
     TRUE when all henchmen story variables are equal to 4
*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Oct 2018
//:://////////////////////////////////////////////
int CheckHenchmanAllComplete(object oPlayer, int iChapter){
    string sChapter = IntToString(iChapter);

    int iDaelen     = GetLocalInt(GetObjectByTag("NW_HEN_DAE"), "NW_L_HENSTORYC" + sChapter);
    int iLinu       = GetLocalInt(GetObjectByTag("NW_HEN_BOD"), "NW_L_HENSTORYC" + sChapter);
    int iBoddyknock = GetLocalInt(GetObjectByTag("NW_HEN_LIN"), "NW_L_HENSTORYC" + sChapter);
    int iGrimgnaw   = GetLocalInt(GetObjectByTag("NW_HEN_GRI"), "NW_L_HENSTORYC" + sChapter);
    int iSharwyn    = GetLocalInt(GetObjectByTag("NW_HEN_SHA"), "NW_L_HENSTORYC" + sChapter);
    int iTomi       = GetLocalInt(GetObjectByTag("NW_HEN_GAL"), "NW_L_HENSTORYC" + sChapter);

/*    int iDaelen     = GetStoryVar(iChapter, GetObjectByTag("NW_HEN_DAE"));
    int iLinu       = GetStoryVar(iChapter, GetObjectByTag("NW_HEN_BOD"));
    int iBoddyknock = GetStoryVar(iChapter, GetObjectByTag("NW_HEN_LIN"));
    int iGrimgnaw   = GetStoryVar(iChapter, GetObjectByTag("NW_HEN_GRI"));
    int iSharwyn    = GetStoryVar(iChapter, GetObjectByTag("NW_HEN_SHA"));
    int iTomi       = GetStoryVar(iChapter, GetObjectByTag("NW_HEN_GAL"));
*/
    int iAllComplete = FALSE;

    if(GetIsPC(oPlayer) == TRUE &&
        iDaelen == 4 && iLinu == 4 && iBoddyknock == 4 &&
        iGrimgnaw == 4 && iSharwyn == 4 && iTomi == 4){
        iAllComplete = TRUE;
    }

    return iAllComplete;

}

//::///////////////////////////////////////////////
//:: Name HenchmenQuestAchievement
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
     This function unlocks the appropriate chapter
     achievements for henchmen
*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Oct 2018
//:://////////////////////////////////////////////
void HenchmenQuestAchievement(object oPlayer, int iChapter){

    if(GetIsPC(oPlayer) == TRUE){
        if(iChapter == 1 && GetLocalInt(oPlayer, "ach_henchquest_1") != 1){
            if(DEBUG == 1) SendMessageToPC(oPlayer, "Fair Weather Henchmen");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQAg"); //Fair Weather Henchmen
            SetLocalInt(oPlayer, "ach_henchquest_1", 1);
        }
        if(iChapter == 2 && GetLocalInt(oPlayer, "ach_henchquest_2") != 1){
            if(DEBUG == 1) SendMessageToPC(oPlayer, "Not Just In It For The Paycheque");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQCw"); //Not Just In It For The Paycheque
            SetLocalInt(oPlayer, "ach_henchquest_2", 1);
        }
        if(iChapter == 3 && GetLocalInt(oPlayer, "ach_henchquest_3") != 1){
            if(DEBUG == 1) SendMessageToPC(oPlayer, "Ride or Die Henchmen");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQEg"); //Ride or Die Henchmen
            SetLocalInt(oPlayer, "ach_henchquest_3", 1);
        }
    }
}


//::///////////////////////////////////////////////
//:: Name KilledHenchmenAchievement
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
     A general achievement that's called through various
     OnDeath scripts of NPCs if they are your henchman.

        - nw_nc_ac7 for OC henchmen
        - nw_c2_default7 for general monsters
        - x0_ch_hen_death
        - x2_hen_deth

    Fires once you've killed 1 henchman
*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Oct 2018
//:://////////////////////////////////////////////
void KilledHenchmenAchievement(object oPlayer){
    if(GetIsPC(oPlayer) && GetLocalInt(oPlayer, "ach_workers_comp") != 1){
        if(GetLocalInt(oPlayer, "ach_killed_hench") >= 1){

            if(DEBUG == 1) SendMessageToPC(oPlayer, "you've killed " + IntToString(GetLocalInt(oPlayer,
                "ach_killed_hench")) + " henchmen");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQLw"); //No Worker's Comp
            SetLocalInt(oPlayer, "ach_workers_comp", 1);
        }
    }
}

//::///////////////////////////////////////////////
//:: Name GetTotalLevels
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
     Gets the combined levels of all three classes
     a character can have and returns that value
*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Oct 2018
//:://////////////////////////////////////////////
int GetTotalLevels(object oPlayer){
    int iLevel = 0;

    iLevel = GetLevelByPosition(1, oPlayer) +
             GetLevelByPosition(2, oPlayer) +
             GetLevelByPosition(3, oPlayer);

    return iLevel;
}


//::///////////////////////////////////////////////
//:: Name LevelAchievements
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
     Activates the corresponding level
     achievement for a character. Unlock is determined
     by total combined level for all classes.
*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Oct 2018
//:://////////////////////////////////////////////
void LevelAchievements(object oPlayer){
    int iLevel = 0;

    if(GetIsPC(oPlayer)){
        iLevel = GetTotalLevels(oPlayer);

        if(iLevel >= 10 && GetLocalInt(oPlayer, "ach_level_10") != 1){
            if(DEBUG == 1) SendMessageToPC(oPlayer, "Reached Level 10!");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQGg"); //Reached Level 10
            SetLocalInt(oPlayer, "ach_level_10", 1);
        }

        if(iLevel >= 20 && GetLocalInt(oPlayer, "ach_level_20") != 1){
            if(DEBUG == 1) SendMessageToPC(oPlayer, "Reached Level 20!");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQGw"); //Reached Level 20
            SetLocalInt(oPlayer, "ach_level_20", 1);
        }

        if(iLevel >= 40 && GetLocalInt(oPlayer, "ach_level_40") != 1){
            if(DEBUG == 1) SendMessageToPC(oPlayer, "Reached Level 40!");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQHA"); //Reached Level 40
            SetLocalInt(oPlayer, "ach_level_40", 1);
        }
    }
}

//::///////////////////////////////////////////////
//:: Name MultiClassAchievement
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
     Checks if a character has three classes.
*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Oct 2018
//:://////////////////////////////////////////////
void MultiClassAchievement(object oPlayer){
    int iClasses = 0;
    int i;

    if(GetIsPC(oPlayer) && GetLocalInt(oPlayer, "ach_multiclass") != 1){
        for(i = 1; i <=3; i++){
            if(GetClassByPosition(i, oPlayer) != CLASS_TYPE_INVALID){
                iClasses = iClasses + 1;
            }
        }
        if(iClasses >= 3){
            if(DEBUG == 1) SendMessageToPC(oPlayer, "Multifaceted Hero");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQHQ"); //Multifaceted Hero
            SetLocalInt(oPlayer, "ach_multiclass", 1);
        }
    }
}

//::///////////////////////////////////////////////
//:: Name CheckClassesForPrestige
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
     Check through all of the classes a PC character
     holds to determine if one of the classes is a
     prestige class.
*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Oct 2018
//:://////////////////////////////////////////////
void CheckClassesForPrestige(object oPlayer){
    int iClass = -1;
    int i;
    if(GetIsPC(oPlayer)){
        for(i = 1; i <= 3; i++){
            if(GetClassByPosition(i, oPlayer) != CLASS_TYPE_INVALID){
                iClass = DeterminePrestigeClass(oPlayer, GetClassByPosition(i, oPlayer));
                if(iClass >= 1){
                    PrestigeAchievement(oPlayer, iClass, i);
                }
            }
        }
    }
}

//::///////////////////////////////////////////////
//:: Name DeterminePrestigeClass
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
     Given a class number, dertermine if it is a prestige
     class, and if so which game/expansion it is from.

     Presige class introduced with path 1.69:
        CLASS_TYPE_PURPLE_DRAGON_KNIGHT

     Prestige classes introduced in SoU:
        CLASS_TYPE_ARCANE_ARCHER
        CLASS_TYPE_ASSASSIN
        CLASS_TYPE_BLACKGUARD
        CLASS_TYPE_HARPER
        CLASS_TYPE_SHADOWDANCER

    Prestige classes introduced in HotU:
        CLASS_TYPE_DIVINE_CHAMPION
        CLASS_TYPE_DWARVEN_DEFENDER
        CLASS_TYPE_PALE_MASTER
        CLASS_TYPE_DRAGON_DISCIPLE
        CLASS_TYPE_SHIFTER
        CLASS_TYPE_WEAPON_MASTER

*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Oct 2018
//:://////////////////////////////////////////////
int DeterminePrestigeClass(object oPlayer, int iClass){
    int iPrestige = -1;
    if(GetIsPC(oPlayer)){

        switch(iClass){
            //General Prestige class
            case CLASS_TYPE_PURPLE_DRAGON_KNIGHT:
                iPrestige = 1;
                break;

            //Shadows of Undrentide specific prestige classes
            case CLASS_TYPE_ARCANE_ARCHER:
                iPrestige = 2;
                break;
            case CLASS_TYPE_ASSASSIN:
                iPrestige = 2;
                break;
            case CLASS_TYPE_BLACKGUARD:
                iPrestige = 2;
                break;
            case CLASS_TYPE_HARPER:
                iPrestige = 2;
                break;
            case CLASS_TYPE_SHADOWDANCER:
                iPrestige = 2;
                break;

           // Hordes of the Underdark specific prestige classes
           case CLASS_TYPE_DIVINE_CHAMPION:
                iPrestige = 3;
                break;
           case CLASS_TYPE_DWARVEN_DEFENDER:
                iPrestige = 3;
                break;
           case CLASS_TYPE_PALE_MASTER:
                iPrestige = 3;
                break;
           case CLASS_TYPE_DRAGON_DISCIPLE:
                iPrestige = 3;
                break;
           case CLASS_TYPE_SHIFTER:
                iPrestige = 3;
                break;
           case CLASS_TYPE_WEAPON_MASTER:
                iPrestige = 3;
                break;
        }
    }
    return iPrestige;
}

//::///////////////////////////////////////////////
//:: Name PrestigeAchievement
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
   Unlocks corresponding prestige class achievements

*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Oct 2018
//:://////////////////////////////////////////////
void PrestigeAchievement(object oPlayer, int iClass, int iPosition){

    if(GetIsPC(oPlayer)){
        //If a character has any prestige class this fires
        if(GetLocalInt(oPlayer, "ach_oc_prestige") != 1){
            if(DEBUG == 1) SendMessageToPC(oPlayer, "How Prestigious");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQHg"); //How Prestigious (OC achievement)
            SetLocalInt(oPlayer, "ach_oc_prestige", 1);
        }
        //If a character has a prestige class for SoU this fires
        if(iClass == 2 && GetLocalInt(oPlayer, "ach_sou_prestige") != 1){
            if(DEBUG == 1) SendMessageToPC(oPlayer, "SoU Prestige");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQJw"); //Extra Presigious (SoU achievement)
            SetLocalInt(oPlayer, "ach_sou_prestige", 1);
        }
        //If a character has a prestige class for HotU this fires
        if(iClass == 3 && GetLocalInt(oPlayer, "ach_hotu_prestige") != 1){
            if(DEBUG == 1) SendMessageToPC(oPlayer, "HotU Prestige");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQKg"); //Even More Presigious (HotU achievement)
            SetLocalInt(oPlayer, "ach_hotu_prestige", 1);
        }
        //If a prestige class reaches level 5 this fires
        if(GetLevelByPosition(iPosition, oPlayer) >= 5 && GetLocalInt(oPlayer, "ach_5x_prestige") != 1){
            if(DEBUG == 1) SendMessageToPC(oPlayer, "5x Prestigious");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQHw"); //How Prestigious x5
            SetLocalInt(oPlayer, "ach_5x_prestige", 1);
        }
    }
}

//::///////////////////////////////////////////////
//:: Name EpicClassAchievement
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
   Unlocks corresponding epic class achievement for
   a character. This is unlocked if a default class
   reaches level 21 or a prestige class reaches level
   11.

*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Oct 2018
//:://////////////////////////////////////////////
void EpicClassAchievement(object oPlayer){
    int i;
    int iPrestigeClass;
    int iClassLevel;
    if(GetIsPC(oPlayer) && GetLocalInt(oPlayer, "ach_epic_class") != 1){
        for(i = 0; i <=3; i++){
            iPrestigeClass = DeterminePrestigeClass(oPlayer, GetClassByPosition(i, oPlayer));
            iClassLevel = GetLevelByPosition(i, oPlayer);
            if(iPrestigeClass != -1 && iClassLevel >= 11){
                if(DEBUG == 1) SendMessageToPC(oPlayer, "Top of Your Class");
                UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQLA"); //Top of Your Class
                SetLocalInt(oPlayer, "ach_epic_class", 1);
            }
            else if(iClassLevel >= 21){
                if(DEBUG == 1) SendMessageToPC(oPlayer, "Top of Your Class");
                UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQLA"); //Top of Your Class
                SetLocalInt(oPlayer, "ach_epic_class", 1);
            }
        }
    }
}


//::///////////////////////////////////////////////
//:: Name DetermineEpicSpell
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
   Determines if a character has unlocked an epic spell.

   Epic Spell list:
        Dragon Knight
        Epic Warding
        Hellball
        Epic Mage Armour
        Mummy Dust
        Greater Ruin

*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Nov 2018
//:://////////////////////////////////////////////
int DetermineEpicSpell(object oPlayer){
    int iEpicSpell = FALSE;
    if(GetIsPC(oPlayer)){

        if(GetHasFeat(FEAT_EPIC_SPELL_DRAGON_KNIGHT, oPlayer) ||
           GetHasFeat(FEAT_EPIC_SPELL_EPIC_WARDING, oPlayer) ||
           GetHasFeat(FEAT_EPIC_SPELL_HELLBALL, oPlayer) ||
           GetHasFeat(FEAT_EPIC_SPELL_MAGE_ARMOUR, oPlayer) ||
           GetHasFeat(FEAT_EPIC_SPELL_MUMMY_DUST, oPlayer) ||
           GetHasFeat(FEAT_EPIC_SPELL_RUIN, oPlayer)){

            if(DEBUG == 1) SendMessageToPC(oPlayer, "HAS EPIC SPELL");

            iEpicSpell = TRUE;
        }
    }
    return iEpicSpell;

}

//::///////////////////////////////////////////////
//:: Name EpicSpellAchievement
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
   After determining if a character has an epic spell,
   unlock the appropriate achievement

*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Nov 2018
//:://////////////////////////////////////////////
void EpicSpellAchievement(object oPlayer){
    if(GetIsPC(oPlayer) && GetLocalInt(oPlayer, "ach_epic_spell") != 1){
        if(DetermineEpicSpell(oPlayer)){
            if(DEBUG == 1) SendMessageToPC(oPlayer, "Arcane: Epic Edition");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQLg"); //Arcane: Epic Edition
            SetLocalInt(oPlayer, "ach_epic_spell", 1);
        }
    }
}

//::///////////////////////////////////////////////
//:: Name BigbysHandAchievement
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
   Checks if a character has learned and can use
   all of the various Bigby's hand spells. The spells
   need to be usable (ie: if your character is a wizard
   you need to memorize the spell and rest before this
   will unlock.)

*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Nov 2018
//:://////////////////////////////////////////////
void BigbysHandAchievement(object oPlayer){
    if(GetIsPC(oPlayer) && GetLocalInt(oPlayer, "ach_bigby_hand") != 1){
        if(GetHasSpell(SPELL_BIGBYS_CLENCHED_FIST, oPlayer) &&
            GetHasSpell(SPELL_BIGBYS_CRUSHING_HAND, oPlayer) &&
            GetHasSpell(SPELL_BIGBYS_FORCEFUL_HAND, oPlayer) &&
            GetHasSpell(SPELL_BIGBYS_GRASPING_HAND, oPlayer) &&
            GetHasSpell(SPELL_BIGBYS_INTERPOSING_HAND, oPlayer)){

                if(DEBUG == 1) SendMessageToPC(oPlayer, "Bigby's Thesaurus Hand");
                UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQJQ"); //Bigby's Thesaurus Hand
                SetLocalInt(oPlayer, "ach_bigby_hand", 1);
            }
    }

}

//::///////////////////////////////////////////////
//:: Name SkillCheckAchievement
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
   Checks the rank of two skills, Tumble and Bluff.
   Unlocks the appropriate achievement should either
   reach rank 10.

   These were absolutely put in as Phil jokes.

*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Nov 2018
//:://////////////////////////////////////////////
void SkillCheckAchievement(object oPlayer){
    if(GetIsPC(oPlayer)){
        if(GetSkillRank(SKILL_TUMBLE, oPlayer, TRUE) >= 10 &&
           GetLocalInt(oPlayer, "ach_dunk_monk") != 1){
            if(DEBUG == 1) SendMessageToPC(oPlayer, "Dunk The Monk");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQIw"); //Dunk The Monk
            SetLocalInt(oPlayer, "ach_dunk_monk", 1);
        }
        if(GetSkillRank(SKILL_BLUFF, oPlayer, TRUE) >= 10 &&
           GetLocalInt(oPlayer, "ach_liar_liar") != 1){
            if(DEBUG == 1) SendMessageToPC(oPlayer, "Don't Believe His Lies");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQKQ"); //Don't Believe His Lies
            SetLocalInt(oPlayer, "ach_liar_liar", 1);
        }
    }
}

//::///////////////////////////////////////////////
//:: Name GameOverAchievement
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
   This is fired from various OnPlayerDeath scripts when
   a character dies.
        - nw_o0_death
        - x1_chp1_death
        - x2_death

*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Oct 2018
//:://////////////////////////////////////////////
void GameOverAchievement(object oPlayer){
    if(GetIsPC(oPlayer) && GetLocalInt(oPlayer, "ach_game_over") != 1){

        if(DEBUG == 1) SendMessageToPC(oPlayer, "That Went Well");
        UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQIA"); //That Went Well
        SetLocalInt(oPlayer, "ach_game_over", 1);
    }
}

//::///////////////////////////////////////////////
//:: Name GoldAchievement
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
    This checks on heartbeat if a character has
    a total of 100,000 gold in their inventory. It
    must be all at once.

*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Oct 2018
//:://////////////////////////////////////////////
void GoldAchievement(object oPlayer){
    if(GetIsPC(oPlayer) && GetGold(oPlayer) >= 100000 && GetLocalInt(oPlayer, "ach_100k_gold") != 1){
        if(DEBUG == 1) SendMessageToPC(oPlayer, "Gold Achievement Unlocked!");
        UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQIg"); //100k Pennies In Your Pocket
        SetLocalInt(oPlayer, "ach_100k_gold", 1);
    }
}

//::///////////////////////////////////////////////
//:: Name CheckPartyNumbers
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
    Returns how many characters are in your party
    (including the PC)

*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Nov 2018
//:://////////////////////////////////////////////
int CheckPartyNumbers(object oPlayer){
    int iCount = 0;
    object oPartyMember = GetFirstFactionMember(oPlayer);

    //Check PC only party members. This includes oPlayer
    while(GetIsObjectValid(oPartyMember) == TRUE){
        oPartyMember = GetNextFactionMember(oPlayer);
        iCount = iCount + 1;
    }

    //Check NPC only party members
    oPartyMember = GetFirstFactionMember(oPlayer, FALSE);
    while(GetIsObjectValid(oPartyMember) == TRUE){
        if(GetIsPC(oPartyMember) == FALSE){
            iCount = iCount + 1;
        }
        oPartyMember = GetNextFactionMember(oPlayer, FALSE);
    }

    return iCount;

}

//::///////////////////////////////////////////////
//:: Name CrowdedPartyAchievement
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
    Once your party has reached 4 total characters,
    this will unlock.

*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Nov 2018
//:://////////////////////////////////////////////
void CrowdedPartyAchievement(object oPlayer){
    if(GetIsPC(oPlayer)){
        if(GetLocalInt(oPlayer, "ach_crowded_hall") != 1 && CheckPartyNumbers(oPlayer) >= 4){
            if(DEBUG == 1) SendMessageToPC(oPlayer, "There are too many people in this hall");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQIQ"); //There Are Too Many People In This Hallway
            SetLocalInt(oPlayer, "ach_crowded_hall", 1);
        }
    }
}

//::///////////////////////////////////////////////
//:: Name CrowdedPartyAchievement
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
    This unlocks the achievement for burning the
    Plague Pyres in the Peninsula district of the
    Wailing Death campaign. There are four bodies
    you need to find.

*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Oct 2018
//:://////////////////////////////////////////////
void BurnThingsAchievement(object oPlayer){
    int iCount;
    if(GetIsPC(oPlayer)){
        iCount = GetLocalInt(GetModule(), "pen_burn_bodies");
        if(iCount >= 4 && GetLocalInt(oPlayer, "ach_burn_baby") != 1){
            if(DEBUG == 1) SendMessageToPC(oPlayer, "Burn Baby");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQAw"); //Burn Baby
            SetLocalInt(oPlayer, "ach_burn_baby", 1);
        }
    }
}

//::///////////////////////////////////////////////
//:: Name NeverTombAchievement
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
    Determines if the player has returned the
    three Never artifacts. It does not matter
    which NPC they have been returned to.

    Items that must be returned are:
        - Halueth's Rusted Armour
        - Ancient Chronicles of Halueth Never
        - Ancient Symbol of Tyr

    You do not have to return Jacob's Quill

*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Oct 2018
//:://////////////////////////////////////////////
void NeverTombAchievement(object oPlayer){
    object iModule = GetModule();
    int iAllReturned = FALSE;
    int iBook;
    int iArmor;
    int iSymbol;

    if(GetIsPC(oPlayer) && GetLocalInt(oPlayer, "ach_never_tomb") != 1){

        if(GetTag(iModule) == "Chapter1"){
            iBook = GetLocalInt(iModule, "NW_G_M1S1BookReturned");
            iArmor = GetLocalInt(iModule, "NW_G_M1S1ArmorReturned");
            iSymbol = GetLocalInt(iModule, "NW_G_M1S1SymbolReturned");
            if(iBook && iArmor && iSymbol){
                if(DEBUG == 1) SendMessageToPC(oPlayer, "Neverwinter Crypt Raider unlocked!");
                UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQBA"); //Neverwinter Crypt Raider
                SetLocalInt(oPlayer, "ach_never_tomb", 1);

            }
        }
    }
}

//::///////////////////////////////////////////////
//:: Name UnfairSwordsAchievement
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
    Unlock the achievement for killing the four
    flying swords in the Blacklake tomb of Never
    if the character that killed the swords is
    level 8 or less

*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Oct 2018
//:://////////////////////////////////////////////
void UnfairSwordsAchievement(object oPlayer, int iLevel){
    int iCount;
    int iPCLevel;

    if(GetIsPC(oPlayer)){
        iCount = GetLocalInt(GetModule(), "blake_flying_swords");
        iPCLevel = GetTotalLevels(oPlayer);
        if(iCount >= 4 && iPCLevel <= iLevel && GetLocalInt(oPlayer, "ach_unfair_swords") != 1){
            if(DEBUG == 1) SendMessageToPC(oPlayer, "These Swords Are Poorly Balanced unlocked!");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQBQ"); //These Swords are poorly Balanced
            SetLocalInt(oPlayer, "ach_unfair_swords", 1);
        }
    }
}

//::///////////////////////////////////////////////
//:: Name HelmDemonAchievement
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
    Unlocks the achievement for either releasing
    the demon in Helm's Hold, or banishing it and
    summoning the Guardian

*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Oct 2018
//:://////////////////////////////////////////////
void HelmDemonAchievement(object oPlayer){
    if(GetIsPC(oPlayer) && GetLocalInt(oPlayer, "ach_helms_demon") != 1){
        if(GetLocalInt(GetModule(), "NW_G_M1Q6F08Demon_Free") == TRUE ||
           GetLocalInt(GetModule(), "NW_G_M1Q6F08Guardian_Free") == TRUE){

            if(DEBUG == 1) SendMessageToPC(oPlayer, "Dealt or No Deal Unlocked!");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQBg"); //Deal or No Deal
            SetLocalInt(oPlayer, "ach_helms_demon", 1);

        }
    }
}

//::///////////////////////////////////////////////
//:: Name HoardModeAchievement
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
    Unlocks the achievement for completing four
    long fetch quests:
        - The Serpent Gems
        - Mutamin's Challenge
        - Five Tomes of Imaskaran
        - Bounty Hunt

*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Nov 2018
//:://////////////////////////////////////////////
void HoardModeAchievement(object oPlayer){
    int iSerpent = FALSE;
    int iMutamin = FALSE;
    int iBounty = FALSE;
    int iTomes = FALSE;

    int iHoardMode = FALSE;

    iSerpent = CheckSerpentGems(oPlayer);
    iMutamin = CheckMutaminChallenge(oPlayer);
    iBounty  = CheckLlastBounty(oPlayer);
    iTomes   = CheckImaskaranTomes(oPlayer);

    if(iSerpent && iMutamin && iBounty && iTomes){
        if(GetIsPC(oPlayer) && GetLocalInt(oPlayer, "ach_hoard_mode") != 1){
            if(DEBUG == 1) SendMessageToPC(oPlayer, "Hoard Mode!");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQCA"); //Hoard Mode
            SetLocalInt(oPlayer, "ach_hoard_mode", 1);
        }
    }
}

//::///////////////////////////////////////////////
//:: Name CheckSerpentGems
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
    Returns TRUE if all the gems have been returned
    to Eliath. You must not kill him.

*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Nov 2018
//:://////////////////////////////////////////////
int CheckSerpentGems(object oPlayer){
    int iAllGemsReturned = FALSE;
    object oEliath = GetObjectByTag("M2Q1CELAITH");

    if(GetLocalInt(oEliath, "I_Am_Leaving") == 1){
        iAllGemsReturned = TRUE;
    }

    return iAllGemsReturned;

}

//::///////////////////////////////////////////////
//:: Name CheckMutaminChallenge
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
    Returns TRUE if you have completed the Mutamin's
    challenge

*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Nov 2018
//:://////////////////////////////////////////////
int CheckMutaminChallenge(object oPlayer){
    int iMutaminComplete = FALSE;
    object oMutamin = GetObjectByTag("M2Q05CMUTAMIN");

    if(GetLocalObject(GetModule(),"NW_G_M2Q5ContestPC") == oPlayer){
        iMutaminComplete = TRUE;
    }
    return iMutaminComplete;
}

//::///////////////////////////////////////////////
//:: Name CheckLlastBounty
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
    Returns TRUE if you have completed the Bounty
    Hunt side quest.

*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Nov 2018
//:://////////////////////////////////////////////
int CheckLlastBounty(object oPlayer){
    int iAllBountiesComplete = FALSE;
    object oKendrack = GetObjectByTag("M2Q1CHAEROM");

    if(GetLocalInt(oKendrack, "NW_KENDRACK_PLOT") == 6){
        iAllBountiesComplete = TRUE;
    }
    return iAllBountiesComplete;
}

//::///////////////////////////////////////////////
//:: Name CheckImaskaranTomes
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
    Returns TRUE if you have returned all the Tomes
    of Imaskaran

*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Nov 2018
//:://////////////////////////////////////////////
int CheckImaskaranTomes(object oPlayer){
    int iAllTomesReturned = FALSE;

    if(GetLocalInt(GetModule(),"NW_G_FoundImaskTome") == 5){
        iAllTomesReturned = TRUE;
    }
    return iAllTomesReturned;
}


//::///////////////////////////////////////////////
//:: Name NoTeenWolvesAchievement
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
    Unlocks the No Teen Wolves Here achievement
    if you have completed The Werewolf Hunter
    side quest. It does not matter how you complete
    the quest.

*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Oct 2018
//:://////////////////////////////////////////////
void NoTeenWolvesAchievement(object oPlayer){
    if(GetIsPC(oPlayer) && GetLocalInt(oPlayer, "ach_werewolves") != 1){
        if(GetLocalInt(GetModule(), "NW_L_M2Q1A02NEURIK_PLOT") == 80){
            if(DEBUG == 1) SendMessageToPC(oPlayer, "No Teen Wolves Here!");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQCg"); //No Teen Wolves Here
            SetLocalInt(oPlayer, "ach_werewolves", 1);
        }
    }
}

//::///////////////////////////////////////////////
//:: Name CheckExtraCultEvidence
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
    Returns how many pieces of evidence has been
    collected to give to Aribeth about cult activity.

*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Oct 2018
//:://////////////////////////////////////////////
int CheckExtraCultEvidence(object oPlayer){
    int iEvidence;
    object oModule = GetModule();
    string iGanon = "M2Q5CULTJRNL";
    string iSolomon = "M2Q06ILETTSOLOMO";
    string iNeva = "M2Q06ILETTNEVA";
    string iRelmar = "M2Q2GJRNRELMAR";
    string iCharwood = "M2Q3G_CULTJOURN";
    string iVardoc = "M2Q1VARDLET";

    if(GetIsPC(oPlayer)){
        iEvidence = GetLocalInt(oModule, "ach_cult_count");
        if(HasItem(oPlayer, iGanon) && GetLocalInt(oModule, "ach_ganon_count") != 1){
            SetLocalInt(oModule, "ach_cult_count", iEvidence + 1);
            SetLocalInt(oModule, "ach_ganon_count", 1);
        }
        if(HasItem(oPlayer, iSolomon) && GetLocalInt(oModule, "ach_solo_count") != 1){
            SetLocalInt(oModule, "ach_cult_count", iEvidence + 1);
            SetLocalInt(oModule, "ach_solo_count", 1);
        }
        if(HasItem(oPlayer, iNeva) && GetLocalInt(oModule, "ach_neva_count") != 1){
            SetLocalInt(oModule, "ach_cult_count", iEvidence + 1);
            SetLocalInt(oModule, "ach_neva_count", 1);
        }
        if(HasItem(oPlayer, iRelmar) && GetLocalInt(oModule, "ach_relmar_count") != 1){
            SetLocalInt(oModule, "ach_cult_count", iEvidence + 1);
            SetLocalInt(oModule, "ach_relmar_count", 1);
        }
        if(HasItem(oPlayer, iCharwood) && GetLocalInt(oModule, "ach_charwood_count") != 1){
            SetLocalInt(oModule, "ach_cult_count", iEvidence + 1);
            SetLocalInt(oModule, "ach_charwood_count", 1);
        }
        if(HasItem(oPlayer, iVardoc) && GetLocalInt(oModule, "ach_vardoc_count") != 1){
            SetLocalInt(oModule, "ach_cult_count", iEvidence + 1);
            SetLocalInt(oModule, "ach_vardoc_count", 1);
        }
    }
    return GetLocalInt(oModule, "ach_cult_count");
}

//::///////////////////////////////////////////////
//:: Name CultEvidenceAchievement
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
    Unlocks the No Cult Stone Left Unturned achievement
    if the player has collected at least 4 pieces of
    cult activity (at least 2 extra pieces of evidence
    over the required 2).

*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Oct 2018
//:://////////////////////////////////////////////
void CultEvidenceAchievement(object oPlayer){
    if(GetIsPC(oPlayer) && GetLocalInt(oPlayer, "ach_extra_evidence") != 1){
        if(DEBUG == 1) SendMessageToPC(oPlayer, "No Cult Stone Left Unturned!");
        UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQDQ"); //No Cult Stone Left Unturned
        SetLocalInt(oPlayer, "ach_extra_evidence", 1);
    }
}

//::///////////////////////////////////////////////
//:: Name JharegAchievement
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
    Unlocks the Tower Frozen In Time Achievement
    if the player has acquired Belial's Oath before
    passing judgement on the Jhareg brothers. You must
    complete the quest to unlock, but it does not matter
    which choice you make.

*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Nov 2018
//:://////////////////////////////////////////////
void JharegAchievement(object oPlayer){

    string sResolution = GetLocalString(GetModule(), "m2q3_Resolution");

    if(GetIsPC(oPlayer) && GetLocalInt(oPlayer, "ach_tower_frozen") != 1){

        if(HasItem(oPlayer, "M2Q3_OATHBELIAL") && GetLocalInt(oPlayer, "ach_belial_oath") != 1){
            SetLocalInt(GetModule(), "ach_belial_oath", 1);
        }

        if(GetLocalInt(GetModule(), "ach_belial_oath") == 1 && sResolution != ""){
            if(DEBUG == 1) SendMessageToPC(oPlayer, "Tower Frozen in Time");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQCQ"); //Tower Frozen In Time
            SetLocalInt(oPlayer, "ach_tower_frozen", 1);
        }
    }
}

//::///////////////////////////////////////////////
//:: Name BabyAchievement
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
    Unlocks the achievements related to the two babies
    in Neverwinter Nights. You must complete chapter 2
    of the Wailing Death campaign with Yvette's Baby in
    your inventory and you must recieve the Tynan's Top
    item in Hordes of The Underdark.

*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Nov 2018
//:://////////////////////////////////////////////
void BabyAchievement(object oPlayer, string iChapter){

    if(GetIsPC(oPlayer)){
        if(iChapter == "Chap2" && GetLocalInt(oPlayer, "ach_yvette_baby") != 1){
            if(HasItem(oPlayer, "2Q4_YvettesBaby")){
                if(DEBUG == 1) SendMessageToPC(oPlayer, "You Can't Just Keep a Baby");
                UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQDA"); //You Can't Just Keep a Baby
                SetLocalInt(oPlayer, "ach_yvette_baby", 1);
            }
        }
        if(iChapter == "HotU" && GetLocalInt(oPlayer, "ach_tynan_baby") != 1){
            if(HasItem(oPlayer, "bk_top")){
                if(DEBUG == 1) SendMessageToPC(oPlayer, "That Baby Does NOT Go There!");
                UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQJA"); //That Baby Does NOT Go There!
                SetLocalInt(oPlayer, "ach_tynan_baby", 1);
            }
        }
    }
}

//::///////////////////////////////////////////////
//:: Name LawAndRolganAchievement
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
    Unlocks the Law and Rolgan achievement if
    you manage to get a complete unanimous "Not
    Guilty" vote.

*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Nov 2018
//:://////////////////////////////////////////////
void LawAndRolganAchievement(object oPlayer){
    if(GetIsPC(oPlayer) && GetLocalInt(oPlayer, "ach_rolgan_trial") != 1){
        if(GetLocalInt(GetModule(),"NW_G_M3Q01PLOTTRIALSTATUS") == 3 &&
           GetLocalInt(GetModule(),"NW_G_M3Q01PLOTVERDICT") == 5){

            if(DEBUG == 1) SendMessageToPC(oPlayer, "Law and Rolgan");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQDw"); //Law and Rolgan
            SetLocalInt(oPlayer, "ach_rolgan_trial", 1);
        }

    }
}

//::///////////////////////////////////////////////
//:: Name CheckRepairedAmulet
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
    Checks if the Amulet of Ages has been repaired

*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Nov 2018
//:://////////////////////////////////////////////
int CheckRepairedAmulet(){
    int iRepairedAmulet = FALSE;

    if(GetLocalInt(GetModule(),"NW_G_M3Q3CA_AMULET")== 1){
        iRepairedAmulet = TRUE;
    }

    return iRepairedAmulet;
}

//::///////////////////////////////////////////////
//:: Name NotAnOcarinaAchievement
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
    Checks if you have repaired the Amulet of Ages
    and used it to weaken White Fang the dragon

*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Nov 2018
//:://////////////////////////////////////////////
void NotAnOcarinaAchievement(object oPlayer){
    if(GetIsPC(oPlayer) && GetLocalInt(oPlayer, "ach_not_ocarina") != 1){

        if(CheckRepairedAmulet()){
            if(DEBUG == 1) SendMessageToPC(oPlayer, "It's Not An Ocarina");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQEA"); //It's Not An Ocarina
            SetLocalInt(oPlayer, "ach_not_ocarina", 1);
        }
    }
}

//::///////////////////////////////////////////////
//:: Name NoJewelryForMeAchievement
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
    Checks if you have killed White Fang the dragon
    without repairing the Amulet of Ages

*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Nov 2018
//:://////////////////////////////////////////////
void NoJewelryForMeAchievement(object oPlayer){
    //if dragon dead and you don't have the amulet
    if(GetIsPC(oPlayer) && GetLocalInt(oPlayer, "ach_no_jewelry") != 1){
        if(CheckRepairedAmulet() == FALSE &&
           GetLocalInt(GetModule(),"NW_G_M3Q01PLOTGLOBEONPEDESTAL") == 99){

            if(DEBUG == 1) SendMessageToPC(oPlayer, "No Jewelry For Me");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQEQ"); //No Jewelry For Me
            SetLocalInt(oPlayer, "ach_no_jewelry", 1);
        }
    }
}

//::///////////////////////////////////////////////
//:: Name DragonFriendsAchievement
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
    Unlocks the achievement Dragons Are Friends Not
    Fodder if you have completed the quests "Golgotha"
    and "Working For Akulatraxas"

*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Nov 2018
//:://////////////////////////////////////////////
void DragonFriendsAchievement(object oPlayer){
    object oAkula = GetObjectByTag("M3Q04C03AKUL");
    object oGolgotha = GetObjectByTag("M3Q04F02GORGELC");

    if(GetIsPC(oPlayer) && GetLocalInt(oPlayer, "ach_dragon_friends") != 1){
        if(GetLocalInt(oAkula, "AkulaPlotDone") == 1 &&
           GetLocalInt(oGolgotha, "NW_L_M3Q04PLOTKLAUTHDEAD") == 1){

            if(DEBUG == 1) SendMessageToPC(oPlayer, "Dragons are Friends Not Fodder");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQEw"); //Dragons are Friends Not Fodder
            SetLocalInt(oPlayer, "ach_dragon_friends", 1);
        }
    }
}

//::///////////////////////////////////////////////
//:: Name UnderSiegeAchievement
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
    Unlocks the achievement for destroying all the
    catapults and seige golems in chapter 4 of the
    Wailing Death campaign

*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Nov 2018
//:://////////////////////////////////////////////
void UnderSiegeAchievement(object oPlayer){
    object oTrancar = GetObjectByTag("M4Q01A07TRAN");

    if(GetIsPC(oPlayer) && GetLocalInt(oPlayer, "ach_under_siege") != 1){
        if(GetLocalInt(GetModule(), "NW_G_M4Q01_CATAPULTS") >= 3 &&
           GetLocalInt(GetModule(), "NW_G_GOLEMS_KILLED") >= 2 &&
           GetLocalInt(oTrancar, "NW_G_FINALREWARD") == 10){

            if(DEBUG == 1) SendMessageToPC(oPlayer, "You Are a Weapon of Mass Destruction");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQFQ"); //You Are a Weapon of Mass Destruction
            SetLocalInt(oPlayer, "ach_under_siege", 1);
        }
    }
}

//::///////////////////////////////////////////////
//:: Name AribethFateAchievement
//:: Copyright (c) 2018 Beamdog
//:://////////////////////////////////////////////
/*
    Unlocks the achievement for either killing
    or sparing Aribeth

*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Oct 2018
//:://////////////////////////////////////////////
void AribethFateAchievement(object oPlayer){
    if(GetIsPC(oPlayer)){
        if(GetLocalInt(GetModule(), "NW_G_M4Q01PLOT_ARIBETH_SURRENDER") == 1 &&
           GetLocalInt(oPlayer, "ach_aribeth_alive") != 1){

            if(DEBUG == 1) SendMessageToPC(oPlayer, "Aribeth alive!");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQFg"); //A Paladin's Penance
            SetLocalInt(oPlayer, "ach_aribeth_alive", 1);
        }

        if(GetLocalInt(GetModule(), "NW_G_M4Q01PLOT_ARIBETH_KILLED") == 1 &&
           GetLocalInt(oPlayer, "ach_aribeth_dead") != 1){

            if(DEBUG == 1) SendMessageToPC(oPlayer, "Aribeth dead :(");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQFw"); //A Paladin Perishes
            SetLocalInt(oPlayer, "ach_aribeth_dead", 1);
        }
    }
}
