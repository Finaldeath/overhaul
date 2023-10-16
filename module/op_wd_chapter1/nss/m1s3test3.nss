//::///////////////////////////////////////////////
//:: Conversation
//:: m1s3Test3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Eltoora transports the PC to the third test.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 1, 2001
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(),"NW_G_M1S3Test",3);
    DestroyObject(GetItemPossessedBy(GetLastSpeaker(),"M1S03ICTBADGE02"));
    AssignCommand(GetPCSpeaker(),JumpToLocation(GetLocation(GetWaypointByTag("M1S3TESTENTER"))));
    CreateObject(OBJECT_TYPE_CREATURE,"M1S03CTESTGOLEM3",GetLocation(GetWaypointByTag("M1S3CHALLENGER")));
}
