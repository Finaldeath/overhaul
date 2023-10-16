//::///////////////////////////////////////////////
//:: act_gla_openstor
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Opens the Fighter Store
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Dec 2003
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()
{
    object oStore;
    if(GetLocalInt(OBJECT_SELF,"OS_JOIN_MILITIA")>=10)
    {
        oStore = GetObjectByTag("os_store_fight2");
    }
    else
    {
        oStore = GetObjectByTag("os_store_fight1");
    }

    if (GetIsObjectValid(oStore) == TRUE)
    {
        gplotAppraiseOpenStore(oStore, GetFirstPC());
    }
    else
        PlayVoiceChat(VOICE_CHAT_CUSS);

}
