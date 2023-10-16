#include "nw_i0_henchman"
void    CheckAchievements(object oPlayer, object oModule);
void    CheckGeneralAchievements(object oPlayer);
void    CheckChapterAchievements(object oPlayer, object oModule);

void    PlotAchievement(object oPlayer, int iChapter);

//General
int     CheckHenchmanAllComplete(object oPlayer, int iChapter);
int     HenchmenQuestAchievement(object oPlayer, int iAllComplete);
int     KilledHenchmenAchievement(object oPlayer);

int     GetTotalLevels(object oPlayer);
void    LevelAchievements(object oPlayer);
void    MultiClassAchievement(object oPlayer);

void    CheckClassesForPrestige(object oPlayer);
int     DeterminePrestigeClass(object oPlayer, int iClass);
void    PrestigeAchievement(object oPlayer, int iClass, int iPosition);

void    GameOverAchievement(object oPlayer);
void    GoldAchievement(object oPlayer);
void    CheckPartyCount(object oPlayer);

//Chapter 1
void    BurnThingsAchievement(object oPlayer);
int     CheckNeverTombComplete(object oPlayer);
void    UnlockNeverTombAchievement(object oPlayer);
void    UnfairSwordsAchievement(object oPlayer, int iLevel);
int     CheckDemonStatus(object oPlayer);

//Chapter 2
int     CheckHoardMode(object oPlayer);
void    HoardModeAchievement(object oPlayer);


//Chapter 4
void    AribethFateAchievement(object oPlayer, int iFate);



void CheckAchievements(object oPlayer, object oModule){

   CheckGeneralAchievements(oPlayer);

   CheckChapterAchievements(oPlayer, oModule);

}

void CheckGeneralAchievements(object oPlayer){
    //reach level X
    SendMessageToPC(oPlayer, "----------Total Levels------------");
    LevelAchievements(oPlayer);
    //multiclass
    SendMessageToPC(oPlayer, "--------Check MultiClass----------");
    MultiClassAchievement(oPlayer);
    //prestige class
    //prestige x5 level
    SendMessageToPC(oPlayer, "---------Check Prestige-----------");
    CheckClassesForPrestige(oPlayer);

    //game over
    SendMessageToPC(oPlayer, "---------CheckGameOver------------");
    GameOverAchievement(oPlayer);
    //4 party members
    //100k gold
    SendMessageToPC(oPlayer, "-----------CheckGold--------------");
    GoldAchievement(oPlayer);
    //friendly fire
    SendMessageToPC(oPlayer, "-----------KilledHench------------");
    KilledHenchmenAchievement(oPlayer);
    //50 side quests

}

void CheckChapterAchievements(object oPlayer, object oModule){
    string sModule = GetTag(oModule);
    int iTomb;
    //if prelude
    if(sModule == "Prelude"){
        //PLOT
    }
    //if chapter 1
    if(sModule == "Chapter1"){
        //Hench 1
        SendMessageToPC(oPlayer, "-----------Henchmen--------------");
        CheckHenchmanAllComplete(oPlayer, 1);

        //plague bodies
        SendMessageToPC(oPlayer, "-----------BurnedBodies----------");
        BurnThingsAchievement(oPlayer);
        //never tomb
        SendMessageToPC(oPlayer, "-------------NeverTomb-----------");
        iTomb = CheckNeverTombComplete(oPlayer);
        if(iTomb){
            UnlockNeverTombAchievement(oPlayer);
        }
        //swords
        SendMessageToPC(oPlayer, "---------------Swords------------");
        UnfairSwordsAchievement(oPlayer, 20);
        //demon - END MODULE THOUGH
    }

    if(sModule == "ENDMODULE1"){
        SendMessageToPC(oPlayer, "---------------Swords------------");
    }
    //if chapter 2
        //hoard mode
        //TIme tower
        //Teen Wolf
        //Hench 2
        //Yvette baby
        //Cult Evidence
    //if chapter 3
        //trial
        //amulet of ages
        //Don't weaken dragon
        //hench 3
        //help dragons
    //if chapter 4
        //seige weapons
        //aribeth fate
        //defeat morag with fists
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
                SendMessageToPC(oPlayer, "Prelude Complete");
                UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQAQ"); //Graduate with Bloody Honours
                break;
            case 1:
                SendMessageToPC(oPlayer, "Chapter 1 Complete");
                UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQBw"); //Silence the Wailing
                break;
            case 2:
                SendMessageToPC(oPlayer, "Chapter 2 Complete");
                UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQDg"); //New Servant of Evil
                break;
            case 3:
                SendMessageToPC(oPlayer, "Chapter 3 Complete");
                UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQFA"); //Words Have Power
                break;
            case 4:
                SendMessageToPC(oPlayer, "Chapter 4 Complete");
                UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQGA"); //Morag is No More
                break;
            case 5:
                SendMessageToPC(oPlayer, "SoU Complete");
                UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQJg"); //Undrentide Under Rubble
                break;
            case 6:
                SendMessageToPC(oPlayer, "HotU Complete");
                UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQKw"); //Mephisto-Fallen
                break;
        }
    }
}

