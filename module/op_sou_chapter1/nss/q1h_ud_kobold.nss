//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName q1h_ud_kobold
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On Attacked or Spell Cast at - turn Walther
    hostile (if he's with the PC) - he's defender faction
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Feb 12/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        if (GetLocalInt(OBJECT_SELF, "nGaveBaby") == 1)
        {
            //If the kobold has given the baby - run for the exit
            if (GetIsInCombat() == FALSE)
            {
                object oTrigger = GetObjectByTag("wp_q1h1_kexit");
                SetLocalInt(OBJECT_SELF, "nTalkedOnce", 2);
                ActionMoveToObject(oTrigger, TRUE);
            }
        }
        else
        {
            //if not in combat or conversation - return to post
            object oDialog = GetObjectByTag("q1hdialog");
            if (GetIsInCombat() == FALSE && IsInConversation(OBJECT_SELF) == FALSE && IsInConversation(oDialog) == FALSE)
            {

                object oTarget = GetObjectByTag("wp_q1h_koboldbase");
                object oFacer = GetObjectByTag("q1hbabydoor");
                ActionMoveToObject(oTarget);
                DelayCommand(3.0, SetFacingPoint(GetPosition(oFacer)));
            }
        }
    }
    else if(nUser == 1005) // ATTACKED
    {
        object oDialog = GetObjectByTag("q1hdialog");
        if (GetLocalInt(OBJECT_SELF, "nSnatchSucceed") == 0 && GetLocalInt(OBJECT_SELF, "nGaveBaby") == 0 && GetLocalInt(OBJECT_SELF, "nBabyMessage") == 0
        && GetLocalInt(oDialog, "nSnatchSucceed") == 0 && GetLocalInt(oDialog, "nGaveBaby") == 0 && GetLocalInt(oDialog, "nBabyMessage") == 0)
        {
            SetLocalInt(OBJECT_SELF, "nBabyMessage", 1);
            object oPC = GetLastHostileActor();
            FloatingTextStrRefOnCreature(40413, oPC);
            AddJournalQuestEntry("q1bfamily", 30, oPC);
            SetLocalInt(GetModule(), "X1_Q1HBabyDead", 1);
        }

        SetStandardFactionReputation(STANDARD_FACTION_DEFENDER, 0);
    }
    else if (nUser == EVENT_SPELL_CAST_AT)
    {
        if (GetLastSpellHarmful() == TRUE)
        {
            object oDialog = GetObjectByTag("q1hdialog");

            if (GetLocalInt(OBJECT_SELF, "nSnatchSucceed") == 0 && GetLocalInt(OBJECT_SELF, "nGaveBaby") == 0 && GetLocalInt(OBJECT_SELF, "nBabyMessage") == 0
            && GetLocalInt(oDialog, "nSnatchSucceed") == 0 && GetLocalInt(oDialog, "nGaveBaby") == 0 && GetLocalInt(oDialog, "nBabyMessage") == 0)
            {
                SetLocalInt(OBJECT_SELF, "nBabyMessage", 1);
                object oPC = GetLastSpellCaster();
                FloatingTextStrRefOnCreature(40413, oPC);
                AddJournalQuestEntry("q1bfamily", 30, oPC);
                SetLocalInt(GetModule(), "X1_Q1HBabyDead", 1);
            }
        }
        SetStandardFactionReputation(STANDARD_FACTION_DEFENDER, 0);
    }


}

