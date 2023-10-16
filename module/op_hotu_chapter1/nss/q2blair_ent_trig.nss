//::///////////////////////////////////////////////
//:: Name   q2blair_ent_trig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Tellaster will initiate dialog with any PC
    crossing the trigger
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Nov 18/02
//:://////////////////////////////////////////////


void main()
{
    object oTellaster = GetObjectByTag("q2b05tellaster");
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) && GetLocalInt(OBJECT_SELF, "nUsed") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nUsed", 1);
        AssignCommand(oTellaster, ActionStartConversation(oPC));
    }
}
