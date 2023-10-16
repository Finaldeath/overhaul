//::///////////////////////////////////////////////
//:: Name q2csarc_spellat
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If Raise Dead or Ressurect is cast at the tomb,
    raise Linu (one time only) - if the Rakshasa
    have not transformed before, transform them
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 23/03
//:://////////////////////////////////////////////
void RaiseLinu(location lSpawn, object oRaiser);

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nLinuRaised") == 1)
        return;

    if (GetLastSpell() == SPELL_RAISE_DEAD || GetLastSpell()  == SPELL_RESURRECTION)
    {
        SetLocalInt(OBJECT_SELF, "nLinuRaised", 1);

        location lSpawn = GetLocation(GetWaypointByTag("wp_q2clinu_spawn"));
        effect eVis = EffectVisualEffect(VFX_IMP_RAISE_DEAD);
        object oPC = GetLastSpellCaster();

        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lSpawn);
        DelayCommand(0.5, RaiseLinu(lSpawn, oPC));

    }
}

void RaiseLinu(location lSpawn, object oRaiser)
{
    object oLinu = CreateObject(OBJECT_TYPE_CREATURE, "x2_hen_linu2", lSpawn);
    //Level up Linu a bit so she doesn't get killed
    int nLevel;
    for (nLevel = 0; nLevel < 10; nLevel++)
    {
        LevelUpHenchman(oLinu);
    }

    object oArea = GetArea(oRaiser);
    //Transform Rakshasa if they haven't been already..
    //and if they aren't around - have Linu talk to the PC..
    if (GetLocalInt(oArea, "X2_RakTransformed") != 1)
        ExecuteScript("act_q2rakattack", oArea);
    else
        DelayCommand(1.0, AssignCommand(oLinu, ActionStartConversation(oRaiser, "q2alinu")));
}
