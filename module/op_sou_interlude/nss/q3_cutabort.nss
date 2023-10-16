//::///////////////////////////////////////////////
//:: Name  q1_cutabort
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    portal cutscene, part II: jump players and drogan near the portal and drogan
    should init dialog.
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 124/3/2003
//:://////////////////////////////////////////////
#include "nw_i0_tool"
#include "x1_inc_cutscene"
#include "nw_i0_generic"

void RemoveEffects(object oCreature)
{
    effect eEff1 = GetFirstEffect(oCreature);
    while(GetIsEffectValid(eEff1))
    {
        RemoveEffect(oCreature, eEff1);
        eEff1 = GetNextEffect(oCreature);
    }
}

void main()
{
    object oWP = GetWaypointByTag("Q3B_WP_MOVE_TO_PORTAL");
    object oWP2 = GetWaypointByTag("Q3B_WP_MOVE_TO_PORTAL2");
    object oDrogan = GetObjectByTag("Q3B_DROGAN");
    SetLocalInt(oDrogan, "Q2B_CASTING", 0);
    SetLocalInt(oDrogan, "DIALOG_STATUS", 5);
    SetCommandable(TRUE, oDrogan);
    AssignCommand(oDrogan, ClearAllActions());
    AssignCommand(oDrogan, JumpToObject(oWP));


    object oPC = GetFirstPC();
    while (oPC != OBJECT_INVALID)
    {
        object oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);
        UnFreezeAssociate(oPC);
        CutRestoreLocation(3, 0.5, oPC);
        CutRemoveEffects(3, 0.5, oPC);
        CutSetCutsceneMode(3, 0.5, oPC, FALSE);
        if (GetLocalInt(oPC, "nCutsceneNumber") == 3)
        {
            CutSetCamera(3, 0.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 30.0, 50.0,
                     CAMERA_TRANSITION_TYPE_SNAP);
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(oPC, JumpToObject(oWP2));
            AssignCommand(oHenchman, JumpToObject(oWP2));
        }

        oPC = GetNextPC();
    }

    object oPlayers = GetFirstPC();
    while (oPlayers != OBJECT_INVALID)
    {
        if (GetLocalInt(oPlayers, "nCutsceneNumber") == 3)
        {
            if(GetLocalInt(oPlayers, "nCUT3MAINPC") == 1)
                DelayCommand(1.0, AssignCommand(oDrogan, ActionStartConversation(oPlayers)));

            DelayCommand(1.0, SetCutsceneMode(oPlayers, FALSE));
            DelayCommand(1.0, SetCommandable(TRUE, oPlayers));
            DelayCommand(1.0, RemoveEffects(oPlayers));
            DelayCommand(1.5, SetLocalInt(oPlayers, "nCutsceneNumber", 0));
        }
        oPlayers = GetNextPC();
    }

    SetLocalInt(GetModule(), "X1_CUT3RUNNING", 2); // change cutscene status

}

