void main()
{
    ActionTakeItem(GetObjectByTag("M2Q1ITSILPOTION"),GetLastSpeaker());
    SetLocalInt(GetModule(),"M2Q1GethCured",1);
    // * Drink Potion

effect eVis = EffectVisualEffect(VFX_IMP_REMOVE_CONDITION);

object oTarget = OBJECT_SELF;

ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);

}


