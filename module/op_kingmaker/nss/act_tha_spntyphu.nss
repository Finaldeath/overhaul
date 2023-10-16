//::///////////////////////////////////////////////
//:: Spawn-in Typhus
//:: act_tha_spntyphu
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Spawns in Typhus
*/
//:://////////////////////////////////////////////
//:: Created By: Dan
//:: Created On: Sept, 2003
//:://////////////////////////////////////////////
//:: Modified By: Keith K2 Hayward
//:: Modified On: January 2005
//::----------------------------------------------
//:: This is a weird duplicate script that should
//:: never be in use. I updated it just to be sure
//:: that no shenanigans take place.
//:://////////////////////////////////////////////

void main()
{
    object oTyphus = GetObjectByTag("q2_typhus");
    object oWay = GetObjectByTag("os_spawn_typhus");
    object oThaddeus = OBJECT_SELF;
    location lWay = GetLocation(oWay);

    int iDoOnce = GetLocalInt(oThaddeus, "q2a_tha_spntyph");

    if (iDoOnce == FALSE)
    {
        ActionPauseConversation();

        SetLocalInt(oThaddeus, "q2a_tha_spntyph", TRUE);
        CreateObject(OBJECT_TYPE_CREATURE, "typhus", lWay);
        DelayCommand(1.0f, AssignCommand(oTyphus, ActionMoveToObject(oThaddeus)));

        DelayCommand(1.0f, ActionResumeConversation());
    }
}
