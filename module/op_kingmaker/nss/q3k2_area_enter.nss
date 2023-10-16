//::///////////////////////////////////////////////
//:: q3k2_area_enter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On Area Enter script for Illithid Temple
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    object oPC = GetFirstPC();
    if(GetEnteringObject()==oPC
        && os_CheckAreaEntered())
    {
        os_SetAreaEntered();
        //checks to see which henchmen were abandoned at start, and create them
        int nHench;
        if(GetLocalInt(oPC,"Q3AI_CAL_CHOSEN")!=10)
        {
            object oWay = GetObjectByTag("q3_way_calend");
            location lWay = GetLocation(oWay);
            CreateObject(OBJECT_TYPE_CREATURE,"q3_sur_cal",lWay);
            nHench = nHench+1;
        }
        if(GetLocalInt(oPC,"Q3AI_KAI_CHOSEN")!=10)
        {
            object oWay = GetObjectByTag("q3_way_kaiend");
            location lWay = GetLocation(oWay);
            CreateObject(OBJECT_TYPE_CREATURE,"q3_sur_kai",lWay);
            nHench = nHench+1;
        }
        if(GetLocalInt(oPC,"Q3AI_JAB_CHOSEN")!=10)
        {
            object oWay = GetObjectByTag("q3_way_jabend");
            location lWay = GetLocation(oWay);
            CreateObject(OBJECT_TYPE_CREATURE,"q3_sur_jab",lWay);
            nHench = nHench+1;
        }
        if(GetLocalInt(oPC,"Q3AI_TRP_CHOSEN")!=10)
        {
            object oWay = GetObjectByTag("q3_way_tripend");
            location lWay = GetLocation(oWay);
            CreateObject(OBJECT_TYPE_CREATURE,"q3_sur_trp",lWay);
            nHench = nHench+1;
        }
        SetLocalInt(oPC,"OS_HENCHMEN_DEAD",nHench);
    }
}
