//::///////////////////////////////////////////////
//:: Ohio Initiates
//:: q3_init_ohio2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Ohio initiates with the player
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    object oPC = GetFirstPC();

    if(GetEnteringObject() == oPC
        && !os_CheckTriggerEntered())
    {
        os_SetTriggerEntered();
        AssignCommand(oPC,ClearAllActions(TRUE));
        object oOhio = GetObjectByTag("q3_ohio");
//        int nOhio = GetLocalInt(oOhio,"OS_OHIO_CAVES")+10;
        if(GetIsObjectValid(oOhio))
        {
            SetLocalInt(oOhio,"OS_OHIO_CAVES",20);
            AssignCommand(oOhio,ClearAllActions(TRUE));
            AssignCommand(oOhio,JumpToObject(oPC));
            DelayCommand(0.5,AssignCommand(oOhio,ActionStartConversation(oPC)));
        }
    }
}
