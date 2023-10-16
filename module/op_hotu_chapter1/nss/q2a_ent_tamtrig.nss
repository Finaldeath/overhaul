//::///////////////////////////////////////////////
//:: Name q2a_ent_tamtrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    IF Tamsil has already spoken to the PC, do nothing,
    otherwise, have her try to init conversation
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 24/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTamsilTalked") == 1)
        return;

    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    object oTamsil = GetObjectByTag("Tamsil");

    AssignCommand(oTamsil, ClearAllActions());
    AssignCommand(oTamsil, ActionStartConversation(oPC, "pre_tamsil"));

}
