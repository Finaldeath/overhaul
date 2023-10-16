//::///////////////////////////////////////////////
//:: Shadovar (UserDefined)
//:: UD_Shadovar.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Spawns Shadow Gems onto the corpses of the
     appropriate Shadovar
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 9, 2003
//:://////////////////////////////////////////////

void main()
{
    int iUDNum = GetUserDefinedEventNumber();

    //User-Defined OnSpawn (1000)
    if (iUDNum == 1000)
    {
        effect eVision = EffectUltravision();
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVision, OBJECT_SELF);
    }

    //User-Defined OnHeartbeat (1001)
    if (iUDNum == 1001)
    {

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
        object oArea = GetArea(OBJECT_SELF);
        string sArea = GetTag(oArea);

        //If they died on the 2nd floor of the Arcanists' Tower...
        if (sArea == "Wizard_02")
        {
            //Spawn in a Shadow Gem on their corpse.
            CreateItemOnObject("shadowgem");
        }
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

