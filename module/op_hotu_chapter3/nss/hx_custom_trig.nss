//::///////////////////////////////////////////////
//:: Name hx_custom_trig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Custom interjection trigger. This will handle
     them all for Aribeth.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 10, 2003
//:://////////////////////////////////////////////
#include "x2_inc_banter"
#include "x2_inc_cutscene"
void main()
{
    object oSelf = OBJECT_SELF;
    object oPC = GetEnteringObject();
    int iNum;
    object oArea = GetArea(oPC);

    if(GetIsPC(oPC))
    {
        if(GetTag(oArea) == "TempleoftheSleepingMan")
        {
            iNum = 100;
        }
        else if(GetTag(oArea) == "hx_hand_plane")
        {
            iNum = 101;
        }
        else if(GetTag(oArea) == "KnowerofPlaces")
        {
            iNum = 102;
        }
        else if(GetTag(oArea) == "Battlefield")
        {
            iNum = 103;
        }
        else
        {
            return;
        }

        int iCut = CutGetActiveCutsceneForObject(oPC);
        if(iCut < 1 && !GetIsInCombat(oPC))
        {
            object oAribeth = GetObjectByTag("H2_Aribeth");
            if(GetMaster(oAribeth) == oPC)
            {
                //SendMessageToPC(oPC, "INSIDE CHECK");
                if(iNum == 103 && GetLocalInt(GetModule(), "HX_KNOWER_APPEARED") == FALSE)
                {
                    AttemptInterjectionOrPopup(oSelf, "x2_inter_nr", oPC, iNum, oAribeth);
                }
                else
                {
                    AttemptInterjectionOrPopup(oSelf, "x2_inter_nr", oPC, iNum, oAribeth);
                }
            }
        }
    }
}
