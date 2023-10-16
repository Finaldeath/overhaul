//::///////////////////////////////////////////////
//:: Asabi Looter (User-Defined)
//:: UD_AsabiLooter.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Make the Looter bash at nearby rubble.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 24, 2003
//:://////////////////////////////////////////////

void main()
{
    int iUDNum = GetUserDefinedEventNumber();

    //User-Defined OnSpawn (100)
    if (iUDNum == 100)
    {

    }

    //User-Defined OnHeartbeat (1001)
    if (iUDNum == 1001)
    {
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        if (oPC != OBJECT_INVALID)
        {
            int bInConv = IsInConversation(OBJECT_SELF);
            if (bInConv == FALSE)
            {
                object oRubble = GetNearestObjectByTag("AsabiRubble");
                DoPlaceableObjectAction(oRubble, PLACEABLE_ACTION_BASH);
                DelayCommand(1.0, ClearAllActions(TRUE));
            }
        }
    }

    //User-Defined OnPerceive (1002)
    if (iUDNum == 1002)
    {

    }

    //User-Defined OnAttacked (1005)
    if (iUDNum == 1005)
    {

    }

    //User-Defined OnDamaged (1006)
    if (iUDNum == 1006)
    {

    }

    //User-Defined OnDeath (1007)
    if (iUDNum == 1007)
    {

    }

    //User-Defined OnDisturbed (1008)
    if (iUDNum == 1008)
    {

    }

    //User-Defined OnCombatRoundEnd (1003)
    if (iUDNum == 1003)
    {

    }

    //User-Defined OnDialog (1004)
    if (iUDNum == 1004)
    {

    }

    return;
}
