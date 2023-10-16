//::///////////////////////////////////////////////
//:: OnFailToOpen
//:: q3ac_door_onfail
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Conversation starts when the door fails to open
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    int nNumber = GetLocalInt(oPC,"OS_Q3C_DOOR");

    // Debug text? this has been removed...
    //FloatingTextStringOnCreature(IntToString(nNumber),oPC);

    AssignCommand(oPC,ClearAllActions(TRUE));
    DelayCommand(0.5,ActionStartConversation(oPC));
}
