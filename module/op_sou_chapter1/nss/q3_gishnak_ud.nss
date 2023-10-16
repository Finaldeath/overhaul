//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 Place in the OnUserDefinedEvent handler for
 the appropriate creature, then edit that
 creature's OnSpawn script to generate any of
 the desired events.
*/

#include "q3_inc_plot"

void main()
{
    int nEvent = GetUserDefinedEventNumber();

    if(nEvent == 1005 || nEvent == 1003) // attacked -> kobolds come to help
    {
        object oPC = GetLastHostileActor();
        if (GetIsPC(oPC) == TRUE)
        {
            if(GetLocalInt(GetModule(), "Q3_GNOLL_HELP") == GNOLL_HELP) // attacking chief after he promised to help
            {
                // chief is friend no more...
                SpeakStringByStrRef(40281);
                SetLocalInt(GetModule(), "Q3_GNOLL_STATUS", GNOLL_STATUS_INIT);
                SetLocalInt(GetModule(), "Q3_GNOLL_HELP", GNOLL_NOHELP);
                //Turn on Encounters
                 object oEnc1 = GetObjectByTag("Q3GnollsMixedNormal1");
                object oEnc2 = GetObjectByTag("Q3GnollsMixedNormal2");
                object oEnc3 = GetObjectByTag("Q3GnollsMixedNormal3");
                object oEnc4 = GetObjectByTag("Q3GnollsMixedNormal4");
                object oEnc5 = GetObjectByTag("Q3GnollsMixedNormal5");
                SetEncounterActive(TRUE, oEnc1);
                SetEncounterActive(TRUE, oEnc2);
                SetEncounterActive(TRUE, oEnc3);
                SetEncounterActive(TRUE, oEnc4);
                SetEncounterActive(TRUE, oEnc5);
            }
        }
        SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(103));
    }
    /*if (nEvent == EVENT_HEARTBEAT)
    {
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        if(!GetIsInCombat() && oPC != OBJECT_INVALID)
            SetFacingPoint(GetPosition(oPC));
    } */

}


