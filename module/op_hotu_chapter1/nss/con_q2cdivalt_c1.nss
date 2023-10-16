//::///////////////////////////////////////////////
//:: Name: con_q2cdivalt_c1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    After the aparition from the divinity altar
    has appeared once, it will not appear again.
*/
//:://////////////////////////////////////////////
//:: Created By:    Keith Warner
//:: Created On:    Dec 10/02
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X2_nDivinityAltarOff") == 1)
        return TRUE;
    return FALSE;
}
