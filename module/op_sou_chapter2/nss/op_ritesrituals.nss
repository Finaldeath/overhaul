//::///////////////////////////////////////////////
//:: Bookshelf Containing 'Rites & Rituals' (OnOpen)
//:: Op_RitesRituals.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Treat opening the container in the same way
     you treat acquiring the item (for those that
     examine it in the bookshelf).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: May 16, 2003
//:://////////////////////////////////////////////
#include "x0_i0_common"

///////////////////////////////////
//Henchman interjection functions//
///////////////////////////////////
void DoInterjection(object oHench, object oPC, int MOD_EVENT_NUMBER)
{
        AssignCommand(oHench, SetHasInterjection(oPC, TRUE, MOD_EVENT_NUMBER));
        AssignCommand(oHench, ClearAllActions());
        AssignCommand(oPC, ClearAllActions());
//        AssignCommand(oHench, ActionMoveToObject(oPC, TRUE, 6.0));
        AssignCommand(oHench, ActionStartConversation(oPC));
}
// * am I valid for doing an interjection
int ValidForInterjection(object oPC, object oHench)
{
    if (!IsInConversation(oPC)
        && GetDistanceBetweenLocations(GetLocation(oPC), GetLocation(oHench)) <= 20.0)
    {
        return TRUE;
    }
    return FALSE;
}
void CheckForInterjection(object oPC, int nEventNum, int bPopUpOnly = TRUE)
{
    // * choose which henchmen gets to interject

    object oDeekin = GetObjectByTag("x0_hen_dee");
    object oDorna = GetObjectByTag("x0_hen_dor");
    object oXanos = GetObjectByTag("x0_hen_xan");
    object oHench = OBJECT_INVALID;
    object oMaster = OBJECT_INVALID;

    if (GetIsObjectValid(oDeekin))
    {
        oMaster = GetMaster(oDeekin);
        if (GetIsObjectValid(oMaster))
        {
            oHench = oDeekin;
        }
    }
    if (GetIsObjectValid(oDorna))
    {
        oMaster = GetMaster(oDorna);
        if (GetIsObjectValid(oMaster))
        {
            oHench = oDorna;
        }
    }
    if (GetIsObjectValid(oXanos))
    {
        oMaster = GetMaster(oXanos);
        if (GetIsObjectValid(oMaster))
        {
            oHench = oXanos;
        }
    }

    //SpawnScriptDebugger();
    // The key tag of the trigger is the module event number
    int MOD_EVENT_NUMBER = nEventNum;

    string sHenchTag = GetTag(oHench);
    if (ValidForInterjection(oMaster, oHench) && ValidForInterjection(oHench, oMaster))
    {
        AssignCommand(oHench, SetOneLiner(TRUE, MOD_EVENT_NUMBER));
        //PopUp
        if (bPopUpOnly == TRUE)
        {
            AssignCommand(oHench, SpeakOneLinerConversation("", oMaster));
        }
        //Full Conversation
        else
        {
            AssignCommand(oHench, ActionStartConversation(oMaster, ""));
        }
    }
}


void main()
{
    //Set the local indicating that they know of the Three Winds.
    object oPC = GetLastOpenedBy();
    SetLocalInt(oPC, "bThreeWinds", TRUE);

    //Only add the journal entry once
    int bDoOnce = GetLocalInt(GetModule(), "TempleRitesbDoOnce");
    if (bDoOnce == FALSE)
    {
        //Handle any henchman interjections & pop-ups
        CheckForInterjection(oPC, 6, FALSE);
        //Add journal entry.
        AddJournalQuestEntry("Journ_Winds_10", 1, oPC, TRUE, TRUE);
        //Flag the DoOnce
        SetLocalInt(GetModule(), "TempleRitesbDoOnce", TRUE);
    }

    //Give the player XP if they haven't already received it.
    int bXP = GetLocalInt(oPC, "XP_Main_03");
    if (bXP == FALSE)
    {
        SetLocalInt(oPC, "XP_Main_03", TRUE);
        int iXP = FloatToInt(GetJournalQuestExperience("Journ_Main_End") * 0.06);
        GiveXPToCreature(oPC, iXP);
    }
}
