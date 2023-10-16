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
//Have a shrub grow up in that spot.
//The shrub will later be replaced by a tree.
    object oDirt = GetObjectByTag("q1e_kai_dirt");
    SetLocalInt(GetFirstPC(), "OS_KAI_PLANT",30);
    CreateObject(OBJECT_TYPE_PLACEABLE,"q1e_kai_shrub",GetLocation(oDirt));
    DelayCommand(0.5,DestroyObject(oDirt));
}
