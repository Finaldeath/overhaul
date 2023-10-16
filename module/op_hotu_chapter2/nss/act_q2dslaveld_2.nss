//::///////////////////////////////////////////////
//:: Name act_q2dslaveld_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Slave Leader and slaves launch their attack
    on the Illithid compound right now!
    Variable = 2  - attack when area entered.
    Variable = 1  - attack after PC has entered the Grand Hall (set it to 2 on enter of that area)
    Variable = 0  - nothing's happenning
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  August 1/03
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()
{
       //Set a variable that the next time the PC enters
       //the main city - the uprising begins.

    object oPC = GetPCSpeaker();


    if (GetLocalInt(GetModule(), "nQ2DSlaveJournalAdded") != 1)
    {
        SetLocalInt(GetModule(), "nQ2DSlaveJournalAdded", 1);
        AddJournalQuestEntry("q2_zorvakmur",98,oPC,TRUE,TRUE,TRUE);
        AddJournalQuestEntry("q2_slaverevolt",20,oPC);
    }

      SetLocalInt(GetModule(), "X2_Q2DSlaveUprising", 2);

       //All thralls run for the exit
        object oExit = GetWaypointByTag("wp_q2d5_exit");
        object oThrall = GetFirstObjectInArea();
        while (oThrall != OBJECT_INVALID)
        {
            if (GetObjectType(oThrall) == OBJECT_TYPE_CREATURE)
            {
                if (GetStringLeft(GetTag(oThrall), 7) == "q2dthra")
                {
                    AssignCommand(oThrall, ClearAllActions(TRUE));
                    AssignCommand(oThrall, ActionForceMoveToObject(oExit, TRUE));
                    DestroyObject(oThrall, 10.0);
                    AssignCommand(oThrall, DelayCommand(0.5, SetCommandable(FALSE, oThrall)));
                }
            }
            oThrall = GetNextObjectInArea();
        }

        SpeakStringByStrRef(85706);//"Now my brothers, we shall gain our Freedom!"
        ActionForceMoveToObject(oExit, TRUE);
        DestroyObject(OBJECT_SELF, 10.0);
        DelayCommand(0.5, SetCommandable(FALSE));
}
