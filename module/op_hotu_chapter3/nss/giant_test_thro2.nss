void DelayCreate(location lLoc);
void DoExplosion(location lLoc);

void main()
{
    object oGiant = GetNearestObjectByTag("hx_frost_giantm");
    object oWP = GetNearestObjectByTag("hx_frost_giantm_throw");
    location lLoc = GetLocation(oWP);

    location lScorch1 = GetLocation(GetObjectByTag("hx_scorch1_wp"));
    location lScorch2 = GetLocation(GetObjectByTag("hx_scorch2_wp"));

    AssignCommand(oGiant, ActionCastFakeSpellAtObject(751, GetNearestObjectByTag("ArcheryTarget"), PROJECTILE_PATH_TYPE_DEFAULT));
    DelayCommand(4.0, DoExplosion(lLoc));
    //DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIREBALL), GetNearestObjectByTag("ArcheryTarget")));
    //DelayCommand(3.0, DelayCreate(lScorch1));
   // DelayCommand(4.8, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_BUMP), oGiant));
    //DelayCommand(4.0, DelayCreate(lScorch2));
   // DelayCommand(5.6, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_BUMP), oGiant));
}

void DelayCreate(location lLoc)
{
    CreateObject(OBJECT_TYPE_PLACEABLE, "hx_scorch", lLoc);
}

void DoExplosion(location lLoc)
{
    object oExplode = CreateObject(OBJECT_TYPE_PLACEABLE, "hx_br_catapult", lLoc);
    DelayCommand(0.2, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(1000), oExplode));
    DelayCommand(0.3, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_BUMP), lLoc));
    DelayCommand(0.3, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(354), lLoc));
    // 354
}
