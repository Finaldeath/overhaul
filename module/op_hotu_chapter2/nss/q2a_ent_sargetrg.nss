//::///////////////////////////////////////////////
//:: Name  q2a_ent_sargetrg
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Seargeant Ossyr inits conversation with the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Oct 2/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    SetLocalInt(OBJECT_SELF, "nTriggered", 1);
    object oSarge = GetObjectByTag("q2a_prebat_sgt");
    AssignCommand(oSarge, ActionStartConversation(oPC));

}
