// climb down the hole

void main()
{
    object oWP = GetWaypointByTag(GetTag(OBJECT_SELF));
    int DC = 6;
    int nRand = Random(20) + 1;
    int nTotal = nRand + GetAbilityModifier(ABILITY_DEXTERITY, GetPCSpeaker());
    // Failure is anoying...
    //if(nTotal >= 6)
    if(1 + 1 == 2)
    {
        string sMes = GetName(GetPCSpeaker()) + " " + GetStringByStrRef(40515);
        FloatingTextStringOnCreature(sMes, GetPCSpeaker());
        AssignCommand(GetPCSpeaker(), JumpToObject(oWP));

    }
    else
    {
        FloatingTextStrRefOnCreature(40516, GetPCSpeaker());
        nRand = Random(6) + 1;
        effect eDam = EffectDamage(nRand, DAMAGE_TYPE_BLUDGEONING);
        effect eKnock = EffectKnockdown();
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnock, GetPCSpeaker(), 3.0);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, GetPCSpeaker());
    }

}
