//::///////////////////////////////////////////////
//:: Name act_q1doldman_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The old man will head for the exit...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 19/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();

    ClearAllActions();
    ActionDoCommand(SetFacingPoint(GetPosition(oPC)));
    ActionPlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL, 0.7, 3.0);

    object oExit = GetWaypointByTag("wp_q1d_exit");
    ActionDoCommand(SetFacingPoint(GetPosition(oExit)));
    ActionPlayAnimation(ANIMATION_FIREFORGET_DRINK);
    ActionMoveToObject(oExit);
    SetCommandable(FALSE);
}
