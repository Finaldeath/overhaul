//::///////////////////////////////////////////////
//:: Aribeth, Context Conversation #102 (Condition Script)
//:: H2c_Ari_Inter102.nss
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
    if (GetInterjectionSet(GetPCSpeaker()) == 102)
        return TRUE;
    return FALSE;
}

