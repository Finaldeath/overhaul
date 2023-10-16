//::///////////////////////////////////////////////
//:: Default: On User Defined
//:: NW_C2_DEFAULTD
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Determines the course of action to be taken
    on a user defined event.
*/
//:://////////////////////////////////////////////
//:: Created By: Don Moar
//:: Created On: April 28, 2002
//:://////////////////////////////////////////////

#include "q3_inc_plot"

void main()
{
    // enter desired behaviour here
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == 101) // kobolds escape after battle
    {
       object oWP = GetWaypointByTag("Q3A_WP_BATTLE_EXIT1");
       ClearAllActions();
       ActionForceMoveToObject(oWP, TRUE, 5.0);
       ActionDoCommand(DestroyObject(OBJECT_SELF));
       SetCommandable(FALSE);
    }
    else if(nEvent == EVENT_HEARTBEAT)
    {
        if(GetIsInCombat())
            SpeakOneLinerConversation("q3_kob_battle");
        int nRand = Random(20);
        if(nRand == 0)
        {
            ClearAllActions();
            ActionSpeakStringByStrRef(83375);
            ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1);
            SetCommandable(FALSE);
            DelayCommand(6.0, SetCommandable(TRUE));

        }
    }
    else if(nEvent == EVENT_ATTACKED) // check to see if player broke agreement
    {
        object oPC = GetLastAttacker();
        if(!GetIsPC(oPC))
            return;
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_CHAOTIC_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_CHAOTIC_ONCE", 1);

        // handle Nafeeli status to be used in the dragon caves:
        int nStatus = GetLocalInt(GetModule(), "q5_Nafeeli_Status");
        if(nStatus == 0)
           SetLocalInt(GetModule(), "q5_Nafeeli_Status", 1); //escaped status

        SetLocalInt(GetModule(), "Q3_KOBOLDS_BETRAYED", 1);
        object oWP = GetWaypointByTag("Q3A_WP_BATTLE_EXIT1");
        ClearAllActions();
        ActionForceMoveToObject(oWP, TRUE);
        ActionDoCommand(DestroyObject(OBJECT_SELF));
        int i;
        object oKobold;
        for(i = 1; i <= 8; i++)
        {
            oKobold = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_HUMANOID_REPTILIAN, OBJECT_SELF, i);
            AssignCommand(oKobold, ClearAllActions());
            AssignCommand(oKobold, ActionForceMoveToObject(oWP, TRUE));
            AssignCommand(oKobold, ActionDoCommand(DestroyObject(oKobold)));

        }
        if(GetPlot("Q3_JOURNAL_KOBOLD_PRISONERS") == 100) // only if has agreement
            AdjustAlignment(oPC, ALIGNMENT_CHAOTIC, 5);

    }
    return;

}
