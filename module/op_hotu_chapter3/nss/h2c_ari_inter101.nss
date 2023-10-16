//::///////////////////////////////////////////////
//:: Aribeth, Context Conversation #101 (Condition Script)
//:: H2c_Ari_Inter101.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Is Aribeth ready to say this interjection?
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 23, 2003
//:://////////////////////////////////////////////
#include "x0_i0_henchman"

int StartingConditional()
{
    if (GetInterjectionSet(GetPCSpeaker()) == 101)
        return TRUE;
    return FALSE;
}

