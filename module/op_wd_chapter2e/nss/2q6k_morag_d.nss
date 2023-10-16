//::///////////////////////////////////////////////
//:: Morag Custom User Defined Even
//:: 2q6k_morag_d
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Morage initiates dialogue
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 18, 2002
//:://////////////////////////////////////////////
#include "nw_i0_generic"
#include "nw_i0_hostincl"
void main()
{
    int nUser = GetUserDefinedEventNumber();
    int nPlot = GetLocalInt(GetArea(OBJECT_SELF), "NW_2Q6_CUT_SCENE_START");
    if(nUser == 1001 && nPlot == 5) //HEARTBEAT
    {
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        if(GetIsObjectValid(oPC) && GetDistanceToObject(oPC) < 20.0)
        {
            ActionStartConversation(OBJECT_SELF);
            DelayCommand(1.0,SetLocalInt(GetArea(OBJECT_SELF), "NW_2Q6_CUT_SCENE_START", 7));

            object oAlly = GetFirstObjectInArea();
            string sTag;
            while(GetIsObjectValid(oAlly))
            {
                sTag = GetTag(oAlly);
                if(sTag=="2Q6K_LizardFolk" ||
                   sTag=="humanoid_rept001" ||
                   sTag=="2Q6K_LizardFolk02" ||
                   sTag=="2Q6K_Aribeth")
                {
                    if(GetLocalInt(oAlly, "NW_GENERIC_MASTER")==0)
                    {
                        ExecuteScript("2q6k_lizard_9", oAlly);
                    }
                }
                oAlly = GetNextObjectInArea();
            }
        }
    }
    else if(nUser == 1001 && nPlot == 10)
    {
        ActionStartConversation(OBJECT_SELF);
        SetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT, FALSE);
    }
    else if(nUser == 1001 && nPlot == 99)
    {
        SetLocalInt(GetArea(OBJECT_SELF), "NW_2Q6_CUT_SCENE_START", 100);
        ExecuteScript("2q6k_startfight", OBJECT_SELF);
    }
}

