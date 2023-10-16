// climb down the hole

void main()
{
    string sWP = GetLocalString(OBJECT_SELF, "Q1_HOLE_DEST");
    object oWP = GetWaypointByTag(sWP);
    int DC = 12;
    int nRand = Random(20) + 1;
    int nTotal = nRand + GetAbilityModifier(ABILITY_DEXTERITY, GetPCSpeaker());
    // Failure is anoying...
    //if(nTotal >= 6)
    if(1 + 1 == 2)
    {
        string sMes = GetName(GetPCSpeaker()) + " " + GetStringByStrRef(40517);
        FloatingTextStringOnCreature(sMes, GetPCSpeaker());
    }
    else
    {
        string sMes = GetName(GetPCSpeaker()) + " " + GetStringByStrRef(40518);
        FloatingTextStringOnCreature(sMes, GetPCSpeaker());
        nRand = Random(6) + 1;
        effect eDam = EffectDamage(nRand, DAMAGE_TYPE_BLUDGEONING);
        effect eKnock = EffectKnockdown();
        DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnock, GetPCSpeaker(), 3.0));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, GetPCSpeaker());
    }
    AssignCommand(GetPCSpeaker(), JumpToObject(oWP));
    object oZidan = GetNearestObjectByTag("Q1_ZIDAN");
    if(GetLocalObject(oZidan, "Q1_FOLLOW") == GetLastUsedBy())
        AssignCommand(oZidan, JumpToObject(oWP));


}
