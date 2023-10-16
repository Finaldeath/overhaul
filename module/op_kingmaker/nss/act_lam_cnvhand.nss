//::///////////////////////////////////////////////
//:: Calibast Hand Envid Banner
//:: act_lam_cnvhand
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Calibast is now the Hand and Enivid is the
   Banner.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: Nov 2004
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    SetLocalInt(oPC,"OS_BANNER",20);
    SetLocalInt(oPC,"OS_HAND",40);
}
