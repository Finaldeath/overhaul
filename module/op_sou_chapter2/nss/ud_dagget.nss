//::///////////////////////////////////////////////
//:: Dagget Filth (UserDefined)
//:: UD_Dagget.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Make him sleep.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 17, 2003
//:://////////////////////////////////////////////

void main()
{
    int iUDNum = GetUserDefinedEventNumber();

    //User-Defined OnSpawn (1000)
    if (iUDNum == 1000)
    {

    }

    //User-Defined OnHeartbeat (1001)
    if (iUDNum == 1001)
    {
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        if (oPC != OBJECT_INVALID)
        {
            int bInConv = IsInConversation(OBJECT_SELF);
            int bInCombat = GetLocalInt(OBJECT_SELF, "bEnteredCombat");
            if (bInConv == FALSE &&
                bInCombat == FALSE)
            {
                effect eSnore = EffectVisualEffect(VFX_IMP_SLEEP);
                PlayAnimation(ANIMATION_LOOPING_DEAD_BACK, 1.0, 7.0);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eSnore, OBJECT_SELF);
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
        SetLocalInt(OBJECT_SELF, "bEnteredCombat", TRUE);
    }

    //User-Defined OnDamaged (1006)
    if (iUDNum == 1006)
    {
        SetLocalInt(OBJECT_SELF, "bEnteredCombat", TRUE);
    }

    //User-Defined OnDeath (1007)
    if (iUDNum == 1007)
    {
    }

    //User-Defined OnDisturbed (1008)
    if (iUDNum == 1008)
    {
        SetLocalInt(OBJECT_SELF, "bEnteredCombat", TRUE);
    }

    //User-Defined OnCombatRoundEnd (1003)
    if (iUDNum == 1003)
    {
        SetLocalInt(OBJECT_SELF, "bEnteredCombat", TRUE);
    }

    //User-Defined OnDialog (1004)
    if (iUDNum == 1004)
    {

    }

    return;
}