int CheckHenchmanAllComplete(object oPlayer, int iChapter){
    int iDaelen     = GetStoryVar(iChapter, GetObjectByTag("NW_HEN_DAE"));
    int iLinu       = GetStoryVar(iChapter, GetObjectByTag("NW_HEN_BOD"));
    int iBoddyknock = GetStoryVar(iChapter, GetObjectByTag("NW_HEN_LIN"));
    int iGrimgnaw   = GetStoryVar(iChapter, GetObjectByTag("NW_HEN_GRI"));
    int iSharwyn    = GetStoryVar(iChapter, GetObjectByTag("NW_HEN_SHA"));
    int iTomi       = GetStoryVar(iChapter, GetObjectByTag("NW_HEN_GAL"));

    int iAllComplete = FALSE;

    SendMessageToPC(oPlayer, "Daelen quest: " + IntToString(iDaelen));
    SendMessageToPC(oPlayer, "Linu quest: " + IntToString(iLinu));
    SendMessageToPC(oPlayer, "Boddyknock quest: " + IntToString(iBoddyknock));
    SendMessageToPC(oPlayer, "Grimgnaw quest: " + IntToString(iGrimgnaw));
    SendMessageToPC(oPlayer, "Sharwyn quest: " + IntToString(iSharwyn));
    SendMessageToPC(oPlayer, "Tomi quest: " + IntToString(iTomi));

    if(GetIsPC(oPlayer) == TRUE &&
        iDaelen == 4 && iLinu == 4 && iBoddyknock == 4 &&
        iGrimgnaw == 4 && iSharwyn == 4 && iTomi == 4){

        iAllComplete = TRUE;
    }

    return iAllComplete;

}

void HenchmenQuestAchievement(object oPlayer, int iChapter){
    if(GetIsPC(oPlayer) == TRUE){
        if(iChapter == 1 && GetLocalInt(oPlayer, "ach_henchquest_1") != 1){
            SendMessageToPC(oPlayer, "Chapter 1 Henchmen complete!");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQAg"); //Fair Weather Henchmen
            SetLocalInt(oPlayer, "ach_henchquest_1", 1);
        }
        if(iChapter == 2 && GetLocalInt(oPlayer, "ach_henchquest_2") != 1){
            SendMessageToPC(oPlayer, "Chapter 2 Henchmen complete!");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQCw"); //Not Just In It For The Paycheque
            SetLocalInt(oPlayer, "ach_henchquest_2", 1);
        }
        if(iChapter == 2 && GetLocalInt(oPlayer, "ach_henchquest_3") != 1){
            SendMessageToPC(oPlayer, "Chapter 3 Henchmen complete!");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQEg"); //Ride or Die Weather Henchmen
            SetLocalInt(oPlayer, "ach_henchquest_3", 1);
        }
    }
}


void KilledHenchmenAchievement(object oPlayer){
    if(GetIsPC(oPlayer) && GetLocalInt(oPlayer, "ach_workers_comp") != 1){
        if(GetLocalInt(oPlayer, "ach_killed_hench") >= 1){
            SendMessageToPC(oPlayer, "you've killed " + IntToString(GetLocalInt(oPlayer,
                "ach_killed_hench")) + " henchmen");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQLw"); //No Worker's Comp
            SetLocalInt(oPlayer, "ach_workers_comp", 1);
        }
    }
}

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
     Checks to see what is the combined level of a
     character is activates the corresponding level
     achievement.
