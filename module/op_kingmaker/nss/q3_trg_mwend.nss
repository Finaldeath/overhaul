//::///////////////////////////////////////////////
//:: q3_trg_pcend
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sends the PC dialog with the Magic Weapon
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

#include "inc_remeffect"

void DoFinalDlg();

void main()
{
    effect eDeath = EffectDeath();
    object oIllithid = GetObjectByTag("q3_illithid");
    object oIntelDev1 = GetNearestObjectByTag("Q3_FINALFGT_INTELDEV", oIllithid, 1);
    object oIntelDev2 = GetNearestObjectByTag("Q3_FINALFGT_INTELDEV", oIllithid, 2);

    int iIllithidDead = GetLocalInt(GetModule(), "iIllithidDead");

    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, oIntelDev1);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, oIntelDev2);

    if(((GetIsDead(oIllithid) == TRUE) || (oIllithid == OBJECT_INVALID))
        && (iIllithidDead == FALSE))
    {
        SetLocalInt(GetModule(), "iIllithidDead", TRUE);
        AssignCommand(GetModule(), DoFinalDlg());
    }

}

void DoFinalDlg()
{
    object oPC = GetFirstPC();
    object oWay1 = GetWaypointByTag("q3_way_pc");
    object oWay2 = GetWaypointByTag("q3_way_grandpa");
    object oMW = CreateObject(OBJECT_TYPE_PLACEABLE,
        "q3ai_mw_intro", GetLocation(oWay2));

    object oDoor = GetObjectByTag("q3_illithiddr");

    RemovePoly(oPC);

    SetLocalInt(oMW, "OS_MW_REVEAL", FALSE);
    SetLocalInt(oMW, "OS_MW_FINAL", 1);
    SetLocalInt(GetModule(), "OS_MW_FINAL", 1);
    SetLocalInt(oPC, "OS_MOMMA_END", 1);

    AssignCommand(oPC, SetCutsceneMode(oPC, TRUE));
    AssignCommand(oPC, ClearAllActions(TRUE));
    AssignCommand(oDoor, SetLocked(OBJECT_SELF, FALSE));

    DelayCommand(0.5f, AssignCommand(oPC, ActionForceMoveToObject(oMW, TRUE, 0.0f, 4.0f)));
    DelayCommand(0.5f, AssignCommand(oPC, SetCameraFacing(110.0, 9.0, 80.0,
        CAMERA_TRANSITION_TYPE_MEDIUM)));
    DelayCommand(3.5, AssignCommand(oPC, ClearAllActions(TRUE)));
    DelayCommand(4.0, AssignCommand(oMW, ActionStartConversation(oPC)));

    //AssignCommand(oPC, DelayCommand(4.2, SetCommandable(TRUE, oPC)));
}
