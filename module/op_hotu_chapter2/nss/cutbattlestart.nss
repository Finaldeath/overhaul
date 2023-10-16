//::///////////////////////////////////////////////
//:: Name cutbattlestart
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Do the cutscene of the Matron's army arriving in
    vast numbers.
    Then set the battle variables (if any)
    and spawn in waves of attackers.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 19/03
//:://////////////////////////////////////////////

void main()
{
    //only run this script once (could be done once regularly - or could be jumped up through talking to the wisp)
    if (GetLocalInt(OBJECT_SELF, "nPCJumpedToFirstCut") == 1)
        return;
    SetLocalInt(OBJECT_SELF, "nPCJumpedToFirstCut", 1);

    //if the PC has already betrayed the rebels - do not do this cutscene
    if (GetLocalInt(GetModule(), "X2_Q2ARebelsBetrayed") == 1)
        return;
    //SendMessageToPC(GetFirstPC(), "In Script");

    object oHerald = GetObjectByTag("q2aherald");
    object oPC = GetLocalObject(oHerald, "oLeader");

    //SendMessageToPC(GetFirstPC(), GetTag(OBJECT_SELF));
    //do the Cutscene here.

    //object oPC = GetLocalObject(OBJECT_SELF, "oPCForCut101");
    //SendMessageToPC(GetFirstPC(), GetName(oPC));

    SetLocalLocation(oPC, "X2_Q2ABattle1StartLoc", GetLocation(oPC));
    object oTarget = GetWaypointByTag("cut101wp_camera1");
    AssignCommand(oPC, JumpToObject(oTarget));
    //ExecuteScript("cut_battle1_101", oPC);
}


