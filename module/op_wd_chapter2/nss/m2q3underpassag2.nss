//::///////////////////////////////////////////////
//:: Conversation
//:: m2q3UnderPassag2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC is transported to the other side of
    the underwater passage.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 19, 2001
//:://////////////////////////////////////////////

void main()
{
    PlaySound("fs_water_hard2");
    AssignCommand(GetPCSpeaker(),JumpToObject(GetWaypointByTag("WP_M2Q3B07PASSAGE02")));
}
