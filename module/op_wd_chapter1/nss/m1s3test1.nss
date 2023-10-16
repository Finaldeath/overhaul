//::///////////////////////////////////////////////
//:: Conversation
//:: m1s3Test1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Eltoora transports the PC to the first test.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 1, 2001
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(),"NW_G_M1S3Test",1);
    AssignCommand(GetLastSpeaker(),JumpToLocation(GetLocation(GetWaypointByTag("M1S3TESTENTER"))));
    CreateObject(OBJECT_TYPE_CREATURE,"M1S03CTESTGOLEM1",GetLocation(GetWaypointByTag("M1S3CHALLENGER")));
}
