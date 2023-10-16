//::///////////////////////////////////////////////
//:: Name q2d2_ent_hallgd
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The Hall guard will speak to approaching PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 17/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;
    //Don't bother if they're hostile
    if (GetLocalInt(GetModule(), "X2_Q2DIllithidHostile") > 0)
        return;

    object oPC = GetEnteringObject();
    if (GetIsDM(oPC) == TRUE)
        return;
    if (GetIsPC(oPC) == FALSE)
        return;

    SetLocalInt(OBJECT_SELF, "nTriggered", 1);
    object oGuard = GetObjectByTag("q2d_ill_guard1");
    AssignCommand(oGuard, ActionStartConversation(oPC));

}
