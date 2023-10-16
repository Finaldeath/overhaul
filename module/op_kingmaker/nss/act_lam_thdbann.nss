//::///////////////////////////////////////////////
//:: Thaddeus Banner
//:: act_lam_thdbann
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Thaddeus has been set as the Banner
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: Nov 2004
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    object oBeck = GetObjectByTag("q2_sirbecket");

    if(GetLocalInt(oBeck,"OS_BECKET_BANNER")==10)
    {
        SetLocalInt(oBeck,"OS_BECKET_BANNER",99);
    }

    SetLocalInt(oPC,"OS_BANNER",100);
}
