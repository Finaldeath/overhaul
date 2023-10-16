//::///////////////////////////////////////////////
//:: Scrivener, Small Good Alignment Shift (Action Script)
//:: H2a_Scrv_Shift_G.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Hand out a small good alignment shift but
     only do it once.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 6, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    int bDoOnce = GetLocalInt(oPC, "bScrivGoodHit");

    if (bDoOnce == FALSE)
    {
        SetLocalInt(oPC, "bScrivGoodHit", TRUE);
        AdjustAlignment(oPC, ALIGNMENT_GOOD, 1);
    }
}
