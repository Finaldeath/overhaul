//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName q2b_ud_dragon
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Petrify the dragon
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 12/03
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        if (GetLocalInt(OBJECT_SELF, "nStoned") != 1)
        {
            SetLocalInt(OBJECT_SELF, "nStoned", 1);
            effect ePetrify = EffectCutsceneParalyze();
            effect eStone = EffectVisualEffect(VFX_DUR_PETRIFY);
            effect eFreeze = EffectVisualEffect(VFX_DUR_FREEZE_ANIMATION);
            effect eLink1 = EffectLinkEffects(ePetrify, eStone);
            effect eLink = EffectLinkEffects(eLink1, eFreeze);
            object oSelf = OBJECT_SELF;
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLink, oSelf);
            SetPlotFlag(oSelf, TRUE);
        }
    }

}

