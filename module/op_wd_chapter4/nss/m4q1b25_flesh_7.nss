//::///////////////////////////////////////////////
//:: M4Q1B25_flesh_7
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
    if(!GetIsObjectValid(GetObjectByTag("M4Q01B26MAUG"))
        && GetLocalInt(GetModule(),"NW_G_M4Q1_FLESHDEAD")==1
        && !GetIsObjectValid(GetObjectByTag("M4Q1B26")))
    {
        location lWay = GetLocation(GetObjectByTag("M4Q1B26_Chest"));
        CreateObject(OBJECT_TYPE_PLACEABLE,"M4Q1B26",lWay);
    }
    else
    {
        SetLocalInt(GetModule(),"NW_G_M4Q1_FLESHDEAD",1);
    }
}