*/
//:://////////////////////////////////////////////
//:: Created By: Elyse Hill
//:: Created On: Oct 2018
//:://////////////////////////////////////////////
void LevelAchievements(object oPlayer){
    int iLevel = 0;

    if(GetIsPC(oPlayer)){
        iLevel = GetTotalLevels(oPlayer);

        if(iLevel >= 10 && iLevel < 20 && GetLocalInt(oPlayer, "ach_level_10") != 1){
            SendMessageToPC(oPlayer, "Level 10 Achievement Unlocked!");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQGg"); //Reached Level 10
            SetLocalInt(oPlayer, "ach_level_10", 1);
        }

        if(iLevel >= 20 && iLevel < 40 && GetLocalInt(oPlayer, "ach_level_20") != 1){
            SendMessageToPC(oPlayer, "Level 20 Achievement Unlocked!");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQGw"); //Reached Level 20
            SetLocalInt(oPlayer, "ach_level_20", 1);
        }

        if(iLevel >= 40 && GetLocalInt(oPlayer, "ach_level_40") != 1){
            SendMessageToPC(oPlayer, "Level 40 Achievement Unlocked!");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQHA"); //Reached Level 40
            SetLocalInt(oPlayer, "ach_level_40", 1);
        }
    }
}

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
            SendMessageToPC(oPlayer, "multi class achievement unlocked!");
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
                iClass = -1;
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
     class, and if so from what game level is it from.

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
                SendMessageToPC(oPlayer, "Purple Dragon");
                iPrestige = 1;
                break;

            //Shadows of Undrentide specific prestige classes
            case CLASS_TYPE_ARCANE_ARCHER:
                SendMessageToPC(oPlayer, "arcane archer");
                iPrestige = 2;
                break;
            case CLASS_TYPE_ASSASSIN:
                SendMessageToPC(oPlayer, "assassin");
                iPrestige = 2;
                break;
            case CLASS_TYPE_BLACKGUARD:
                SendMessageToPC(oPlayer, "blackguard");
                iPrestige = 2;
                break;
            case CLASS_TYPE_HARPER:
                SendMessageToPC(oPlayer, "harper");
                iPrestige = 2;
                break;
            case CLASS_TYPE_SHADOWDANCER:
                SendMessageToPC(oPlayer, "shadow dancer");
                iPrestige = 2;
                break;

           // Hordes of the Underdark specific prestige classes
           case CLASS_TYPE_DIVINE_CHAMPION:
                SendMessageToPC(oPlayer, "champion of torm");
                iPrestige = 3;
                break;
           case CLASS_TYPE_DWARVEN_DEFENDER:
                SendMessageToPC(oPlayer, "dwarven defender");
                iPrestige = 3;
                break;
           case CLASS_TYPE_PALE_MASTER:
                SendMessageToPC(oPlayer, "pale master");
                iPrestige = 3;
                break;
           case CLASS_TYPE_DRAGON_DISCIPLE:
                SendMessageToPC(oPlayer, "Red Dragon Disciple");
                iPrestige = 3;
                break;
           case CLASS_TYPE_SHIFTER:
                SendMessageToPC(oPlayer, "shifter");
                iPrestige = 3;
                break;
           case CLASS_TYPE_WEAPON_MASTER:
                SendMessageToPC(oPlayer, "weapon master");
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
        if(GetLocalInt(oPlayer, "ach_oc_prestige") != 1){
            SendMessageToPC(oPlayer, "How Prestigious");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQHg"); //How Prestigious (OC achievement)
            SetLocalInt(oPlayer, "ach_oc_prestige", 1);
        }
        if(iClass == 2 && GetLocalInt(oPlayer, "ach_sou_prestige") != 1){
            SendMessageToPC(oPlayer, "SoU Prestige");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQJw"); //Extra Presigious (SoU achievement)
            SetLocalInt(oPlayer, "ach_sou_prestige", 1);
        }
        if(iClass == 3 && GetLocalInt(oPlayer, "ach_hotu_prestige") != 1){
            SendMessageToPC(oPlayer, "HotU Prestige");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQKg"); //Even More Presigious (HotU achievement)
            SetLocalInt(oPlayer, "ach_hotu_prestige", 1);
        }
        if(GetLevelByPosition(iPosition, oPlayer) >= 5 && GetLocalInt(oPlayer, "ach_5x_prestige") != 1){
            SendMessageToPC(oPlayer, "5x Prestigious");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQHw"); //Even More Presigious (HotU achievement)
            SetLocalInt(oPlayer, "ach_5x_prestige", 1);
        }
    }
}


