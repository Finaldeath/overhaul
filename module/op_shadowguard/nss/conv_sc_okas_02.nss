#include "help_general"

void main()
{
    object oPC = GetPCSpeaker();

    object oWP;
    location lWP;
    effect e;
    int i, iRand;
    float f;
    object o;

    o = GetHenchman(oPC);

    RemoveHenchman(oPC, o);

    o = GetNearestObjectByTag("CT_COMM_SH_GHGD", oPC, 1);
    SetPlotFlag(o, FALSE);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(TRUE), o);

    o = GetNearestObjectByTag("CT_COMM_SH_GHGD", oPC, 2);
    SetPlotFlag(o, FALSE);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(TRUE), o);

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, e, lWP);

    oWP = GetNearestObjectByTag("WP_OKAR_ASSA_01", oPC);
    lWP = GetLocation(oWP);
    e = EffectVisualEffect(VFX_FNF_FIREBALL);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, e, lWP);

    e = EffectVisualEffect(VFX_FNF_SCREEN_SHAKE);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, e, lWP);

    for (i = 2; i < 10; i++)
    {
        oWP = GetNearestObjectByTag("WP_OKAR_ASSA_0" + IntToString(i), oPC);
        lWP = GetLocation(oWP);

        iRand = Random(4);

        switch (iRand)
        {
            case 0: e = EffectVisualEffect(VFX_FNF_FIREBALL);
                break;

            case 1: e = EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_FIRE);
                break;

            case 2: e = EffectVisualEffect(VFX_FNF_IMPLOSION);
                break;

            default: e = EffectVisualEffect(VFX_FNF_SCREEN_BUMP);
                break;

        }

        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, e, lWP);

        CreateObject(OBJECT_TYPE_PLACEABLE, "plac_lrg_flame", lWP);
        o = GetNearestObjectByTag("SOUN_WIND_BREAK", oPC);

        SoundObjectPlay(o);

        DelayCommand(0.5, DestroyObject(o));
    }

    DoAnimationPermanent(oPC, ANIMATION_LOOPING_DEAD_BACK);
}
