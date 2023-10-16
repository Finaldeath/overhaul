//::///////////////////////////////////////////////
//:: Feran Banner
//:: act_lam_ferbann
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Feran has been set as the Banner
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
    SetLocalInt(oPC,"OS_BANNER",80);
}
