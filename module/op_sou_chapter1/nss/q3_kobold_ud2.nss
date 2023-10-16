// kobold behaviour when searching for weapons (after agreeing to help)

#include "q3_inc_plot"
#include "nw_i0_generic"

void main()
{
    // enter desired behaviour here
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == 101) // kobolds escape after battle
    {
       object oWP = GetWaypointByTag("Q3A_WP_KOBOLDS_EXIT_JAIL");
       ClearAllActions();
       ActionForceMoveToObject(oWP, TRUE);
       ActionDoCommand(DestroyObject(OBJECT_SELF));
       SetCommandable(FALSE);
    }
    else if(nEvent == EVENT_HEARTBEAT)
    {
        if(GetIsInCombat() || IsInConversation(OBJECT_SELF))
            return;
        int nMove = GetLocalInt(OBJECT_SELF, "Q3_MOVING");
        if(nMove == 1)
            return;
        int nLook = GetLocalInt(OBJECT_SELF, "Q3_LOOK_FOR_WEAPONS");
        if(nLook == 0)
            return;
        if(GetPlot("Q3_JOURNAL_KOBOLD_PRISONERS") == 100)
            PlayMobileAmbientAnimations();
    }
    else if(nEvent == EVENT_ATTACKED) // check to see if play broke agreement
    {
        object oPC = GetLastHostileActor();
        if (oPC == OBJECT_INVALID)
            oPC = GetLastSpellCaster();
        if(!GetIsPC(oPC))
            return;
        int nDoOnce = GetLocalInt(GetArea(OBJECT_SELF), "DO_CHAOTIC_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(GetArea(OBJECT_SELF), "DO_CHAOTIC_ONCE", 1);

        // handle Nafeeli status to be used in the dragon caves:
        int nStatus = GetLocalInt(GetModule(), "q5_Nafeeli_Status");
        if(nStatus == 0)
           SetLocalInt(GetModule(), "q5_Nafeeli_Status", 1); //escaped status

        SetLocalInt(GetModule(), "Q3_KOBOLDS_BETRAYED", 1);
        object oWP = GetWaypointByTag("Q3A_WP_KOBOLDS_EXIT_JAIL");
        ClearAllActions();
        ActionForceMoveToObject(oWP, TRUE);
        ActionDoCommand(DestroyObject(OBJECT_SELF));
        int i;
        object oKobold;
        if(GetPlot("Q3_JOURNAL_KOBOLD_PRISONERS") == 100) // only if has agreement
        {
            AdjustAlignment(oPC, ALIGNMENT_CHAOTIC, 5);
            SetPlot("Q3_JOURNAL_KOBOLD_PRISONERS", 110, oPC);
        }
        for(i = 1; i <= 11; i++)
        {
            oKobold = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_HUMANOID_REPTILIAN, OBJECT_SELF, i);
            if(oKobold == OBJECT_INVALID)
                return;
            SetLocalInt(oKobold, "Q3_MOVING", 1);
            AssignCommand(oKobold, ClearAllActions());
            AssignCommand(oKobold, ActionForceMoveToObject(oWP, TRUE));
            AssignCommand(oKobold, ActionDoCommand(DestroyObject(oKobold)));
            //SetCommandable(FALSE, oKobold);

        }
        //SetCommandable(FALSE, OBJECT_SELF);


    }
    return;

}
