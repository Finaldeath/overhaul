//::///////////////////////////////////////////////
//:: Name bat1_emptyarea
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Empty the environs area of all ambient NPCs
    in preparation for battle 1
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 27/03
//:://////////////////////////////////////////////

void main()
{
    //Get rid of all creatures in the city core...except the PC and those with masters (the PCs associates)
    object oArea = GetObjectByTag("q2a_city1");

    object oCreature = GetFirstObjectInArea(oArea);
    string szTag;
    while (GetIsObjectValid(oCreature) == TRUE)
    {
        if (GetObjectType(oCreature) == OBJECT_TYPE_CREATURE)
        {
            if (GetIsPC(oCreature) == FALSE || GetIsObjectValid(GetMaster(oCreature)) == FALSE)
            {
                SetPlotFlag(oCreature, FALSE);
                DestroyObject(oCreature);
            }
        }
        oCreature = GetNextObjectInArea(oArea);
    }
    //Spawn in Battle Herald
    //Replace the Battle herald with Imloth
    location lHSpawn = GetLocation(GetWaypointByTag("wp_q2a_heraldspawn"));
    effect eVis1 = EffectVisualEffect(VFX_FNF_WORD);
    effect eVis2 = EffectVisualEffect(VFX_IMP_DEATH);
    effect eLink = EffectLinkEffects(eVis1, eVis2);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eLink, lHSpawn);
    object oHerald = CreateObject(OBJECT_TYPE_CREATURE, "q2aherald", lHSpawn);
    object oPC = OBJECT_SELF;

    SetLocalInt(oHerald, "nHeralding", 1);
    //AssignCommand(oHerald, JumpToLocation(lHSpawn));
    DelayCommand(3.0, AssignCommand(oHerald, ActionStartConversation(oPC)));

    // Remove immobilize effect from the PC (from end of Throne Room conversation)
    // This gets done when the above conversation is initiated, but every once
    // in a while that conversation doesn't start for some reason. So this will
    // ensure that the player can move again and continue on with the game.
    effect eEffect;
    eEffect = GetFirstEffect(oPC);
    while (GetIsEffectValid(eEffect) == TRUE)
    {
        if (GetEffectType(eEffect) == EFFECT_TYPE_CUTSCENEIMMOBILIZE)
        {
            DelayCommand(4.0,RemoveEffect(oPC, eEffect));
        }
        eEffect = GetNextEffect(oPC);
    }
}
