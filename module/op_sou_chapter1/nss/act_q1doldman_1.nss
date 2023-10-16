//::///////////////////////////////////////////////
//:: Name act_q1doldman_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The old man has been robbed by the PC and
    will head for the exit...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 19/03
//:://////////////////////////////////////////////

void main()
{
    object oExit = GetWaypointByTag("wp_q1d_exit");
    GiveGoldToCreature(GetPCSpeaker(), 7);
    ActionMoveToObject(oExit);
    SetCommandable(FALSE);
}
