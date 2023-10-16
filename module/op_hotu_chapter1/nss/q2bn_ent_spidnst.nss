//::///////////////////////////////////////////////
//:: Name q2bn_ent_spidnst
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Do a Reflex Saving throw to avoid being
    entangled in spiders webs
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 18/03
//:://////////////////////////////////////////////

void CheckAssociates(object oPC);
int GetNumberInParty(object oPC);
void DropSpider(location lTarget, int nNumber, string szResRef);

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;

    FloatingTextStrRefOnCreature(84127 , oPC, FALSE);
    //Do a reflex saving throw vs DC 20 to avoid spiders dropping down on the PC
    if (ReflexSave(oPC, 20) == 0)
    {
        CheckAssociates(oPC);
        //'Web' the PC for 2 rounds
        effect eVis = EffectVisualEffect(VFX_DUR_WEB);
        effect eHold = EffectEntangle();
        effect eLink = EffectLinkEffects(eVis, eHold);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, 12.0);

        //Drop in spiders to attack the PCs (1/Party member - 3 rounds worth
        location lTarget = GetLocation(oPC);
        float fDelay = 12.0;
        int nSpider = GetNumberInParty(oPC);
        DropSpider(lTarget, nSpider + 1, "x2_q2wraithspid");
        DelayCommand(fDelay, DropSpider(lTarget, nSpider, "x2_q2direspider"));
        fDelay = fDelay + 12.0;
        DelayCommand(fDelay, DropSpider(lTarget, nSpider, "x2_q2queenspider"));
        SetLocalInt(OBJECT_SELF, "nTriggered", 1);
    }
}
void CheckAssociates(object oPC)
{
    //'Web' the PC's Associates for 2 rounds
        effect eVis = EffectVisualEffect(VFX_DUR_WEB);
        effect eHold = EffectParalyze();
        effect eLink = EffectLinkEffects(eVis, eHold);
     object oAnimal = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
     if (oAnimal != OBJECT_INVALID)
     {
        if (ReflexSave(oAnimal, 20) == 0)
        {
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oAnimal, 12.0);
        }
     }
     object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
     if (oFamiliar != OBJECT_INVALID)
     {
        if (ReflexSave(oFamiliar, 20) == 0)
        {
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oFamiliar, 12.0);
        }
     }
     object oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);
     if (oHenchman != OBJECT_INVALID)
     {
        if (ReflexSave(oHenchman, 20) == 0)
        {
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oHenchman, 12.0);
        }
     }
     object oSummoned = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC);
     if (oSummoned != OBJECT_INVALID)
     {
        if (ReflexSave(oSummoned, 20) == 0)
        {
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oSummoned, 12.0);
        }
     }
     object oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC);
     if (oDominated != OBJECT_INVALID)
     {
        if (ReflexSave(oDominated, 20) == 0)
        {
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oDominated, 12.0);
        }
     }
}

int GetNumberInParty(object oPC)
{
    int nCount = 0;
    object oPlayer = GetFirstFactionMember(oPC);
    while (oPlayer != OBJECT_INVALID)
    {
        nCount = nCount + 1;
        oPlayer = GetNextFactionMember(oPC);
    }
    return nCount;

}

void DropSpider(location lTarget, int nNumber, string szResRef)
{
    int nCount = 0;
    for (nCount = 0; nCount < nNumber; nCount++)
    {
        CreateObject(OBJECT_TYPE_CREATURE, szResRef, lTarget, TRUE);
    }
}
