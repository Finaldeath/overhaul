// give offensive earth prize

void main()
{
    CreateItemOnObject("x1_earthstone", GetPCSpeaker());
    effect eVis = EffectVisualEffect(VFX_IMP_MAGBLUE);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF);
    object oToken = GetItemPossessedBy(GetPCSpeaker(), "Q3B_TOKEN");
    int nTokenNum = GetLocalInt(OBJECT_SELF, "q3_Tokens_Thrown");
    SetLocalInt(OBJECT_SELF, "q3_Tokens_Thrown", (nTokenNum - 1));
}
