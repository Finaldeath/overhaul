//::///////////////////////////////////////////////
//:: North Urn disturbed
//:: q3af_urn_north
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if the yellow gem is in place
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////
#include "q_include"
void main()
{
    object oGem = GetObjectByTag("q3af_stn_yellow");
    if(oGem == GetInventoryDisturbItem())
    {
        DestroyObject(oGem);
        location lSelf = GetLocation(OBJECT_SELF);
        CreateObject(OBJECT_TYPE_PLACEABLE,"plc_magicyellow",lSelf);
        SetLocalInt(OBJECT_SELF,"Q3AF_GEM",1);
        CheckGemPuzzle();
    }
}
