//::///////////////////////////////////////////////
//:: South East Urn disturbed
//:: q3af_urn_seast
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if the blue gem is in place
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////
#include "q_include"
void main()
{
    object oGem = GetObjectByTag("q3af_stn_blue");
    if(oGem == GetInventoryDisturbItem())
    {
        DestroyObject(oGem);
        location lSelf = GetLocation(OBJECT_SELF);
        CreateObject(OBJECT_TYPE_PLACEABLE,"plc_magicblue",lSelf);
        SetLocalInt(OBJECT_SELF,"Q3AF_GEM",1);
        CheckGemPuzzle();
    }
}
