// Action taken for Gishnak: Gnolls leave area AND chief gives key

/*
values for Q3_GNOLL_STATUS:

GNOLL_STATUS_INIT =             initial status
GNOLL_STATUS_LEFT =             all gnoll left the area
GNOLL_STATUS_DEAD =             chief is dead
GNOLL_STATUS_SAFE_PASSAGE =     gnollsgave safe passge
GNOLL_STATUS_CONTROL_TRIBE =     player has full control over the tribe

values for Q3_GNOLL_HELP

GNOLL_NOHELP
GNOLL_HELP
*/

#include "q3_inc_plot"

void main()
{
    SetLocalInt(GetModule(), "Q3_GNOLL_STATUS", GNOLL_STATUS_LEFT);
    SetLocalInt(GetModule(), "Q3_GNOLL_HELP", GNOLL_NOHELP); // gnolls should not help if leaving

    object oWP1 = GetWaypointByTag("Q3A_WP_BATTLE_EXIT1");
    object oWP2 = GetWaypointByTag("Q3A_WP_BATTLE_EXIT2");
    object oKey = GetItemPossessedBy(OBJECT_SELF, "Q3_KEY_CHIEF");

    // first - handle the chief
    ClearAllActions();
    if(oKey != OBJECT_INVALID)
        ActionGiveItem(oKey, GetPCSpeaker());
    ActionForceMoveToObject(oWP1);
    ActionForceMoveToObject(oWP2);
    ActionDoCommand(DestroyObject(OBJECT_SELF));
    SetCommandable(FALSE, OBJECT_SELF);

    // now - all the other gnoll should leave
    int i = 1;
    float fDelay = 0.0;
    object oGnoll = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_HUMANOID_GOBLINOID, OBJECT_SELF, i);
    while(oGnoll != OBJECT_INVALID)
    {
        i++;
        fDelay += 0.5;
        float fDistance = GetDistanceBetween(OBJECT_SELF, oGnoll);
        // make sure that only gnolls from this area are destroyed
        if(oGnoll == OBJECT_INVALID || GetArea(oGnoll) != GetArea(OBJECT_SELF))
            return;

        if(fDistance >= 30.0)
            DestroyObject(oGnoll);
        else
            DelayCommand(fDelay, SignalEvent(oGnoll, EventUserDefined(102)));
        oGnoll = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_HUMANOID_GOBLINOID, OBJECT_SELF, i);
    }

//Turn off encounters
    object oEnc1 = GetObjectByTag("Q3GnollsMixedNormal1");
    object oEnc2 = GetObjectByTag("Q3GnollsMixedNormal2");
    object oEnc3 = GetObjectByTag("Q3GnollsMixedNormal3");
    object oEnc4 = GetObjectByTag("Q3GnollsMixedNormal4");
    object oEnc5 = GetObjectByTag("Q3GnollsMixedNormal5");
    SetEncounterActive(FALSE, oEnc1);
    SetEncounterActive(FALSE, oEnc2);
    SetEncounterActive(FALSE, oEnc3);
    SetEncounterActive(FALSE, oEnc4);
    SetEncounterActive(FALSE, oEnc5);

}
