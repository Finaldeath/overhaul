//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag, Leak Activated
//:: WW1_Hag_Leak.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Ethereal Leak has been
     activated.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 9, 200
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
//    string sWitchsHand = GetLocalString(oPC, "CONV_NIGHTHAG_Witch'sHand");
    int bTouchedLeak = GetLocalInt(oPC, "CONV_LEAK_Touched");

    if (bTouchedLeak == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
