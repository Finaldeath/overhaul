// Path damage trigger on-enter event: damage anyone (except for mephits) only if the current path is not active

int ACTIVE_PATH_NONE  = 0;
int ACTIVE_PATH_WATER = 1;
int ACTIVE_PATH_AIR   = 2;
int ACTIVE_PATH_EARTH = 3;
int ACTIVE_PATH_FIRE  = 4;

int HARM_ONLY_PC = 0; // when 1: harm only pc and elementals, when 0: everyone
int DAMAGE_MULT = 2; // number of d6 to roll damage

void main()
{
    object oEnter = GetEnteringObject();
    int nElemental = 0;
    if(GetRacialType(oEnter) == RACIAL_TYPE_ELEMENTAL)
        nElemental = 1;
    if(HARM_ONLY_PC == 1 && (!GetIsPC(oEnter) && (nElemental == 0)))
        return;
    if(GetStringRight(GetTag(oEnter), 6) == "MEPHIT")
        return; // do not harm mephits

    int nActivePath = GetLocalInt(GetArea(OBJECT_SELF), "Q3_CURRENT_ACTIVE_PATH");

    // getting the element type of this trigger - the number at the postfix of the trigger

    int nType = StringToInt(GetStringRight(GetTag(OBJECT_SELF), 1));

    if(nActivePath == nType)
        return; // player is in the right place

    int nDamageType;
    int nEffectType;
    if(nElemental == 1)
        DAMAGE_MULT *= 2;

    if(nType == ACTIVE_PATH_WATER)
    {
        nDamageType = DAMAGE_TYPE_COLD;
        if(nElemental == 1)
            nEffectType = VFX_IMP_FROST_L;
        else
            nEffectType = VFX_IMP_FROST_S;
    }
    else if(nType == ACTIVE_PATH_AIR)
    {
        nDamageType = DAMAGE_TYPE_ELECTRICAL;
        if(nElemental == 1)
            nEffectType = VFX_IMP_LIGHTNING_M;
        else
            nEffectType = VFX_IMP_LIGHTNING_S;
    }
    else if(nType == ACTIVE_PATH_EARTH)
    {
        nDamageType = DAMAGE_TYPE_ACID;
        if(nElemental == 1)
            nEffectType = VFX_IMP_ACID_L;
        else
            nEffectType = VFX_IMP_ACID_S;
    }
    else if(nType == ACTIVE_PATH_FIRE)
    {
        nDamageType = DAMAGE_TYPE_FIRE;
        if(nElemental == 1)
            nEffectType = VFX_IMP_FLAME_M;
        else
            nEffectType = VFX_IMP_FLAME_S;
    }

    int nDam = d6(DAMAGE_MULT);
    effect eVis = EffectVisualEffect(nEffectType);
    effect eDam = EffectDamage(nDam, nDamageType);
    effect eLink = EffectLinkEffects(eVis, eDam);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oEnter);

}
