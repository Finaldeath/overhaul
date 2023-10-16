//::///////////////////////////////////////////////
//:: Name q5_trig_klumpcon
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Have Klumph initiate conversation with
    the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: May 5/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE && GetLocalInt(OBJECT_SELF, "nTriggered") != 1)
    {
        object oKlumph = GetObjectByTag("Q5_KLUMPH");
        AssignCommand(oKlumph, ActionStartConversation(oPC));
    }
}
