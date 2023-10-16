//::///////////////////////////////////////////////
//:: act_mir_through
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Moves the player to another area.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastUsedBy();
    if(GetTag(OBJECT_SELF)=="q2_office_mirror")
    {
        object oWay = GetObjectByTag("q2_way_mirrguild");
        AssignCommand(oPC,ActionJumpToObject(oWay));
    }
    else if(GetTag(OBJECT_SELF)=="q2_guild_mirror")
    {
        object oWay = GetObjectByTag("q2_map_mageoff");
        AssignCommand(oPC,ActionJumpToObject(oWay));
    }
}
