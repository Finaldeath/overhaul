//::///////////////////////////////////////////////
//:: Open Thief Store
//:: con_sou_openstor
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Opens the Thief Store
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()
{
    object oStore;
    if(GetLocalInt(GetFirstPC(),"os_thievesguild_pc")==1)
    {
        oStore = GetObjectByTag("os_store_thi2");
    }
    if(GetLocalInt(GetFirstPC(),"os_pcbelieves")==40)
    {
        oStore = GetObjectByTag("os_store_thi2");
    }
    else
    {
        oStore = GetObjectByTag("os_store_thi1");
    }
    if (GetIsObjectValid(oStore) == TRUE)
    {
        gplotAppraiseOpenStore(oStore, GetFirstPC());
    }
    else
        PlayVoiceChat(VOICE_CHAT_CUSS);

}
