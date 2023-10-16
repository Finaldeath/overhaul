//::///////////////////////////////////////////////
//:: Witchwork 1: Ragpicker User Defined
//:: WW1_Ragpick_UD.nss
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Cause the ragpicker to heal themselves if
    injured, run away from the injurer, and set a
    local so they have appropriate conversation
    responses to the injurer in the future.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 1, 2002
//:://////////////////////////////////////////////

void main()
{
    effect eHeal = EffectHeal(500);

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
            object oAttacker = GetLastAttacker();
            //Heal self and run away
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, OBJECT_SELF);
            ActionMoveAwayFromObject(oAttacker, TRUE, 10.0);
        }
        break;

        case 1006: //User-Defined OnDamaged Event
        {
            object oDamager = GetLastDamager();
            //Heal self and run away
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, OBJECT_SELF);
            ActionMoveAwayFromObject(oDamager, TRUE, 10.0);
        }
        break;

        case 1007: //User-Defined OnDeath Event
        {

        }
        break;

        case 1008: //User-Defined OnDisturbed Event
        {

        }
        break;
    }
}
