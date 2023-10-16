//::///////////////////////////////////////////////
//:: Name  q2e_act_ddoor
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When openned, this door will give the PC the
    choice of transporting to the last place he died.
    This door will destroy itself if that option is
    not taken...
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
    string szTag = "con_hod_ddoor";

    AssignCommand(oDoor, ActionStartConversation(oPC, szTag));


}

