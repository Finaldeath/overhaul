//::///////////////////////////////////////////////
//:: Name x2_pkeg_onspell
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If a fire spell is cast at the keg, ignite if
    it has 5 or more hit points left, detonate
    if it has less

*/
//:://////////////////////////////////////////////
//:: Created By:  Georg Zoeller
//:: Created On:  June 12/03
//:://////////////////////////////////////////////

void main()
{
    int iSpell = GetLastSpell();
    if (!GetLastSpellHarmful())
        return;
    // Check if a fire-spell was used
    if (iSpell ==  SPELL_BURNING_HANDS || iSpell ==   SPELL_FIRE_STORM || iSpell == SPELL_FIREBALL || iSpell == SPELL_DELAYED_BLAST_FIREBALL || iSpell == SPELL_SHADES_FIREBALL ||
        iSpell == SPELL_SHADES_WALL_OF_FIRE || iSpell == SPELL_WALL_OF_FIRE || iSpell == SPELL_FLAME_ARROW || iSpell == SPELL_FLAME_LASH ||
        iSpell == SPELL_FLAME_STRIKE || iSpell == SPELL_CONTINUAL_FLAME || iSpell == SPELL_FIREBRAND ||
        iSpell == SPELL_FLARE || iSpell == SPELL_GRENADE_FIRE || iSpell == SPELL_INFERNO)
    {
        if (GetCurrentHitPoints(OBJECT_SELF) >4) // 5+ HP? Ignite
            ExecuteScript("x2_pkeg_ignite",OBJECT_SELF);
        else
            ExecuteScript("x2_pkeg_detonate",OBJECT_SELF);// <5 HP? Detonate!
    }

}
