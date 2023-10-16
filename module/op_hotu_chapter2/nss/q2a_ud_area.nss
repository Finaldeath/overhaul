//::///////////////////////////////////////////////
//:: Name q2a_ud_area
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see if the Drow have captured all the
    battle hotspots for Battle 1.
    If so - Do surrender cutscene
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 19/03
//:://////////////////////////////////////////////
#include "q2_inc_battle"
#include "nw_i0_plot"

void Battle1_CheckForDrowVictory();
void JumpPCToBattle2();

void main()
{
    int nUser = GetUserDefinedEventNumber();
    if (nUser == HOTSPOT_CHECK)
    {
        //SendMessageToPC(GetFirstPC(), "Check for Drow Victory");
        Battle1_CheckForDrowVictory();
    }
    else if (nUser == BATTLE1_DROW_VICTORY)
    {
        //SendMessageToPC(GetFirstPC(), "Drow are VICTORIOUS");
        if (GetLocalInt(OBJECT_SELF, "nBattle1Lost") == 1)
            return;
        SetLocalInt(OBJECT_SELF, "nBattle1Lost", 1);
        object oHerald = GetObjectByTag("q2aherald");
        AssignCommand(oHerald, PlaySpeakSoundByStrRef(85753));//"The Valsharess is victorious here."
        DelayCommand(2.0, AssignCommand(oHerald, PlaySpeakSoundByStrRef(85754)));//"We must fall back."
        SetLocalInt(oHerald, "X2_Q2ABattle1Lost", 1);
        object oHeraldStart = GetWaypointByTag("wp_q2abattle2_herald_lossstart");

        DelayCommand(4.0, AssignCommand(oHerald, JumpToObject(oHeraldStart)));

        DelayCommand(4.5, JumpPCToBattle2());



        //End Battle Variables
        SetLocalInt(GetModule(), "X2_Q2ABattle1Started", 2);
    }
}

void Battle1_CheckForDrowVictory()
{
    object oHotspot1 = GetObjectByTag("q2a_bat1_hsforge");
    object oHotspot2 = GetObjectByTag("q2a_bat1_hscat");
    int bDrowInHotspot1 = FALSE;
    int bDrowInHotspot2 = FALSE;
    int bRebInHotspot1 = FALSE;
    int bRebInHotspot2 = FALSE;

    //Check Hotspot 1
    object oDrow1 = GetFirstInPersistentObject(oHotspot1);
    while (oDrow1 != OBJECT_INVALID)
    {
        if (GetStringLeft(GetTag(oDrow1), 9) == "x2_q2drow")
        {
            bDrowInHotspot1 = TRUE;
        }
        else
        {
            bRebInHotspot1 = TRUE;
        }
        oDrow1 = GetNextInPersistentObject(oHotspot1);
    }
    //Check Hotspot 2
    object oDrow2 = GetFirstInPersistentObject(oHotspot1);
    while (oDrow2 != OBJECT_INVALID)
    {
        if (GetStringLeft(GetTag(oDrow2), 9) == "x2_q2drow")
        {
            bDrowInHotspot2 = TRUE;
        }
        else
        {
            bRebInHotspot2 = TRUE;
        }
        oDrow2 = GetNextInPersistentObject(oHotspot1);
    }
    object oPC = GetFirstPC();
    //SendMessageToPC(oPC, "DrowHOTSPOT1 = " + IntToString(bDrowInHotspot1) +
    //                     "RebHOTSPOT1 = " + IntToString(bRebInHotspot1) +
    //                     "DrowHOTSPOT2 = " + IntToString(bDrowInHotspot2) +
    //                     "RebHOTSPOT2 = " + IntToString(bRebInHotspot2));
    //If there are drow in a hotspot with no rebels - then the drow have captured the hotspot
    if (bDrowInHotspot1 == TRUE && bRebInHotspot1 == FALSE && bDrowInHotspot2 == TRUE && bRebInHotspot2 == FALSE)
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(BATTLE1_DROW_VICTORY));
    }
}

void JumpPCToBattle2()
{
    object oTarget = GetWaypointByTag("wp_q2abattle2_lossstart");
    object oPC = GetFirstPC();
    while (oPC != OBJECT_INVALID)
    {
        SetLocalInt(oPC, "X2_Q2ABattle1Lost", 1);
        AssignCommand(oPC, ClearAllActions(TRUE));
        DelayCommand(0.25, AssignCommand(oPC, JumpToObject(oTarget)));
        oPC = GetNextPC();
    }
}
