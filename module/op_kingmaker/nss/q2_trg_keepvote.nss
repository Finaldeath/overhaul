//::///////////////////////////////////////////////
//:: Vote Started
//:: q2_trg_keepvote
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the Keep vote has been started
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
    object oLamp = GetObjectByTag("q2_lamplighter");
    object oPC = GetFirstPC();

    object oBeck = GetObjectByTag("q2_sirbecket");
    object oBecWay = GetObjectByTag("q2c25_way_beccas");

    object oEnivid = GetObjectByTag("q2_enivid");
    object oEniWay = GetObjectByTag("vt_way_enivid");

    if(GetEnteringObject()==oPC
        && GetLocalInt(oPC,"OS_START_VOTE")==10)
    {
        BlackScreen(oPC);
        SetCutsceneMode(oPC, TRUE);

        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oLamp, ActionStartConversation(oPC));
        AssignCommand(oBeck, ActionJumpToObject(oBecWay));
        AssignCommand(oEnivid, ActionForceMoveToObject(oEniWay, TRUE, 0.0f, 5.0f));

        DelayCommand(1.0f, AssignCommand(oPC, SetCameraFacing(225.0f, 12.0f, 70.0f)));
        DelayCommand(1.5f, FadeFromBlack(oPC));
    }
}
