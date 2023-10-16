//::///////////////////////////////////////////////
//:: East Pillar Golem (UserDefined)
//:: UD_PillarGolemEast
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Destroys the VFX on the East Wind Pillar and
    spawns in the tower doors if all 4 are
    destroyed.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 20, 2003
//:://////////////////////////////////////////////
void main()
{
    int iUDNum = GetUserDefinedEventNumber();

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
        object oNorthPillar = GetNearestObjectByTag("WindPillarNorth");
        object oEastPillar = GetNearestObjectByTag("WindPillarEast");
        object oSouthPillar = GetNearestObjectByTag("WindPillarSouth");
        object oWestPillar = GetNearestObjectByTag("WindPillarWest");

        //Destroy my Wind Pillar
        DestroyObject(oEastPillar);

        //Destroy Boulder effects
        object oTarget1 = GetObjectByTag("winds02_rocktarget_1");
        object oTarget2 = GetObjectByTag("winds02_rocktarget_2");
        object oTarget3 = GetObjectByTag("winds02_rocktarget_3");
        object oRock1 = GetObjectByTag("winds02_rock_1_1");
        object oRock2 = GetObjectByTag("winds02_rock_1_2");
        object oRock3 = GetObjectByTag("winds02_rock_1_3");

        effect eDamage = EffectDamage(50);

        //Create shower of rocks
        location lVfx1 = GetLocation(oRock1);
        location lVfx2 = GetLocation(oRock2);
        location lVfx3 = GetLocation(oRock3);
        object oVfx1 = CreateObject(OBJECT_TYPE_PLACEABLE, "c2vfxboulder", lVfx1);
        object oVfx2 = CreateObject(OBJECT_TYPE_PLACEABLE, "c2vfxboulder", lVfx2);
        object oVfx3 = CreateObject(OBJECT_TYPE_PLACEABLE, "c2vfxboulder", lVfx3);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oVfx1);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oVfx2);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oVfx3);

        DestroyObject(oRock1);
        DestroyObject(oRock2);
        DestroyObject(oRock3);

        SetPlotFlag(oTarget1, FALSE);
        SetPlotFlag(oTarget2, FALSE);
        SetPlotFlag(oTarget3, FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget1);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget2);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget3);

        //Give XP to everyone (available multiple times)
        object oPC_XP = GetFirstPC();
        while (oPC_XP != OBJECT_INVALID)
        {
            int iXP = FloatToInt(GetJournalQuestExperience("Journ_Main_End") * 0.02);
            GiveXPToCreature(oPC_XP, iXP);
            oPC_XP = GetNextPC();
        }

        //If all are now destroyed...
        if (GetIsDead(oNorthPillar) == TRUE &&
            GetIsDead(oSouthPillar) == TRUE &&
            GetIsDead(oWestPillar) == TRUE)
        {
            //Identify the doorways leading up.
            object oNE = GetObjectByTag("Winds_02_Door_NE");
            object oSE = GetObjectByTag("Winds_02_Door_SE");
            object oSW = GetObjectByTag("Winds_02_Door_SW");
            object oNW = GetObjectByTag("Winds_02_Door_NW");

            //Clear the ethereal effect on them.
            effect eEffect;
            eEffect = GetFirstEffect(oNE);
            while (GetIsEffectValid(eEffect) == TRUE)
            {
                RemoveEffect(oNE, eEffect);
                eEffect = GetNextEffect(oNE);
            }
            eEffect = GetFirstEffect(oSE);
            while (GetIsEffectValid(eEffect) == TRUE)
            {
                RemoveEffect(oSE, eEffect);
                eEffect = GetNextEffect(oSE);
            }
            eEffect = GetFirstEffect(oSW);
            while (GetIsEffectValid(eEffect) == TRUE)
            {
                RemoveEffect(oSW, eEffect);
                eEffect = GetNextEffect(oSW);
            }
            eEffect = GetFirstEffect(oNW);
            while (GetIsEffectValid(eEffect) == TRUE)
            {
                RemoveEffect(oNW, eEffect);
                eEffect = GetNextEffect(oNW);
            }

            //Activate them.
            SetLocalInt(oNE, "bActive", TRUE);
            SetLocalInt(oSE, "bActive", TRUE);
            SetLocalInt(oSW, "bActive", TRUE);
            SetLocalInt(oNW, "bActive", TRUE);

            //Flag the area as restable
            object oRefPoint = GetObjectByTag("Ref_Winds_02");
            object oArea = GetArea(oRefPoint);
            SetLocalInt(oArea, "bAllowRest", TRUE);
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
