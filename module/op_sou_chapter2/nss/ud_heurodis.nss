//::///////////////////////////////////////////////
//:: Heurodis (User-Defined)
//:: UD_Heurodis.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     End the game on Heurodis' death.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 21, 2003
//:://////////////////////////////////////////////
#include "achievement_lib"

void FreezeAllPCs();

void main()
{
    int iUDNum = GetUserDefinedEventNumber();

    //User-Defined OnSpawn (100)
    if (iUDNum == 100)
    {

    }

    //User-Defined OnHeartbeat (1001)
    if (iUDNum == 1001)
    {
        /*
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        if (oPC != OBJECT_INVALID)
        {
            if (GetCurrentHitPoints(OBJECT_SELF) > 10)
            {
                //Play conjure animation until combat starts.
                int bInCombat = GetIsInCombat(OBJECT_SELF);
                int bStop = GetLocalInt(OBJECT_SELF, "bStopAnimation");
                if (bInCombat == FALSE && bStop == FALSE)
                {
                    PlayAnimation(ANIMATION_LOOPING_CONJURE2, 1.0, 7.0);
                    PlayVoiceChat(VOICE_CHAT_GATTACK1, OBJECT_SELF);
                }
                if (bInCombat == TRUE && bStop == FALSE)
                {
                    SetLocalInt(OBJECT_SELF, "bStopAnimation", TRUE);
                }
            }
        }
        */
    }

    //User-Defined OnPerceive (1002)
    if (iUDNum == 1002)
    {

    }

    //User-Defined OnAttacked (1005)
    if (iUDNum == 1005)
    {

    }

    //User-Defined OnDamaged (1006)
    if (iUDNum == 1006)
    {

    }

    //User-Defined OnDeath (1007)
    if (iUDNum == 1007)
    {
        object oArea = GetArea(OBJECT_SELF);
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);

        PlotAchievement(oPC, 5);
        DifficultyAchievements(oPC, OBJECT_SELF, GetGameDifficulty());

        SetLocalInt(oPC, "X1_Cut30KilledHeurodis", 1);
        //Add final journal entry
        AddJournalQuestEntry("Journ_Main_End", 1, oPC, TRUE, TRUE);

        //Remove all other entries in this series.
        RemoveJournalQuestEntry("Journ_Main_10", oPC, TRUE, TRUE);
        RemoveJournalQuestEntry("Journ_Main_20", oPC, TRUE, TRUE);
        RemoveJournalQuestEntry("Journ_Main_30", oPC, TRUE, TRUE);
        RemoveJournalQuestEntry("Journ_Main_40", oPC, TRUE, TRUE);
        //Stop the voice chat from Heurodis
        SetLocalInt(OBJECT_SELF, "bStopAnimation", TRUE);
        //Put all PCs in cutscene mode
        FreezeAllPCs();
        //Start Final Cutscene Mode
        DelayCommand(5.0, ExecuteScript("x1_startcut30", oPC));

    }

    //User-Defined OnDisturbed (1008)
    if (iUDNum == 1008)
    {

    }

    //User-Defined OnCombatRoundEnd (1003)
    if (iUDNum == 1003)
    {

    }

    //User-Defined OnDialog (1004)
    if (iUDNum == 1004)
    {

    }

    return;
}

void FreezeAllPCs()
{
    object oPC = GetFirstPC();
    while (oPC != OBJECT_INVALID)
    {
        SetCutsceneMode(oPC, TRUE);
        //AssignCommand(oPC, PlaySound("vs_nx0heurf_dead"));
        AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY3));
        AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1));
        oPC = GetNextPC();
    }
}

