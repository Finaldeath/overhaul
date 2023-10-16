void DelayCreate(location lLoc);

void main()
{
    object oGiant = GetNearestObjectByTag("hx_frost_giantm");
    object oWP = GetNearestObjectByTag("hx_frost_giantm_throw");
    location lLoc = GetLocation(oWP);

    location lScorch1 = GetLocation(GetObjectByTag("hx_scorch1_wp"));
    location lScorch2 = GetLocation(GetObjectByTag("hx_scorch2_wp"));

    AssignCommand(oGiant, ActionCastFakeSpellAtLocation(744, lLoc, PROJECTILE_PATH_TYPE_DEFAULT));
    DelayCommand(3.8, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_BUMP), oGiant));
    DelayCommand(3.0, DelayCreate(lScorch1));
    DelayCommand(4.8, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_BUMP), oGiant));
    DelayCommand(4.0, DelayCreate(lScorch2));
    DelayCommand(5.6, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_BUMP), oGiant));
}

void DelayCreate(location lLoc)
{
    CreateObject(OBJECT_TYPE_PLACEABLE, "hx_scorch", lLoc);
}
