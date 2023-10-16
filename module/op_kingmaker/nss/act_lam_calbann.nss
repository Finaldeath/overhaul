//::///////////////////////////////////////////////
//:: Calibast Banner
//:: act_lam_calbann
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Calibast is the Banner
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
    SetLocalInt(oPC,"OS_BANNER",40);
}
