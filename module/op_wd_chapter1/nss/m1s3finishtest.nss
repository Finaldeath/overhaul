//::///////////////////////////////////////////////
//:: Conversation
//:: m1s3FinishTest
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The portal transports you back to the entrance.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 1, 2001
//:://////////////////////////////////////////////

void main()
{
    object oChallenger = GetLastUsedBy();
    AssignCommand(oChallenger,JumpToLocation(GetLocation(GetWaypointByTag("WP_M1S3TESTEXIT"))));
}
