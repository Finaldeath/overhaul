//::///////////////////////////////////////////////
//:: M4Q1B25_MAUG_7
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Spawns chest if not already
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    May 2002
//:://////////////////////////////////////////////

void main()
{
    if(!GetIsObjectValid(GetObjectByTag("M4Q1B26Servant"))
        && !GetIsObjectValid(GetObjectByTag("M4Q1B26")))
    {
        location lWay = GetLocation(GetObjectByTag("M4Q1B26_Chest"));
        CreateObject(OBJECT_TYPE_PLACEABLE,"M4Q1B26",lWay);
    }
}
