//::///////////////////////////////////////////////
//:: HenchMen Trigger
//:: q3ai_trg_chckhen
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see that all the henchmen have been dealt with
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
    object oPC = GetFirstPC();
    object oCave = GetArea(oPC);
    int nChosen = GetLocalInt(oCave,"Q3AI_HENCH_CHOSEN");
    if(GetEnteringObject()==oPC
        && !os_CheckTriggerEntered())
    {
        if(nChosen >=2)
        {
            object oDoor = GetObjectByTag("q3ai_at_q1ac");
            SetLocked(oDoor,FALSE);
            object oCal = GetObjectByTag("os_dead_cal");
            object oJab = GetObjectByTag("os_dead_jab");
            object oKai = GetObjectByTag("os_dead_kai");
            object oTrp = GetObjectByTag("os_dead_trp");
            string sText = "You have not yet spoken with all your friends to bid them farewell.";
            if(GetLocalInt(oPC,"Q3AI_CAL_CHOSEN")==99
                && GetIsObjectValid(oCal))
            {
                FloatingTextStringOnCreature(sText,oPC);
            }
            else if(GetLocalInt(oPC,"Q3AI_JAB_CHOSEN")==99
                && GetIsObjectValid(oJab))
            {
                FloatingTextStringOnCreature(sText,oPC);
            }
            else if(GetLocalInt(oPC,"Q3AI_KAI_CHOSEN")==99
                && GetIsObjectValid(oKai))
            {
                FloatingTextStringOnCreature(sText,oPC);
            }
            else if(GetLocalInt(oPC,"Q3AI_TRP_CHOSEN")==99
                && GetIsObjectValid(oTrp))
            {
                FloatingTextStringOnCreature(sText,oPC);
            }
            os_SetTriggerEntered();
        }
    }
}
