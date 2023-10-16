//::///////////////////////////////////////////////
//:: North West Urn disturbed
//:: q3af_urn_nwest
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if the red gem is in place
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////
#include "q_include"
void main()
{
    object oGem = GetObjectByTag("q3af_stn_red");
    if(oGem == GetInventoryDisturbItem())
    {
        DestroyObject(oGem);
        location lSelf = GetLocation(OBJECT_SELF);
        CreateObject(OBJECT_TYPE_PLACEABLE,"plc_magicred",lSelf);
        SetLocalInt(OBJECT_SELF,"Q3AF_GEM",1);
        CheckGemPuzzle();
    }
}
