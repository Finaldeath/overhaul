//::///////////////////////////////////////////////
//:: M2Q2E_FIGHT2.NSS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Teleports the player to the third circle of the druid challenge
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: February 6, 2002
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF,"NW_M2Q2E_LFIGHT",TRUE);
    SetLocalInt(GetPCSpeaker(),"NW_M2Q2E_LKILLED",5);
    CreateObject(OBJECT_TYPE_CREATURE,"M2Q2EHENNAFT",GetLocation(GetWaypointByTag("WP_M2Q2E2_NPC")));
    CreateObject(OBJECT_TYPE_CREATURE,"M2Q2EHENNAFTPET",GetLocation(GetWaypointByTag("WP_M2Q2E2_PET")));
    AssignCommand(GetLastSpeaker(),JumpToLocation(GetLocation(GetWaypointByTag("WP_M2Q2E2_PC"))));
}

