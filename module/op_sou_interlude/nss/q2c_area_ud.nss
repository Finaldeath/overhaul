// kill KelGaras in a spectacular way

void CreateShrine()
{
    location lLoc = GetLocalLocation(OBJECT_SELF, "SHRINE_SP");
    object oAltar = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_altrgood", lLoc);
    effect eVis = EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oAltar);
}

void Explode(object oObject)
{
    effect eBoom = EffectVisualEffect(VFX_FNF_FIREBALL);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eBoom, oObject);
    int n = 1;
    effect eDam;
    object oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oObject, n);
    effect eKnock = EffectKnockdown();
    while (oCreature != OBJECT_INVALID)
    {
        int nRand = d6(1);
        eDam = EffectDamage(nRand, DAMAGE_TYPE_SONIC);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oCreature);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnock, oCreature, 2.0);
        n++;
        oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oObject, n);
    }
    eDam = EffectDamage(1000);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oObject);

}

void Attack(object oAttacker)
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oAttacker);
    AssignCommand(oAttacker, ActionAttack(oPC));
}

void Bring(object oBring)
{
    object oWP1 = GetWaypointByTag("Q3C_WP_ALI_SP");
    object oWP2 = GetWaypointByTag("Q3C_WP_ALI_WALKTO");

    AssignCommand(oBring, JumpToObject(oWP1));
    AssignCommand(oBring, ActionMoveToObject(oWP2, TRUE));
}

void Revive(object oKelGaras)
{
    effect eRise = EffectResurrection();
    effect eHeal = EffectHeal(GetMaxHitPoints(oKelGaras));
    effect eVis = EffectVisualEffect(VFX_IMP_RAISE_DEAD);
    effect eLink = EffectLinkEffects(eRise, eVis);

    // last sanity check to make sure Kel-Garas is not final-dead
    if(GetLocalInt(oKelGaras, "FINAL_DEATH") == 1)
        return;
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oKelGaras);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oKelGaras);
}

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == 101) // final death for kel-garas
    {
        effect eVis;
        object oAltar = GetObjectByTag("Q2C_ALTAR");
        vector vPos = GetPosition(oAltar);
        vPos.z += 2;
        location lLoc = Location(OBJECT_SELF, vPos, 270.0);
        object oStone = CreateObject(OBJECT_TYPE_PLACEABLE, "q3c_stone_face", lLoc);
        eVis = EffectVisualEffect(VFX_FNF_IMPLOSION);
        DelayCommand(2.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oStone)));
        DelayCommand(3.5, AssignCommand(oStone, SpeakStringByStrRef(40563)));
        DelayCommand(6.0, Explode(oStone));

        // making sure the kel-garas object does not remain for a delayed ressurection
        object oKelGaras = GetNearestObjectByTag("Q2_KELGARAS",oAltar);
        DelayCommand(3.0, DestroyObject(oKelGaras));
    }
    else if(nEvent == 102) // temp death
    {
        object oAltar = GetObjectByTag("Q2C_ALTAR");
        object oKelGaras = GetNearestObjectByTag("Q2_KELGARAS", oAltar);

        DelayCommand(6.0, Revive(oKelGaras));
    }
    else if(nEvent == 103) // replace shrine
    {
        object oOldShrine = GetObjectByTag("Q2C_ALTAR");
        SetLocalLocation(OBJECT_SELF, "SHRINE_SP", GetLocation(oOldShrine));
        DelayCommand(0.5, CreateShrine());
        DestroyObject(oOldShrine);
    }
    else if(nEvent == 104) // bring Ali and attack pc
    {
        // destroy old bedine warriors
        object oArea = GetObjectByTag("q1_OasisoftheGreenPalm"); // the old oasis area
        object oCreature = GetFirstObjectInArea(oArea);
        while(oCreature != OBJECT_INVALID)
        {
            SetPlotFlag(oCreature, FALSE);
            if(GetTag(oCreature) == "Q2A_BEDINE2")
                DestroyObject(oCreature);
            oCreature = GetNextObjectInArea(oArea);
        }
        // being Ali and create warriors
        object oAli = GetObjectByTag("Q2A_ALI");
        SetPlotFlag(oAli, FALSE);
        object oWP1 = GetWaypointByTag("Q3C_WP_ALI_SP");
        object oWP2 = GetWaypointByTag("Q3C_WP_ALI_WALKTO");

        object oPC = GetFirstPC();
        while(oPC != OBJECT_INVALID)
        {
            AdjustReputation(oAli, oPC, -100);
            AdjustReputation(oPC, oAli, -100);
            SetIsTemporaryEnemy(oPC);
            oPC = GetNextPC();
        }
        oPC = GetFirstPC();

        DelayCommand(2.0, Bring(oAli));
        DelayCommand(4.0, AssignCommand(oAli, SpeakStringByStrRef(40549)));
        DelayCommand(4.0, Attack(oAli));

        object oBedine1 = CreateObject(OBJECT_TYPE_CREATURE, "q2a_bedine", GetLocation(oWP1));
        SetPlotFlag(oBedine1, FALSE);
        object oBedine2 = CreateObject(OBJECT_TYPE_CREATURE, "q2a_bedine", GetLocation(oWP1));
        SetPlotFlag(oBedine2, FALSE);
        object oBedine3 = CreateObject(OBJECT_TYPE_CREATURE, "q2a_bedine", GetLocation(oWP1));
        SetPlotFlag(oBedine3, FALSE);
        object oBedine4 = CreateObject(OBJECT_TYPE_CREATURE, "q2a_bedine", GetLocation(oWP1));
        SetPlotFlag(oBedine4, FALSE);

        AdjustReputation(oBedine1, oPC, -100);
        AdjustReputation(oPC, oBedine1, -100);
        SetIsTemporaryEnemy(oPC, oBedine1);
        SetIsTemporaryEnemy(oPC, oBedine2);
        SetIsTemporaryEnemy(oPC, oBedine3);
        SetIsTemporaryEnemy(oPC, oBedine4);

        DelayCommand(3.5, Bring(oBedine1));
        DelayCommand(4.0, Bring(oBedine2));
        DelayCommand(4.5, Bring(oBedine3));
        DelayCommand(5.0, Bring(oBedine4));

        DelayCommand(6.0, Attack(oBedine1));
        DelayCommand(6.0, Attack(oBedine2));
        DelayCommand(6.0, Attack(oBedine3));
        DelayCommand(6.0, Attack(oBedine4));

    }
}
