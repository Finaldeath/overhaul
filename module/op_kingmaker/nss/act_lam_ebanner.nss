//::///////////////////////////////////////////////
//:: Enivid Banner
//:: act_lam_ebanner
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC chooses Enivid as his Banner
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    object oBeck = GetObjectByTag("q2_sirbecket");
    if(GetLocalInt(oBeck,"OS_BECKET_BANNER")==10)
    {
        SetLocalInt(oBeck,"OS_BECKET_BANNER",99);
    }
    SetLocalInt(oPC,"OS_BANNER",20);
}
