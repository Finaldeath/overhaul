//::///////////////////////////////////////////////
//:: M3Q2B11NaxLEAVES.nss
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Nax leaves, giving the player some gold before going.
    Also gives the player the same ring that the elementals could've
    given him.
    Cori took out giving of gold and experience because he gives experience
    earlier in conversation and he claims to have no gold.
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: January 2002
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()
{
//    RewardXP("M3Q3BFreeNax",100,GetPCSpeaker());

//    CreateItemOnObject("NW_IT_MRING015", GetPCSpeaker());
    ActionDoCommand(EscapeArea());
    if(GetLocalInt(GetPCSpeaker(),"NW_G_NAXSNOWGLOBE")==0)
    {
        AddJournalQuestEntry("M3Q3BFreeNax",30,GetPCSpeaker());
    }

}
