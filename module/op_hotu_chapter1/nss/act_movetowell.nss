//::///////////////////////////////////////////////
//:: Name act_movetowell
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Teleports PC to Well room in Yawning Portal
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Sept.12/2002
//:://////////////////////////////////////////////
void main()
{
    object oBell = GetObjectByTag("q2adurnan");
    AssignCommand(oBell, PlaySound("as_cv_bell1"));
    object oPC = GetPCSpeaker();
    object oMoveToWell = GetObjectByTag("wp_q2awelljump");
    AssignCommand (oPC,ActionJumpToObject(oMoveToWell,0));

   //object oWell = GetObjectByTag("welldoor");
   //object oWellLever = GetObjectByTag("welllever");

   //AssignCommand(oWellLever,ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));
   //DelayCommand(1.0, AssignCommand(oWell, ActionOpenDoor(oWell)));
}

