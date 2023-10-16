//::///////////////////////////////////////////////
//:: Name q2b_ent_intwptrg
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Intelligent weapon talks with PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Oct 9/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;

    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    SetLocalInt(OBJECT_SELF, "nTriggered", 1);
    object oSword = GetObjectByTag("q2b_intweap_dialog");

    AssignCommand(oSword, ActionStartConversation(oPC, "x2_iw_start"));
}
