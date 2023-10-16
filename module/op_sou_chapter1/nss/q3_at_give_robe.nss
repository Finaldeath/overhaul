// give 2 token robe

void main()
{
    CreateItemOnObject("robeofelem", GetPCSpeaker());
    //object oToken = GetItemPossessedBy(GetPCSpeaker(), "Q3B_TOKEN");
    //DestroyObject(oToken);
    //oToken = GetItemPossessedBy(GetPCSpeaker(), "Q3B_TOKEN");
    //DestroyObject(oToken);
    effect eVis = EffectVisualEffect(VFX_IMP_MAGBLUE);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF);
    SetLocalInt(OBJECT_SELF, "q3_Tokens_Thrown", 0);
}
