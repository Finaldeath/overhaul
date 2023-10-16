//::///////////////////////////////////////////////
//:: Witch Wake 1: Kobold War Captain User-Defined
//:: WW1_KobCapt_UD.nss
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Add sparkly to dropped key.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 8, 2003
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void main()
{
    //Process Default User-Defined Events
    int iUDNum = GetUserDefinedEventNumber();
    switch (iUDNum)
    {
        case 1001: //User-Defined Heartbeat Event
        {

        }
        break;

        case 1002: //User-Defined OnPerceive Event
        {

        }
        break;

        case 1003: //User-Defined EndCombatRound Event
        {

        }
        break;

        case 1004: //User-Defined OnDialog Event
        {

        }
        break;

        case 1005: //User-Defined OnAttack Event
        {

        }
        break;

        case 1006: //User-Defined OnDamaged Event
        {

        }
        break;

        case 1007: //User-Defined OnDeath Event
        {
            //If I'm dropping the key, spawn in a sparkly to highlight it.
            object oKey = GetItemPossessedBy(OBJECT_SELF, "ww1_BridgeKey");
            if (oKey != OBJECT_INVALID)
            {
                location lLoc = GetLocation(OBJECT_SELF);
                CreateObject(OBJECT_TYPE_PLACEABLE, "plc_magicwhite", lLoc, FALSE, "ww1_BridgeKey_Sparkly");
            }
        }
        break;

        case 1008: //User-Defined OnDisturbed Event
        {

        }
        break;
    }
}
