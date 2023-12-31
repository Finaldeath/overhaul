//::///////////////////////////////////////////////
//:: Open Mage Store
//:: con_yen_openstor
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Opens the Mage Store
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()
{
    object oStore;
    if(GetLocalInt(GetFirstPC(),"os_pcjoinedforesters")==1)
    {
        oStore = GetObjectByTag("os_store_gen2");
    }
    else
    {
        oStore = GetObjectByTag("os_store_gen1");
    }
    if (GetIsObjectValid(oStore) == TRUE)
    {
        gplotAppraiseOpenStore(oStore, GetFirstPC());
    }
    else
        PlayVoiceChat(VOICE_CHAT_CUSS);

}