void GameOverAchievement(object oPlayer){
    if(GetIsPC(oPlayer) && GetLocalInt(oPlayer, "ach_game_over") != 1){
        UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQIA"); //Well That Went Well
        SetLocalInt(oPlayer, "ach_game_over", 1);
    }
}

void GoldAchievement(object oPlayer){
    if(GetIsPC(oPlayer) && GetGold(oPlayer) >= 100000 && GetLocalInt(oPlayer, "ach_100k_gold") != 1){
        UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQIg");
        SendMessageToPC(oPlayer, "Gold Achievement Unlocked!");
        SetLocalInt(oPlayer, "ach_100k_gold", 1);
    }
}

//COMPLETE
void CheckPartyCount(object oPlayer){

}

void BurnThingsAchievement(object oPlayer){
    int iCount;
    if(GetIsPC(oPlayer)){
        iCount = GetLocalInt(GetModule(), "pen_burn_bodies");
        if(iCount >= 7 && GetLocalInt(oPlayer, "ach_burn_baby") != 1){
            SendMessageToPC(oPlayer, "burned all the plague bodies");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQAw"); //Burn Baby
            SetLocalInt(oPlayer, "ach_burn_baby", 1);
        }
    }
}

int CheckNeverTombComplete(object oPlayer){
    object iModule = GetModule();
    int iAllReturned = FALSE;
    int iBook;
    int iArmor;
    int iSymbol;

    if(GetTag(iModule) == "Chapter1"){
        iBook = GetLocalInt(iModule, "NW_G_M1S1BookReturned");
        iArmor = GetLocalInt(iModule, "NW_G_M1S1ArmorReturned");
        iSymbol = GetLocalInt(iModule, "NW_G_M1S1SymbolReturned");
        SendMessageToPC(oPlayer, "BOOK " + IntToString(iBook));
        SendMessageToPC(oPlayer, "armour " + IntToString(iArmor));
        SendMessageToPC(oPlayer, "symbol " + IntToString(iSymbol));
        if(iBook && iArmor && iSymbol){
            iAllReturned = TRUE;
        }
    }

    return iAllReturned;
}

void UnlockNeverTombAchievement(object oPlayer){
    if(GetIsPC(oPlayer) && GetLocalInt(oPlayer, "ach_never_tomb") != 1){
        SendMessageToPC(oPlayer, "Neverwinter Tomb Raider unlocked!");
        UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQBA"); //Neverwinter Tomb Raider
        SetLocalInt(oPlayer, "ach_never_tomb", 1);
    }
}

void UnfairSwordsAchievement(object oPlayer, int iLevel){
    int iCount;
    int iPCLevel;

    if(GetIsPC(oPlayer)){
        iCount = GetLocalInt(GetModule(), "blake_flying_swords");
        iPCLevel = GetTotalLevels(oPlayer);
        if(iCount >= 4 && iPCLevel <=iLevel && GetLocalInt(oPlayer, "ach_unfair_swords") != 1){
            SendMessageToPC(oPlayer, "These Swords Are Poorly Balanced unlocked!");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQAw"); //These Swords are poorly Balanced
            SetLocalInt(oPlayer, "ach_unfair_swords", 1);
        }
    }
}

//COMPLETE
int CheckDemonStatus(object oPlayer){
    int iDemon = FALSE;
    if(GetIsPC(oPlayer)){
        //IF LET GO or whatever unlock
    }

    return iDemon;
}


void AribethFateAchievement(object oPlayer, int iFate){
    if(GetIsPC(oPlayer)){
        if(iFate == 10 && GetLocalInt(oPlayer, "ach_aribeth_alive") != 1){
            SendMessageToPC(oPlayer, "Aribeth alive!");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQFg"); //A Paladin's Penance
            SetLocalInt(oPlayer, "ach_aribeth_alive", 1);
        }

        if(iFate == 11 && GetLocalInt(oPlayer, "ach_aribeth_dead") != 1){
            SendMessageToPC(oPlayer, "Aribeth dead :(");
            UnlockAchievement(oPlayer, "CgkIoOjyva8PEAIQFg"); //A Paladin Perishes
            SetLocalInt(oPlayer, "ach_aribeth_dead", 1);
        }
    }
}

void main()
{
    object oPlayer = GetEnteringObject();
    CheckAchievements(oPlayer, GetModule());
}
