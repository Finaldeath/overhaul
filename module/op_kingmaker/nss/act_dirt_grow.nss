//::///////////////////////////////////////////////
//:: act_dirt_grow
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Kaidala's tree grows
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

void main()
{
    object oKai = GetObjectByTag("os_hen_kai");
    SetLocalInt(GetFirstPC(), "OS_KAI_PLANT",20);
    CreateObject(OBJECT_TYPE_PLACEABLE,"q1e_kai_shrub",GetLocation(OBJECT_SELF));
}
