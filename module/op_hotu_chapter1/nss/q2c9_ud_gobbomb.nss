//::///////////////////////////////////////////////
//:: Goblin Bombardier: On User Defined
//:: q2c9_ud_gobbomb
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Goblin Bombers will use the catapults whenever they
    perceive a PC and on end of a combat round.
*/
//:://////////////////////////////////////////////
//:: Created By: Don Moar
//:: Created On: April 28, 2002
//:://////////////////////////////////////////////
void main()
{
    int nEvent = GetUserDefinedEventNumber();
    // 1002 - On Perception
    if (nEvent == 1002)
    {
        object oPC = GetLastPerceived();

        //if the creature perceived is an enemy - use the catapult
        if (GetIsEnemy(oPC) == TRUE)
        {
            object oCat = GetObjectByTag("q2c9_cat_" + GetStringRight(GetTag(OBJECT_SELF), 1));
            //ActionInteractObject(oCat);

            SignalEvent(OBJECT_SELF, EventUserDefined(1099));
            //SignalEvent(oCat, EventUserDefined(1200));
        }
    }


    //1003 - On Combat Round End
    if (nEvent == 1003)
    {
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        if (GetObjectSeen(oPC))
        {
            object oCat = GetObjectByTag("q2c9_cat_" + GetStringRight(GetTag(OBJECT_SELF), 1));
            //ActionInteractObject(oCat);
            SignalEvent(OBJECT_SELF, EventUserDefined(1099));
        }
    }

    if (nEvent == 1099)
    {

        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF);
        object oCat = GetObjectByTag("q2c9_cat_" + GetStringRight(GetTag(OBJECT_SELF), 1));
        if (oPC != OBJECT_INVALID  && GetDistanceToObject(oPC) < 55.0)
        {
            ActionInteractObject(oCat);
            DelayCommand(6.0, SignalEvent(OBJECT_SELF, EventUserDefined(1099)));
        }

    }
    return;

}
