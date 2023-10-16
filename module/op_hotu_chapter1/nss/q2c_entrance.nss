//::///////////////////////////////////////////////
//:: Name
//:: FileName q2c_entrance
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When the trigger is entered, have the PCs here
    the Drow guards that are up around the corner.

*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Nov 5/02
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC))
    {
        object oDrow = GetObjectByTag("q2b_drow1");
        object oDrow2 = GetObjectByTag("q2b_drow2");
        AssignCommand(oDrow, SpeakOneLinerConversation());
        AssignCommand(oDrow, ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL, 1.0, 10.0));
        AssignCommand(oDrow2, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN, 1.0, 10.0));
    }
}
