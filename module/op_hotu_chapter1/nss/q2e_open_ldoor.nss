//::///////////////////////////////////////////////
//:: Name  q2e_open_ldoor
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When openned, this door will give the PC the
    choice of transporting to the party leader...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 16/03
//:://////////////////////////////////////////////

void main ()
{
    object oPC = GetLastUsedBy();
    object oDoor = OBJECT_SELF;
    //Open the new door
    AssignCommand(oDoor, ActionPlayAnimation(ANIMATION_PLACEABLE_OPEN));
    //Start the dialog with the PC that used the door
    string szTag = "con_hod_ldoor";

    AssignCommand(oDoor, ActionStartConversation(oPC, szTag));

}

