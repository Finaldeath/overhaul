//::///////////////////////////////////////////////
//:: M2Q2E_RESET.NSS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Resets the local on the player so s/he can try again.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: February 7, 2002
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetPCSpeaker(),"NW_M2Q2E_LKILLED",0);
}