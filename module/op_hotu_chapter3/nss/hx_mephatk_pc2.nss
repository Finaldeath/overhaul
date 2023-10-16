//::///////////////////////////////////////////////
//:: Uber Attack on End of Conversation
//:: NW_D1_AttOnEndPL
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script makes an NPC attack the person
    they are currently talking with.
    - Turns Plot Flag off temporarily to allow hostility
    - Adjust both global and personal reputation
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: January 2002
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"
#include "x2_inc_cutscene"
#include "nw_i0_plot"
void main()
{
    object oPC = GetPCSpeaker();
    object oDurnan = GetObjectByTag("hx_end_fight_durnan");
    DestroyObject(oDurnan);

    if(GetLocalInt(GetModule(), "HX_HAD_TO_SET_CAMERA") == TRUE)
    {
        SetLocalInt(GetModule(), "HX_HAD_TO_SET_CAMERA", FALSE);
        DelayCommand(0.5, RestoreCameraFacing());
    }

    // * If GetPCSpeaker is invalid, then try last talker
    if (GetIsObjectValid(oPC) == FALSE)
    {
        oPC = GetLastSpeaker();
    }
    //SetPlotFlag(OBJECT_SELF, FALSE);
    //SetIsTemporaryEnemy(oPC);
    ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE);
    AdjustReputation(oPC, OBJECT_SELF, -100);
    //SetPlotFlag(OBJECT_SELF, TRUE);
    DetermineCombatRound(oPC);

    //Add journal entry.
    AddJournalQuestEntry("XP2_Name_Mephisto", 50, oPC, TRUE, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 173;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }

    //Set variable indicating that he's been commanded by his True Name to fight.
    SetLocalInt(GetModule(), "bMephCommandedToFight", TRUE);
    CutDisableCutscene(300, 0.0, 0.0, RESTORE_TYPE_NONE);
}
