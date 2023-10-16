//::///////////////////////////////////////////////
//:: PC has Magic Shoes
//:: con_grd_hasshoes
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has the Gord's magic shoes
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"OS_THEGORD_SHOES")==99;
    return iResult;
}
