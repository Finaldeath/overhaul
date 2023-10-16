//::///////////////////////////////////////////////
//:: q3_init_surrend
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The dead henchmen initiate with the player
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    object oPC = GetFirstPC();

    if(GetEnteringObject()== oPC
        && !os_CheckTriggerEntered())
    {
        os_SetTriggerEntered();
        object oCal = GetObjectByTag("q3_sur_cal");
        if(GetIsObjectValid(oCal))
        {
            AssignCommand(oCal,SpeakOneLinerConversation());
        }
        object oKai = GetObjectByTag("q3_sur_kai");
        if(GetIsObjectValid(oKai))
        {
            DelayCommand(0.1,AssignCommand(oKai,SpeakOneLinerConversation()));
        }
        object oJab = GetObjectByTag("q3_sur_jab");
        if(GetIsObjectValid(oJab))
        {
            DelayCommand(0.2,AssignCommand(oJab,SpeakOneLinerConversation()));
        }
        object oTrip = GetObjectByTag("q3_sur_trp");
        if(GetIsObjectValid(oTrip))
        {
            DelayCommand(0.3,AssignCommand(oTrip,SpeakOneLinerConversation()));
        }
    }
}
