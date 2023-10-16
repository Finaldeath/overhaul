//::///////////////////////////////////////////////
//:: South Pillar Golem (UserDefined)
//:: UD_PillarGolemSouth
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Destroys the VFX on the South Wind Pillar and
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
        DestroyObject(oSouthPillar);

        //Destroy Beam objects
        object oBeam1 = GetObjectByTag("winds2_beam1_1");
        object oBeam2 = GetObjectByTag("winds2_beam1_2");
        object oBeam3 = GetObjectByTag("winds2_beam1_3");
        object oBeam4 = GetObjectByTag("winds2_beam1_4");
        object oBeam5 = GetObjectByTag("winds2_beam1_5");
        DestroyObject(oBeam1);
        DestroyObject(oBeam2);
        DestroyObject(oBeam3);
        DestroyObject(oBeam4);
        DestroyObject(oBeam5);
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
            GetIsDead(oEastPillar) == TRUE &&
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
