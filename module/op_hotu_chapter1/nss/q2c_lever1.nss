//::///////////////////////////////////////////////
//:: Floor Lever 1
//:: q2c_lever1
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When flipped, Floor Lever 1 should
    apply a Slow effect to any PCs that have been
    hit by the goblin 'marker' arrow
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 3/03
//:://////////////////////////////////////////////
void main()
{
    location lLev1 = GetLocation(OBJECT_SELF);

    object oArea = GetArea(OBJECT_SELF);
    object oPlayer = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    //cycle through the PCs party
    object oTarget = GetFirstFactionMember(oPlayer, FALSE);
    while (oTarget != OBJECT_INVALID)
    {
        //if the target has been hit by a marker arrow - apply the lever's effect
        if (GetLocalInt(oTarget, "X2_Q2CGoblinMark") == 1)
        {
            if (GetIsPC(oTarget) == TRUE)
                FloatingTextStrRefOnCreature(84134 , oTarget, FALSE);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_SLOW), oTarget);
            AssignCommand(oArea, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSlow(), oTarget, 18.0));
        }
        oTarget = GetNextFactionMember(oPlayer, FALSE);
    }

    //if the field is being activated
    if (GetLocalInt(OBJECT_SELF,"nActive") != 1)
    {
        SetLocalInt(OBJECT_SELF,"nActive",1);

        //Destroy 'old' red sparks
        object oDestroy = GetObjectByTag("q2c9sparksred1");
        SetPlotFlag(oDestroy, FALSE);
        DestroyObject(oDestroy);
        //Play animation on lever
        AssignCommand(OBJECT_SELF,PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));
        SetLocalInt(OBJECT_SELF,"nActive",1);
        object oSpark1 = CreateObject(OBJECT_TYPE_PLACEABLE, "q2c9_sparkgreen1", lLev1);
        SetPlotFlag(oSpark1, TRUE);


    }
    else
    {

        //Destroy 'old' red sparks
        object oDestroy = GetObjectByTag("q2c9_sparkgreen1");
        SetPlotFlag(oDestroy, FALSE);
        DestroyObject(oDestroy);

        AssignCommand(OBJECT_SELF,PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
        SetLocalInt(OBJECT_SELF,"nActive",0);
        object oSpark2 = CreateObject(OBJECT_TYPE_PLACEABLE, "q2c9sparksred1", lLev1);
        SetPlotFlag(oSpark2, TRUE);


    }
    //Play a funky, Anti-Magic-field going down kind of sound
    object oPC = GetLastUsedBy();
    AssignCommand(oPC,PlaySound("al_mg_jacobs1"));

    //Display some text for the player
    SpeakOneLinerConversation();



}
