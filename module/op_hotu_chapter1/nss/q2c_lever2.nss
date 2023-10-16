//::///////////////////////////////////////////////
//:: Floor Lever 2
//:: q2c_lever2
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When flipped, Floor Lever 2 should apply
    a Bane effect to any pc hit by a goblin
    'marker' arrow
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 3/03
//:://////////////////////////////////////////////
void main()
{
    object oArea = GetArea(OBJECT_SELF);
    object oPlayer = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    //cycle through the PCs party
    effect eAttack = EffectAttackDecrease(1);
    effect eSave = EffectSavingThrowDecrease(SAVING_THROW_ALL, 1, SAVING_THROW_TYPE_FEAR);
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
    effect eLink = EffectLinkEffects(eAttack, eSave);
    eLink = EffectLinkEffects(eLink, eDur);
    object oTarget = GetFirstFactionMember(oPlayer, FALSE);
    while (oTarget != OBJECT_INVALID)
    {
        //if the target has been hit by a marker arrow - apply the lever's effect
        if (GetLocalInt(oTarget, "X2_Q2CGoblinMark") == 1)
        {
            if (GetIsPC(oTarget) == TRUE)
                FloatingTextStrRefOnCreature(84134 , oTarget, FALSE);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HEAD_EVIL), oTarget);
            AssignCommand(oArea, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, 18.0));
        }
        oTarget = GetNextFactionMember(oPlayer, FALSE);
    }


    location lLev1 = GetLocation(OBJECT_SELF);

    //if the field is being activated
    if (GetLocalInt(OBJECT_SELF,"nActive") != 1)
    {

        SetLocalInt(OBJECT_SELF,"nActive",1);
        //Destroy 'old' red sparks
        object oDestroy = GetObjectByTag("q2c9sparksred2");
        SetPlotFlag(oDestroy, FALSE);
        DestroyObject(oDestroy);
        //Play animation on lever
        AssignCommand(OBJECT_SELF,PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));
        SetLocalInt(OBJECT_SELF,"nActive",1);
        object oSpark1 = CreateObject(OBJECT_TYPE_PLACEABLE, "q2c9_sparkgreen2", lLev1);
        SetPlotFlag(oSpark1, TRUE);

    }
    else
    {

        //Destroy 'old' red sparks
        object oDestroy = GetObjectByTag("q2c9_sparkgreen2");
        SetPlotFlag(oDestroy, FALSE);
        DestroyObject(oDestroy);

        AssignCommand(OBJECT_SELF,PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
        SetLocalInt(OBJECT_SELF,"nActive",0);
        object oSpark2 = CreateObject(OBJECT_TYPE_PLACEABLE, "q2c9sparksred2", lLev1);
        SetPlotFlag(oSpark2, TRUE);

    }
    //Play a funky, Anti-Magic-field going down kind of sound
    object oPC = GetLastUsedBy();
    AssignCommand(oPC,PlaySound("al_mg_jacobs1"));
       //Display some text for the player
    SpeakOneLinerConversation();



}
