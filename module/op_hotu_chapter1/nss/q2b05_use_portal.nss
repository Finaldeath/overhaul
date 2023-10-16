//::///////////////////////////////////////////////
//:: q2b05_use_portal
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Portal that teleports PC and his associates back to the Throne
    of Bone room (q2b04)


*/
//:://////////////////////////////////////////////
//:: Created By: Keith W
//:: Created On: September 23/02
//:://////////////////////////////////////////////


void main()
{
    //Get the PC and any possible associates
    object oPC = GetLastUsedBy();
    object oHenchman = GetHenchman(oPC);
    object oFamiliar   = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    object oSummoned   = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC);
    object oAnimal     = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
    object oDominated  = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC);

    //Jump the PC to the Throne of Bone waypoint
    AssignCommand(oPC, ActionJumpToObject(GetWaypointByTag("wp_q2b04_throne")));

    //If there are any valid associates, jump them to the same spot as the PC.
    if (oHenchman != OBJECT_INVALID)
    {
        AssignCommand(oHenchman, ActionJumpToObject(GetWaypointByTag("wp_q2b04_throne")));
    }
    if (oFamiliar != OBJECT_INVALID)
    {
        AssignCommand(oFamiliar, ActionJumpToObject(GetWaypointByTag("wp_q2b04_throne")));
    }
    if (oSummoned != OBJECT_INVALID)
    {
        AssignCommand(oSummoned, ActionJumpToObject(GetWaypointByTag("wp_q2b04_throne")));
    }
    if (oAnimal != OBJECT_INVALID)
    {
        AssignCommand(oAnimal, ActionJumpToObject(GetWaypointByTag("wp_q2b04_throne")));
    }
    if (oDominated != OBJECT_INVALID)
    {
        AssignCommand(oDominated, ActionJumpToObject(GetWaypointByTag("wp_q2b04_throne")));
    }
}

