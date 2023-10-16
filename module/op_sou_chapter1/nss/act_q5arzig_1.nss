//::///////////////////////////////////////////////
//:: Name act_q5arzig_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Guards will fetch the master jumper so
    he can be questioned by the chief
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 24/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oJumpTo = GetWaypointByTag("wp_q5masterjump_ent");
    object oWalkTo = GetWaypointByTag("wp_q5masterjump_post");
    object oGuard = GetObjectByTag("q5_arzigguard_1");
    object oMaster = GetObjectByTag("Q5_KLUMPH");
    object oJailDoor = GetObjectByTag("q5_jail_door");

    //Unlock and open jail door
    SetLocked(oJailDoor, FALSE);
    AssignCommand(oJailDoor, ActionOpenDoor(oJailDoor));
    //Guard will run to the door and return with Klumph
    ActionPauseConversation();
    AssignCommand(oPC, PlaySound("as_cv_gongring2"));
    AssignCommand(oGuard, ActionMoveToObject(oJumpTo, TRUE, 2.0));
    DelayCommand(3.0, AssignCommand(oMaster, JumpToObject(oJumpTo)));
    DelayCommand(5.0, AssignCommand(oGuard, ActionForceMoveToObject(oWalkTo, TRUE, 3.0, 5.0)));
    DelayCommand(5.0, AssignCommand(oMaster, ActionForceMoveToObject(oWalkTo, TRUE, 0.0, 5.0)));
    DelayCommand(10.0, ActionResumeConversation());
}
