// chain trap:
// first pull - a little damage(1d6)
// second pull - more damgae (2d6)
// last pull - a lot of damage(6d6) and chain is destroy. If the chain has "X" at the end if its tag -
// then Gauntles of Ogre Power can be found in the debris.

void CreateDust(string sDust)
{
    vector vPos = GetPosition(OBJECT_SELF);
    vPos.z += 2;
    location lLoc = Location(GetArea(OBJECT_SELF), vPos, 0.0);
    //location lLoc = GetLocation(OBJECT_SELF);
    object oDust = CreateObject(OBJECT_TYPE_PLACEABLE, sDust, lLoc, TRUE);
    effect eDust = EffectDeath();
    DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDust, oDust));
}

void Pull(int nDiceDamage, object oPC, string sDust, int nDC)
{
    int nDamage = d6(nDiceDamage) + 1;
    nDamage = GetReflexAdjustedDamage(nDamage, oPC, nDC);
    effect eDamage = EffectDamage(nDamage, DAMAGE_TYPE_BLUDGEONING);
    DelayCommand(1.0, CreateDust(sDust));
    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oPC));
}

void CreateRubble(object oPC)
{
    location lLoc = GetLocation(oPC);
    object oRubbleInv = CreateObject(OBJECT_TYPE_PLACEABLE, "q3b_rubble_inv", lLoc);
    object oRubble = CreateObject(OBJECT_TYPE_PLACEABLE, "q3b_rubble", lLoc);
    DelayCommand(3.0, FloatingTextStrRefOnCreature(40511, oPC));
}

void CreateRubble2(object oPC)
{
    location lLoc = GetLocation(oPC);
    object oRubbleInv = CreateObject(OBJECT_TYPE_PLACEABLE, "q3b_rubble_inv2", lLoc);
    object oRubble = CreateObject(OBJECT_TYPE_PLACEABLE, "q3b_rubble", lLoc);
    DelayCommand(3.0, FloatingTextStrRefOnCreature(40511, oPC));
}


void DestroyChain()
{
    SetPlotFlag(OBJECT_SELF, FALSE);
    effect eDes = EffectDeath();
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDes, OBJECT_SELF);
}

void main()
{
    object oPC = GetLastUsedBy();
    int nCount = GetLocalInt(OBJECT_SELF, "COUNT");
    nCount++;
    SetLocalInt(OBJECT_SELF, "COUNT", nCount);
    AssignCommand(oPC, PlaySound("as_na_rockcavsm1"));
    if(nCount == 1) // first pull
    {
        Pull(1, oPC, "plc_boulder", 14);
        ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
        DelayCommand(0.5, FloatingTextStrRefOnCreature(40512, oPC));
    }
    else if(nCount == 2) // second pull
    {
        Pull(3, oPC, "plc_boulder", 16);
        ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
        DelayCommand(0.5, FloatingTextStrRefOnCreature(40512, oPC));
    }
    else if(nCount == 3) // last pull
    {
        ActionDoCommand(Pull(6, oPC, "plc_boulder", 18));
        if(GetStringRight(GetTag(OBJECT_SELF), 1) == "X")
            ActionDoCommand(CreateRubble(oPC));
        if(GetStringRight(GetTag(OBJECT_SELF), 1) == "Y")
            ActionDoCommand(CreateRubble2(oPC));
        ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
        DelayCommand(2.0, DestroyChain());
    }

}
