//::///////////////////////////////////////////////
//:: Name q5_trig_chiefcon
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Have Chief Arzig initiate conversation with
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
        SetLocalInt(OBJECT_SELF, "nTriggered", 1);
        object oKobold = GetObjectByTag("Q5_KOBOLD_CHIEFTAIN");
        AssignCommand(oKobold, ActionStartConversation(oPC));

    }
}
