//::///////////////////////////////////////////////
//:: Activate Lord's Alliance Ambush
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(GetArea(OBJECT_SELF), "NW_G_M3Q2C03SPAWN_ONCE") == 0)
    {
        SetLocalInt(GetArea(OBJECT_SELF), "NW_G_M3Q2C03SPAWN_ONCE",1);
        DelayCommand(2.5, SetEncounterActive(TRUE, GetObjectByTag("M3Q2C03SPAWN")));
    }
}
