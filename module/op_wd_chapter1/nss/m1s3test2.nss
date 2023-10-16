//::///////////////////////////////////////////////
//:: Conversation
//:: m1s3Test2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Eltoora transports the PC to the second test.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 1, 2001
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(),"NW_G_M1S3Test",2);
    DestroyObject(GetItemPossessedBy(GetLastSpeaker(),"M1S03ICTBADGE01"));
    AssignCommand(GetPCSpeaker(),JumpToLocation(GetLocation(GetWaypointByTag("M1S3TESTENTER"))));
    CreateObject(OBJECT_TYPE_CREATURE,"M1S03CTESTGOLEM2",GetLocation(GetWaypointByTag("M1S3CHALLENGER")));
}
