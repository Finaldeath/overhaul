// Katriana action taken: Jump ALL players to the Ao Encampment, and set global to load new players into
// the dig-site

// Katriana action taken: Jump ALL players to the oasis, and set global to load new players into the oasis

void RemoveEffects(object oObject)
{
    effect eEffect = GetFirstEffect(oObject);
    while(GetIsEffectValid(eEffect))
    {
        RemoveEffect(oObject, eEffect);
        eEffect = GetNextEffect(oObject);
    }
}

void FakeRestore(object oTarget);

void Restore(object oPC)
{
    object oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN,oPC);
    object oAnimal = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION,oPC);
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR,oPC);
    object oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED,oPC);
    object oSummoned = GetAssociate(ASSOCIATE_TYPE_SUMMONED,oPC);

    FakeRestore(oPC);
    if(GetIsObjectValid(oHenchman))
    {
        FakeRestore(oHenchman);
    }
    if(GetIsObjectValid(oAnimal))
    {
        FakeRestore(oAnimal);
    }
    if(GetIsObjectValid(oFamiliar))
    {
        FakeRestore(oFamiliar);
    }
    if(GetIsObjectValid(oDominated))
    {
        FakeRestore(oDominated);
    }
    if(GetIsObjectValid(oSummoned))
    {
        FakeRestore(oSummoned);
    }
}

void CreatePortal(object oPC)
{
    CreateObject(OBJECT_TYPE_PLACEABLE, "jumpportal", GetLocation(oPC));
}

void main()
{
    object oWP = GetWaypointByTag("Q5_START");
    SetLocalObject(GetModule(), "X1_CURRENT_START", oWP);
    object oPC = GetFirstPC();
    DelayCommand(4.0, CreatePortal(oPC)); // for multiplayer
    while(oPC != OBJECT_INVALID)
    {
        RemoveEffects(oPC);
        Restore(oPC);
        DelayCommand(3.0, AssignCommand(oPC, JumpToObject(oWP)));
        oPC = GetNextPC();
    }
    int nDay = GetCalendarDay() + 1;
    int nMonth = GetCalendarMonth();
    int nYear = GetCalendarYear();
    SetCalendar(nYear, nMonth, nDay);
    SetTime(12, 0, 0, 0);
}


void FakeRestore(object oTarget)
{

    effect eBad = GetFirstEffect(oTarget);
    //Search for negative effects
    while(GetIsEffectValid(eBad))
    {
        if(GetIsEffectValid(eBad)) // remove anyeffect
        {
            //Remove effect if it is negative.
            RemoveEffect(oTarget, eBad);
        }
        eBad = GetNextEffect(oTarget);
    }
    if(GetRacialType(oTarget) != RACIAL_TYPE_UNDEAD)
    {
        //Apply the VFX impact and effects
        int nHeal = GetMaxHitPoints(oTarget) - GetCurrentHitPoints(oTarget);
        effect eHeal = EffectHeal(nHeal);
        if (nHeal > 0)
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oTarget);
    }
}

