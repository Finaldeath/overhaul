// Cast Random effect (has a chance of exploding)

void main()
{
    object oPC = GetPCSpeaker();
    int nRand = Random(100) + 1;
    if(GetHasFeat(FEAT_LUCK_DOMAIN_POWER) ||
        GetHasFeat(FEAT_LUCK_OF_HEROES) ||
        GetHasFeat(FEAT_LUCKY))
        {
            nRand += 25;
        }
    if(nRand <= 40) // nothing happens
    {
        FloatingTextStrRefOnCreature(85512, oPC);
    }
    if(nRand <= 50) // device explodes
    {
        ActionCastSpellAtObject(SPELL_FIREBALL, OBJECT_SELF, METAMAGIC_NONE, TRUE, 0,
            PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        SetPlotFlag(OBJECT_SELF, FALSE);
        DelayCommand(1.0, DestroyObject(OBJECT_SELF));
    }
    else if(nRand <= 70) // lightning
    {
        ExecuteScript("q5c_at_device3", OBJECT_SELF);
    }
    else if(nRand <= 80) // sound burst
    {
         ExecuteScript("q5c_at_device6", OBJECT_SELF);
    }
    else if(nRand <= 90) // stone skin
    {
         ExecuteScript("q5c_at_device7", OBJECT_SELF);
    }
    else if(nRand <= 99) // healing circle
    {
         ExecuteScript("q5c_at_device4", OBJECT_SELF);
    }
    else if(nRand >= 100) // knock
    {
         ExecuteScript("q5c_at_device5", OBJECT_SELF);
    }
}
