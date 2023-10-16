//::///////////////////////////////////////////////
//:: Shadow Lich (UserDefined)
//:: ud_cut20lich
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Apply the Dark Wind VFX to the Shadow Lich.

*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On: April 10/03
//:://////////////////////////////////////////////

void main()
{
    int iUDNum = GetUserDefinedEventNumber();

    //User-Defined OnHeartbeat (1001)
    if (iUDNum == 1001)
    {
        //Apply Wind VFX
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        if (oPC != OBJECT_INVALID)
        {
            if (GetLocalInt(OBJECT_SELF, "nCut20CaptureWind") == 1)
            {
                effect eVFX = EffectVisualEffect(VFX_IMP_DOOM);

                ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, OBJECT_SELF);
                DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, OBJECT_SELF));
                DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, OBJECT_SELF));
                DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, OBJECT_SELF));
                DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, OBJECT_SELF));
                DelayCommand(5.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, OBJECT_SELF));
                DelayCommand(6.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, OBJECT_SELF));
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
