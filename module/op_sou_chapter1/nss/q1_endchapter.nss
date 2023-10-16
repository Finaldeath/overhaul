//::///////////////////////////////////////////////
//:: Name q1_endchapter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    End Chapter 1 and start the Interlude
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 20/03
//:://////////////////////////////////////////////
#include "x0_i0_henchman"
void main()
{
    effect eSmoke = EffectVisualEffect(VFX_FNF_DISPEL);
    location lSmoke = GetLocation(OBJECT_SELF);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eSmoke,lSmoke);


    object oXanos = GetObjectByTag("x0_hen_xan");
    object oDorna = GetObjectByTag("x0_hen_dor");


    //Save Campaign Variables here
    object oPC = GetFirstPC();
    while (oPC != OBJECT_INVALID)
    {   //Store each PCs data
        SetCampaignInt("dbPlayers", "DeekinStory", GetLocalInt(oPC, "XP1_Deekin_Story"), oPC);
        SetCampaignInt("dbPlayers", "DornaStory", GetLocalInt(oPC, "XP1_Dorna_Story"), oPC);
        SetCampaignInt("dbPlayers", "XanosStory", GetLocalInt(oPC, "XP1_Xanos_Story"), oPC);

        //Store henchmen level-up status
        SetCampaignInt("dbHenchmen", "XanosLevelStatus", GetLocalInt(oXanos, "X0_L_LEVELRULES"), oPC);
        SetCampaignInt("dbHenchmen", "DornaLevelStatus", GetLocalInt(oDorna, "X0_L_LEVELRULES"), oPC);

        //Store each PCs henchman
        object oHenchman = GetHenchman(oPC);
        if (oHenchman != OBJECT_INVALID)
        {
            FireHenchman(oPC, oHenchman);
            StoreCampaignObject("dbPlayers", "Henchman", oHenchman, oPC);
        }
        oPC = GetNextPC();
    }


        DelayCommand(2.5, StartNewModule("XP1-Interlude"));
        return;


}
